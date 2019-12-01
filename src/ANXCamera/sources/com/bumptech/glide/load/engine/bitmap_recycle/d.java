package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;

/* compiled from: BitmapPool */
public interface d {
    void P();

    @NonNull
    Bitmap b(int i, int i2, Bitmap.Config config);

    void b(float f);

    void d(Bitmap bitmap);

    @NonNull
    Bitmap g(int i, int i2, Bitmap.Config config);

    long getMaxSize();

    void trimMemory(int i);
}