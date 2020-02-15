package io.reactivex.internal.operators.maybe;

import io.reactivex.Flowable;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.annotations.Nullable;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.SimpleQueue;
import io.reactivex.internal.subscriptions.BasicIntQueueSubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.AtomicThrowable;
import io.reactivex.internal.util.BackpressureHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReferenceArray;
import org.reactivestreams.Subscriber;

public final class MaybeMergeArray<T> extends Flowable<T> {
    final MaybeSource<? extends T>[] sources;

    static final class ClqSimpleQueue<T> extends ConcurrentLinkedQueue<T> implements SimpleQueueWithConsumerIndex<T> {
        private static final long serialVersionUID = -4025173261791142821L;
        int consumerIndex;
        final AtomicInteger producerIndex = new AtomicInteger();

        ClqSimpleQueue() {
        }

        public int consumerIndex() {
            return this.consumerIndex;
        }

        public void drop() {
            poll();
        }

        public boolean offer(T t) {
            this.producerIndex.getAndIncrement();
            return super.offer(t);
        }

        public boolean offer(T t, T t2) {
            throw new UnsupportedOperationException();
        }

        @Nullable
        public T poll() {
            T poll = super.poll();
            if (poll != null) {
                this.consumerIndex++;
            }
            return poll;
        }

        public int producerIndex() {
            return this.producerIndex.get();
        }
    }

    static final class MergeMaybeObserver<T> extends BasicIntQueueSubscription<T> implements MaybeObserver<T> {
        private static final long serialVersionUID = -660395290758764731L;
        final Subscriber<? super T> actual;
        volatile boolean cancelled;
        long consumed;
        final AtomicThrowable error = new AtomicThrowable();
        boolean outputFused;
        final SimpleQueueWithConsumerIndex<Object> queue;
        final AtomicLong requested = new AtomicLong();
        final CompositeDisposable set = new CompositeDisposable();
        final int sourceCount;

        MergeMaybeObserver(Subscriber<? super T> subscriber, int i, SimpleQueueWithConsumerIndex<Object> simpleQueueWithConsumerIndex) {
            this.actual = subscriber;
            this.sourceCount = i;
            this.queue = simpleQueueWithConsumerIndex;
        }

