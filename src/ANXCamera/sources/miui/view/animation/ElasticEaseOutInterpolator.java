package miui.view.animation;

import android.view.animation.Interpolator;

public class ElasticEaseOutInterpolator implements Interpolator {
    private final float QT;
    private final float RT;

    public ElasticEaseOutInterpolator() {
        this(0.0f, 0.0f);
    }

    public ElasticEaseOutInterpolator(float f2, float f3) {
        this.QT = f2;
        this.RT = f3;
    }

    public float getInterpolation(float f2) {
        float f3;
        float f4 = this.RT;
        float f5 = this.QT;
        if (f2 == 0.0f) {
            return 0.0f;
        }
        if (f2 == 1.0f) {
            return 1.0f;
        }
        if (f4 == 0.0f) {
            f4 = 0.3f;
        }
        if (f5 == 0.0f || f5 < 1.0f) {
            f3 = f4 / 4.0f;
            f5 = 1.0f;
        } else {
            f3 = (float) ((((double) f4) / 6.283185307179586d) * Math.asin((double) (1.0f / f5)));
        }
        return (float) ((((double) f5) * Math.pow(2.0d, (double) (-10.0f * f2)) * Math.sin((((double) (f2 - f3)) * 6.283185307179586d) / ((double) f4))) + 1.0d);
    }
}
