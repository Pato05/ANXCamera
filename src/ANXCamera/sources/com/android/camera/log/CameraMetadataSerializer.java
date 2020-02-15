package com.android.camera.log;

import android.hardware.camera2.CameraMetadata;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.LensShadingMap;
import android.util.Pair;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.Array;
import java.util.List;

public final class CameraMetadataSerializer {
    private static final String TAG = "CameraMetadataSerializer";

    private interface Writable {
        void write(Writer writer) throws IOException;
    }

    private CameraMetadataSerializer() {
    }

    private static void dumpMetadata(Writable writable, Writer writer) {
        try {
            writable.write(writer);
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e2) {
                    Log.e(TAG, "dumpMetadata - Failed to close writer.", (Throwable) e2);
                }
            }
        } catch (IOException e3) {
            Log.e(TAG, "dumpMetadata - Failed to dump metadata", (Throwable) e3);
            if (writer != null) {
                writer.close();
            }
        } catch (Throwable th) {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e4) {
                    Log.e(TAG, "dumpMetadata - Failed to close writer.", (Throwable) e4);
                }
            }
            throw th;
        }
    }

    private static void dumpMetadata(final String str, final CaptureRequest captureRequest, Writer writer) {
        dumpMetadata(new Writable() {
            public void write(Writer writer) throws IOException {
                List<CaptureRequest.Key<?>> keys = captureRequest.getKeys();
                writer.write(str + 10);
                for (CaptureRequest.Key next : keys) {
                    if (captureRequest.get(next) != null) {
                        writer.write(String.format("    %s\n", new Object[]{next.getName()}));
                        writer.write(String.format("        %s\n", new Object[]{CameraMetadataSerializer.metadataValueToString(captureRequest.get(next))}));
                    }
                }
            }
        }, new BufferedWriter(writer));
    }

    private static void dumpMetadata(final String str, final CaptureResult captureResult, Writer writer) {
        dumpMetadata(new Writable() {
            public void write(Writer writer) throws IOException {
                List<CaptureResult.Key<?>> keys = captureResult.getKeys();
                writer.write(String.format(str, new Object[0]) + 10);
                for (CaptureResult.Key next : keys) {
                    writer.write(String.format("    %s\n", new Object[]{next.getName()}));
                    writer.write(String.format("        %s\n", new Object[]{CameraMetadataSerializer.metadataValueToString(captureResult.get(next))}));
                }
            }
        }, new BufferedWriter(writer));
    }

    public static String metadataValueToString(Object obj) {
        if (obj == null) {
            return "<null>";
        }
        if (!obj.getClass().isArray()) {
            return obj instanceof LensShadingMap ? toString((LensShadingMap) obj) : obj instanceof Pair ? toString((Pair<?, ?>) (Pair) obj) : obj.toString();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            sb.append(metadataValueToString(Array.get(obj, i)));
            if (i != length - 1) {
                sb.append(", ");
            }
        }
        sb.append(']');
        return sb.toString();
    }

    public static void serialize(String str, CameraMetadata<?> cameraMetadata, File file) {
        try {
            FileWriter fileWriter = new FileWriter(file, true);
            if (cameraMetadata instanceof CaptureRequest) {
                dumpMetadata(str, (CaptureRequest) cameraMetadata, (Writer) fileWriter);
            } else if (cameraMetadata instanceof CaptureResult) {
                dumpMetadata(str, (CaptureResult) cameraMetadata, (Writer) fileWriter);
            } else {
                fileWriter.close();
                throw new IllegalArgumentException("Cannot generate debug data from type " + cameraMetadata.getClass().getName());
            }
            fileWriter.close();
        } catch (IOException e2) {
            Log.e(TAG, "Could not write capture data to file.", (Throwable) e2);
        }
    }

    private static String toString(LensShadingMap lensShadingMap) {
        StringBuilder sb = new StringBuilder();
        sb.append("LensShadingMap{");
        String[] strArr = {"R", "G_even", "G_odd", "B"};
        int rowCount = lensShadingMap.getRowCount();
        int columnCount = lensShadingMap.getColumnCount();
        for (int i = 0; i < 4; i++) {
            sb.append(strArr[i]);
            sb.append(":(");
            for (int i2 = 0; i2 < rowCount; i2++) {
                sb.append("[");
                for (int i3 = 0; i3 < columnCount; i3++) {
                    sb.append(lensShadingMap.getGainFactor(i, i3, i2));
                    if (i3 < columnCount - 1) {
                        sb.append(", ");
                    }
                }
                sb.append("]");
                if (i2 < rowCount - 1) {
                    sb.append(", ");
                }
            }
            sb.append(")");
            if (i < 3) {
                sb.append(", ");
            }
        }
        sb.append("}");
        return sb.toString();
    }

    private static String toString(Pair<?, ?> pair) {
        return "Pair: " + metadataValueToString(pair.first) + " / " + metadataValueToString(pair.second);
    }
}
