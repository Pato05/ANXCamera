package com.arcsoft.avatar.gl;

import android.opengl.GLES20;
import java.nio.Buffer;

public class GLFramebuffer {

    /* renamed from: f  reason: collision with root package name */
    private static final String f59f = "GLFramebuffer";

    /* renamed from: a  reason: collision with root package name */
    int[] f60a = new int[1];

    /* renamed from: b  reason: collision with root package name */
    int[] f61b = new int[1];

    /* renamed from: c  reason: collision with root package name */
    int[] f62c = new int[1];

    /* renamed from: d  reason: collision with root package name */
    int[] f63d = new int[1];

    /* renamed from: e  reason: collision with root package name */
    boolean f64e;
    private int g;
    private int h;

    private void a() {
        this.f62c[0] = 0;
        this.f61b[0] = 0;
        this.f63d[0] = 0;
        this.h = 0;
        this.g = 0;
        this.f64e = false;
    }

    public void bind(boolean z, boolean z2) {
        if (z) {
            GLES20.glEnable(2929);
        }
        GLES20.glGetIntegerv(36006, this.f60a, 0);
        GLES20.glBindFramebuffer(36160, this.f61b[0]);
        if (z2) {
            GLES20.glClear(16640);
        }
    }

    public int getHeight() {
        return this.h;
    }

    public int getTextureId() {
        return this.f62c[0];
    }

    public int getWidth() {
        return this.g;
    }

    public void init(int i, int i2, boolean z) {
        a();
        this.g = i;
        this.h = i2;
        this.f64e = z;
        int[] iArr = this.f60a;
        iArr[0] = 0;
        this.f61b[0] = 0;
        this.f62c[0] = 0;
        GLES20.glGetIntegerv(36006, iArr, 0);
        GLES20.glGenFramebuffers(1, this.f61b, 0);
        GLES20.glBindFramebuffer(36160, this.f61b[0]);
        GLES20.glPixelStorei(3317, 1);
        GLES20.glGenTextures(1, this.f62c, 0);
        GLES20.glBindTexture(3553, this.f62c[0]);
        GLES20.glTexParameteri(3553, 10241, 9728);
        GLES20.glTexParameteri(3553, 10240, 9728);
        GLES20.glTexParameteri(3553, 10242, 33071);
        GLES20.glTexParameteri(3553, 10243, 33071);
        GLES20.glTexImage2D(3553, 0, 6408, this.g, this.h, 0, 6408, 5121, (Buffer) null);
        GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.f62c[0], 0);
        if (this.f64e) {
            GLES20.glGenRenderbuffers(1, this.f63d, 0);
            GLES20.glBindRenderbuffer(36161, this.f63d[0]);
            GLES20.glRenderbufferStorage(36161, 33190, this.g, this.h);
            GLES20.glFramebufferRenderbuffer(36160, 36096, 36161, this.f63d[0]);
        }
        GLES20.glCheckFramebufferStatus(36160);
        GLES20.glBindFramebuffer(36160, this.f60a[0]);
        GLES20.glBindTexture(3553, 0);
    }

    public boolean isIsNeedDepth() {
        return this.f64e;
    }

    public void unBind(boolean z, boolean z2) {
        if (z) {
            GLES20.glFinish();
        }
        if (z2) {
            GLES20.glDisable(2929);
        }
        GLES20.glBindFramebuffer(36160, this.f60a[0]);
    }

    public void unInit() {
        GLES20.glDeleteTextures(1, this.f62c, 0);
        this.f62c[0] = 0;
        GLES20.glDeleteFramebuffers(1, this.f61b, 0);
        this.f61b[0] = 0;
        if (this.f64e) {
            GLES20.glDeleteRenderbuffers(1, this.f63d, 0);
            this.f63d[0] = 0;
        }
        this.h = 0;
        this.g = 0;
    }
}
