package com.android.camera.effect;

import android.graphics.Bitmap;
import com.android.camera.log.Log;
import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import java.util.Locale;
import java.util.Map;

public class ArcsoftBeautyProcessor extends IntelligentBeautyProcessor {
    private static final float CAMERA_BEAUTY_PARAM_MAX = 10.0f;
    private static final float EXTRA_SPAN = 2.0f;
    private static final String TAG = ArcsoftBeautyProcessor.class.getSimpleName();
    private int mEnlargeEyeRatio;
    private int mShrinkFaceRatio;
    private int mSmoothStrength;
    private int mWhiteStrength;

    public ArcsoftBeautyProcessor() {
        setExtraSpan(2.0f);
        this.mLevelParameters = new float[][]{new float[]{0.0f, 0.0f, 0.0f, 0.0f}, new float[]{1.0f, 1.0f, 1.0f, 1.0f}, new float[]{3.0f, 3.0f, 3.0f, 3.0f}, new float[]{5.0f, 5.0f, 5.0f, 5.0f}, new float[]{7.0f, 7.0f, 7.0f, 7.0f}, new float[]{8.0f, 8.0f, 8.0f, 8.0f}};
    }

    private void dumpParams() {
        Log.v(TAG, String.format(Locale.ENGLISH, "beautyParams: shrinkFace=%d largeEye=%d whiteSkin=%d smoothSkin=%d", new Object[]{Integer.valueOf(this.mShrinkFaceRatio), Integer.valueOf(this.mEnlargeEyeRatio), Integer.valueOf(this.mWhiteStrength), Integer.valueOf(this.mSmoothStrength)}));
    }

    private int getDegreeByValue(BeautyParameterType beautyParameterType, float f) {
        float[] supportedParamRange = getSupportedParamRange(beautyParameterType);
        return supportedParamRange.length < 2 ? Math.round(f) : Math.round(((f - supportedParamRange[0]) / supportedParamRange[1]) * 10.0f);
    }

    private void updateBeautyParameter(BeautyParameterType beautyParameterType, Float f) {
        int degreeByValue = getDegreeByValue(beautyParameterType, f != null ? f.floatValue() : 0.0f);
        switch (beautyParameterType) {
            case ENLARGE_EYE_RATIO:
                this.mEnlargeEyeRatio = degreeByValue;
                return;
            case SHRINK_FACE_RATIO:
                this.mShrinkFaceRatio = degreeByValue;
                return;
            case WHITEN_STRENGTH:
                this.mWhiteStrength = degreeByValue;
                return;
            case SMOOTH_STRENGTH:
                this.mSmoothStrength = degreeByValue;
                return;
            default:
                return;
        }
    }

    public int beautify(byte[] bArr, int i, int i2) {
        return 0;
    }

    public void beautify(int i, int i2, int i3, int i4) {
    }

    public void beautify(Bitmap bitmap, int i, int i2) {
    }

    public void beautify(byte[] bArr, int i, int i2, int i3, byte[] bArr2, int i4) {
    }

    public void clearBeautyParameters() {
        this.mShrinkFaceRatio = 0;
        this.mEnlargeEyeRatio = 0;
        this.mWhiteStrength = 0;
        this.mSmoothStrength = 0;
    }

    public BeautyParameterType[] getSupportedBeautyParamTypes() {
        return new BeautyParameterType[]{BeautyParameterType.ENLARGE_EYE_RATIO, BeautyParameterType.SHRINK_FACE_RATIO, BeautyParameterType.WHITEN_STRENGTH, BeautyParameterType.SMOOTH_STRENGTH};
    }

    public float[] getSupportedParamRange(BeautyParameterType beautyParameterType) {
        switch (beautyParameterType) {
            case ENLARGE_EYE_RATIO:
            case SHRINK_FACE_RATIO:
            case WHITEN_STRENGTH:
            case SMOOTH_STRENGTH:
                return new float[]{0.0f, 10.0f};
            default:
                return new float[0];
        }
    }

    public void init(int i, int i2) {
    }

    public void onDisplaySizeChanged(int i, int i2) {
    }

    public void release() {
    }

    public void setBeautyParamDegree(BeautyParameterType beautyParameterType, Float f) {
        updateBeautyParameter(beautyParameterType, Float.valueOf(f.floatValue()));
        dumpParams();
    }

    public void setBeautyParamsDegree(Map<BeautyParameterType, Float> map) {
        for (Map.Entry next : map.entrySet()) {
            updateBeautyParameter((BeautyParameterType) next.getKey(), (Float) next.getValue());
        }
        dumpParams();
    }
}