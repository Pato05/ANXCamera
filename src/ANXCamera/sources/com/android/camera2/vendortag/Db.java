package com.android.camera2.vendortag;

import java.util.function.Supplier;

/* compiled from: lambda */
public final /* synthetic */ class Db implements Supplier {
    public static final /* synthetic */ Db INSTANCE = new Db();

    private /* synthetic */ Db() {
    }

    public final Object get() {
        return CaptureRequestVendorTags.Of();
    }
}
