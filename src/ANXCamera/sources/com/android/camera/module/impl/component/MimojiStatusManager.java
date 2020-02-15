package com.android.camera.module.impl.component;

import com.android.camera.fragment.mimoji.FragmentMimoji;
import com.android.camera.fragment.mimoji.MimojiInfo;

public class MimojiStatusManager {
    public static int MIMOJI_CREATE = 4;
    public static int MIMOJI_EDIT_MID = 8;
    public static int MIMOJI_EIDT = 16;
    public static int MIMOJI_NONE = 0;
    public static int MIMOJI_PREVIEW = 2;
    private MimojiInfo mCurrentMimojiInfo;
    private volatile boolean mIsLoading = false;
    private int mMode = MIMOJI_NONE;
    private boolean mPannelState = false;

    public boolean IsInMimojiCreate() {
        return this.mMode == MIMOJI_CREATE;
    }

    public boolean IsInMimojiEdit() {
        return this.mMode == MIMOJI_EIDT;
    }

    public boolean IsInMimojiEditMid() {
        return this.mMode == MIMOJI_EDIT_MID;
    }

    public boolean IsInMimojiPreview() {
        return this.mMode <= MIMOJI_PREVIEW;
    }

    public boolean IsInPreviewSurface() {
        return this.mMode <= MIMOJI_CREATE;
    }

    public boolean IsLoading() {
        return this.mIsLoading;
    }

    public synchronized String getCurrentMimojiState() {
        if (this.mCurrentMimojiInfo == null) {
            return FragmentMimoji.CLOSE_STATE;
        }
        String str = this.mCurrentMimojiInfo.mConfigPath;
        return (str == null || str.isEmpty()) ? FragmentMimoji.CLOSE_STATE : str;
    }

    public boolean getMimojiPannelState() {
        return this.mPannelState;
    }

    public synchronized int getMode() {
        return this.mMode;
    }

    public MimojiInfo getmCurrentMimojiInfo() {
        return this.mCurrentMimojiInfo;
    }

    public synchronized void reset() {
        this.mMode = MIMOJI_NONE;
        setMimojiPannelState(false);
        this.mCurrentMimojiInfo = null;
    }

    public void setCurrentMimojiCloseState() {
        if (this.mCurrentMimojiInfo == null) {
            this.mCurrentMimojiInfo = new MimojiInfo();
        }
        this.mCurrentMimojiInfo.mConfigPath = FragmentMimoji.CLOSE_STATE;
    }

    public synchronized void setIsLoading(boolean z) {
        this.mIsLoading = z;
    }

    public void setMimojiPannelState(boolean z) {
        this.mPannelState = z;
    }

    public synchronized void setMode(int i) {
        this.mMode = i;
    }

    public void setmCurrentMimojiInfo(MimojiInfo mimojiInfo) {
        this.mCurrentMimojiInfo = mimojiInfo;
    }
}
