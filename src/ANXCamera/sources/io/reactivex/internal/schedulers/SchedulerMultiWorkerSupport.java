package io.reactivex.internal.schedulers;

import io.reactivex.Scheduler;
import io.reactivex.annotations.Experimental;
import io.reactivex.annotations.NonNull;

@Experimental
public interface SchedulerMultiWorkerSupport {

    public interface WorkerCallback {
        void onWorker(int i, @NonNull Scheduler.Worker worker);
    }

    void createWorkers(int i, @NonNull WorkerCallback workerCallback);
}