        public void cancel() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.set.dispose();
                if (getAndIncrement() == 0) {
                    this.queue.clear();
                }
            }
        }

        public void clear() {
            this.queue.clear();
        }

        /* access modifiers changed from: package-private */
        public void drain() {
            if (getAndIncrement() == 0) {
                if (this.outputFused) {
                    drainFused();
                } else {
                    drainNormal();
                }
            }
        }

        /* access modifiers changed from: package-private */
        public void drainFused() {
            Subscriber<? super T> subscriber = this.actual;
            SimpleQueueWithConsumerIndex<Object> simpleQueueWithConsumerIndex = this.queue;
            int i = 1;
            while (!this.cancelled) {
                Throwable th = (Throwable) this.error.get();
                if (th != null) {
                    simpleQueueWithConsumerIndex.clear();
                    subscriber.onError(th);
                    return;
                }
                boolean z = simpleQueueWithConsumerIndex.producerIndex() == this.sourceCount;
                if (!simpleQueueWithConsumerIndex.isEmpty()) {
                    subscriber.onNext(null);
                }
                if (z) {
                    subscriber.onComplete();
                    return;
                }
                i = addAndGet(-i);
                if (i == 0) {
                    return;
                }
            }
            simpleQueueWithConsumerIndex.clear();
        }

        /* access modifiers changed from: package-private */
        public void drainNormal() {
            int i;
            Subscriber<? super T> subscriber = this.actual;
            SimpleQueueWithConsumerIndex<Object> simpleQueueWithConsumerIndex = this.queue;
            long j = this.consumed;
            int i2 = 1;
            do {
                long j2 = this.requested.get();
                while (true) {
                    i = (j > j2 ? 1 : (j == j2 ? 0 : -1));
                    if (i == 0) {
                        break;
                    } else if (this.cancelled) {
                        simpleQueueWithConsumerIndex.clear();
                        return;
                    } else if (((Throwable) this.error.get()) != null) {
                        simpleQueueWithConsumerIndex.clear();
                        subscriber.onError(this.error.terminate());
                        return;
                    } else if (simpleQueueWithConsumerIndex.consumerIndex() == this.sourceCount) {
                        subscriber.onComplete();
                        return;
                    } else {
                        Object poll = simpleQueueWithConsumerIndex.poll();
                        if (poll == null) {
                            break;
                        } else if (poll != NotificationLite.COMPLETE) {
                            subscriber.onNext(poll);
                            j++;
                        }
                    }
                }
                if (i == 0) {
                    if (((Throwable) this.error.get()) != null) {
                        simpleQueueWithConsumerIndex.clear();
                        subscriber.onError(this.error.terminate());
                        return;
                    }
                    while (simpleQueueWithConsumerIndex.peek() == NotificationLite.COMPLETE) {
                        simpleQueueWithConsumerIndex.drop();
                    }
                    if (simpleQueueWithConsumerIndex.consumerIndex() == this.sourceCount) {
                        subscriber.onComplete();
                        return;
                    }
                }
                this.consumed = j;
                i2 = addAndGet(-i2);
            } while (i2 != 0);
        }

        /* access modifiers changed from: package-private */
        public boolean isCancelled() {
            return this.cancelled;
        }

        public boolean isEmpty() {
            return this.queue.isEmpty();
        }

        public void onComplete() {
            this.queue.offer(NotificationLite.COMPLETE);
            drain();
        }

        public void onError(Throwable th) {
            if (this.error.addThrowable(th)) {
                this.set.dispose();
                this.queue.offer(NotificationLite.COMPLETE);
                drain();
                return;
            }
            RxJavaPlugins.onError(th);
        }

        public void onSubscribe(Disposable disposable) {
            this.set.add(disposable);
        }

        public void onSuccess(T t) {
            this.queue.offer(t);
            drain();
        }

        @Nullable
        public T poll() throws Exception {
            T poll;
            do {
                poll = this.queue.poll();
            } while (poll == NotificationLite.COMPLETE);
            return poll;
        }

        public void request(long j) {
            if (SubscriptionHelper.validate(j)) {
                BackpressureHelper.add(this.requested, j);
                drain();
            }
        }

        public int requestFusion(int i) {
            if ((i & 2) == 0) {
                return 0;
            }
            this.outputFused = true;
            return 2;
        }
    }

    static final class MpscFillOnceSimpleQueue<T> extends AtomicReferenceArray<T> implements SimpleQueueWithConsumerIndex<T> {
        private static final long serialVersionUID = -7969063454040569579L;
        int consumerIndex;
        final AtomicInteger producerIndex = new AtomicInteger();

        MpscFillOnceSimpleQueue(int i) {
            super(i);
        }

        public void clear() {
            while (poll() != null) {
                if (isEmpty()) {
                    return;
                }
            }
        }

        public int consumerIndex() {
            return this.consumerIndex;
        }

        public void drop() {
            int i = this.consumerIndex;
            lazySet(i, (Object) null);
            this.consumerIndex = i + 1;
        }

        public boolean isEmpty() {
            return this.consumerIndex == producerIndex();
        }

        public boolean offer(T t) {
            ObjectHelper.requireNonNull(t, "value is null");
            int andIncrement = this.producerIndex.getAndIncrement();
            if (andIncrement >= length()) {
                return false;
            }
            lazySet(andIncrement, t);
            return true;
        }

        public boolean offer(T t, T t2) {
            throw new UnsupportedOperationException();
        }

        public T peek() {
            int i = this.consumerIndex;
            if (i == length()) {
                return null;
            }
            return get(i);
        }

        @Nullable
        public T poll() {
            int i = this.consumerIndex;
            if (i == length()) {
                return null;
            }
            AtomicInteger atomicInteger = this.producerIndex;
            do {
                T t = get(i);
                if (t != null) {
                    this.consumerIndex = i + 1;
                    lazySet(i, (Object) null);
                    return t;
                }
            } while (atomicInteger.get() != i);
            return null;
        }

        public int producerIndex() {
            return this.producerIndex.get();
        }
    }

    interface SimpleQueueWithConsumerIndex<T> extends SimpleQueue<T> {
        int consumerIndex();

        void drop();

        T peek();

        @Nullable
        T poll();

        int producerIndex();
    }

    public MaybeMergeArray(MaybeSource<? extends T>[] maybeSourceArr) {
        this.sources = maybeSourceArr;
    }

    /* access modifiers changed from: protected */
    public void subscribeActual(Subscriber<? super T> subscriber) {
        MaybeSource<? extends T>[] maybeSourceArr = this.sources;
        int length = maybeSourceArr.length;
        MergeMaybeObserver mergeMaybeObserver = new MergeMaybeObserver(subscriber, length, length <= Flowable.bufferSize() ? new MpscFillOnceSimpleQueue(length) : new ClqSimpleQueue());
        subscriber.onSubscribe(mergeMaybeObserver);
        AtomicThrowable atomicThrowable = mergeMaybeObserver.error;
        int length2 = maybeSourceArr.length;
        int i = 0;
        while (i < length2) {
            MaybeSource<? extends T> maybeSource = maybeSourceArr[i];
            if (!mergeMaybeObserver.isCancelled() && atomicThrowable.get() == null) {
                maybeSource.subscribe(mergeMaybeObserver);
                i++;
            } else {
                return;
            }
        }
    }
}
