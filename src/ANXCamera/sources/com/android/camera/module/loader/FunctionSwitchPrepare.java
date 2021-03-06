package com.android.camera.module.loader;

import com.android.camera.Camera;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.backup.DataBackUp;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.module.BaseModule;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol;
import io.reactivex.Scheduler;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;

public class FunctionSwitchPrepare extends Func1Base<Camera, BaseModule> {
    private int mResetType;

    public FunctionSwitchPrepare(int i, int i2) {
        super(i);
        this.mResetType = i2;
    }

    private void reconfigureData() {
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        DataBackUp backUp = DataRepository.getInstance().backUp();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        backUp.backupRunning(dataItemRunning, dataItemGlobal.getDataBackUpKey(this.mTargetMode), dataItemGlobal.getLastCameraId(), true);
        if (this.mResetType == 5) {
            DataRepository.dataItemConfig().editor().remove(CameraSettings.KEY_ZOOM).remove(CameraSettings.KEY_EXPOSURE).apply();
            backUp.revertRunning(dataItemRunning, dataItemGlobal.getDataBackUpKey(this.mTargetMode), dataItemGlobal.getCurrentCameraId());
        }
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<Camera> nullHolder) throws Exception {
        if (!nullHolder.isPresent()) {
            return NullHolder.ofNullable(null, 234);
        }
        Camera camera = nullHolder.get();
        if (camera.isFinishing()) {
            return NullHolder.ofNullable(null, 235);
        }
        ModeProtocol.BottomPopupTips bottomPopupTips = (ModeProtocol.BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.directlyHideTips();
        }
        ((ModeProtocol.BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).getAnimationComposite().setClickEnable(false);
        reconfigureData();
        camera.changeRequestOrientation();
        BaseModule baseModule = (BaseModule) camera.getCurrentModule();
        baseModule.closeCamera();
        return NullHolder.ofNullable(baseModule);
    }

    public Scheduler getWorkThread() {
        return AndroidSchedulers.mainThread();
    }
}
