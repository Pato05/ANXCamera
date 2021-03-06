package com.android.camera;

import com.android.camera.log.Log;
import f.a.a.a.a.c;
import f.a.a.a.b.b;
import java.util.ArrayList;

public class WatermarkMiSysUtils {
    private static final String CAMERA_FILE_DIR = "/mnt/vendor/persist/camera/";
    private static final String TAG = "WatermarkMiSysUtils";

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0019 A[ADDED_TO_REGION] */
    /* JADX WARNING: Removed duplicated region for block: B:23:? A[ADDED_TO_REGION, RETURN, SYNTHETIC] */
    public static int eraseFile(String str) {
        c cVar;
        b bVar = null;
        try {
            cVar = c.getService(true);
            try {
                bVar = b.getService(true);
            } catch (Exception e2) {
                e = e2;
                e.printStackTrace();
                int i = -1;
                if (cVar != null) {
                }
            }
        } catch (Exception e3) {
            e = e3;
            cVar = null;
            e.printStackTrace();
            int i2 = -1;
            return cVar != null ? -1 : -1;
        }
        int i22 = -1;
        if (cVar != null && bVar != null) {
            boolean z = false;
            try {
                z = bVar.j("/mnt/vendor/persist/camera/", str);
                Log.d(TAG, "file " + str + " isExist for iMiSys20.IsExists:" + z);
            } catch (Exception e4) {
                e4.printStackTrace();
            }
            if (!z) {
                return -1;
            }
            try {
                i22 = cVar.k("/mnt/vendor/persist/camera/", str);
                Log.e(TAG, "/mnt/vendor/persist/camera/" + str + " eraseResult:" + i22);
                return i22;
            } catch (Exception e5) {
                e5.printStackTrace();
                return i22;
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0016 A[ADDED_TO_REGION] */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0047  */
    /* JADX WARNING: Removed duplicated region for block: B:26:? A[RETURN, SYNTHETIC] */
    public static int isFileExist(String str) {
        c cVar;
        boolean z;
        b bVar = null;
        try {
            cVar = c.getService(true);
            try {
                bVar = b.getService(true);
            } catch (Exception e2) {
                e = e2;
                e.printStackTrace();
                if (cVar != null) {
                }
                Log.d(TAG, "Cannot get Misys Service. Don't know file:" + str + " is exist or not.");
                return -1;
            }
        } catch (Exception e3) {
            e = e3;
            cVar = null;
            e.printStackTrace();
            if (cVar != null) {
            }
            Log.d(TAG, "Cannot get Misys Service. Don't know file:" + str + " is exist or not.");
            return -1;
        }
        if (cVar != null || bVar == null) {
            Log.d(TAG, "Cannot get Misys Service. Don't know file:" + str + " is exist or not.");
            return -1;
        }
        try {
            z = bVar.j("/mnt/vendor/persist/camera/", str);
            try {
                Log.d(TAG, "file " + str + " isExist for iMiSys20.IsExists:" + z);
            } catch (Exception e4) {
                e = e4;
            }
        } catch (Exception e5) {
            e = e5;
            z = false;
            e.printStackTrace();
            if (!z) {
            }
        }
        return !z ? 1 : 0;
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0024 A[Catch:{ Exception -> 0x0075, all -> 0x0079 }, LOOP:0: B:14:0x0022->B:15:0x0024, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0073  */
    /* JADX WARNING: Removed duplicated region for block: B:26:? A[RETURN, SYNTHETIC] */
    public static boolean writeFileToPersist(byte[] bArr, String str) {
        c cVar;
        b bVar;
        b bVar2 = null;
        try {
            cVar = c.getService(true);
            try {
                bVar2 = b.getService(true);
            } catch (Exception e2) {
                e = e2;
                e.printStackTrace();
                bVar = bVar2;
                try {
                    ArrayList arrayList = new ArrayList();
                    while (r5 < r3) {
                    }
                    Log.d(TAG, "data.length=" + bArr.length + " byteData.size=" + arrayList.size());
                    int a2 = bVar.a("/mnt/vendor/persist/camera/", str, arrayList, (long) arrayList.size());
                    StringBuilder sb = new StringBuilder();
                    sb.append("writeResult for iMiSys20.MiSysWriteBuffer:");
                    sb.append(a2);
                    Log.d(TAG, sb.toString());
                    if (a2 == 0) {
                    }
                } catch (Exception e3) {
                    e3.printStackTrace();
                } catch (Throwable unused) {
                }
            }
        } catch (Exception e4) {
            e = e4;
            cVar = null;
            e.printStackTrace();
            bVar = bVar2;
            ArrayList arrayList2 = new ArrayList();
            while (r5 < r3) {
            }
            Log.d(TAG, "data.length=" + bArr.length + " byteData.size=" + arrayList2.size());
            int a22 = bVar.a("/mnt/vendor/persist/camera/", str, arrayList2, (long) arrayList2.size());
            StringBuilder sb2 = new StringBuilder();
            sb2.append("writeResult for iMiSys20.MiSysWriteBuffer:");
            sb2.append(a22);
            Log.d(TAG, sb2.toString());
            if (a22 == 0) {
            }
        }
        bVar = bVar2;
        if (!(cVar == null || bVar == null)) {
            ArrayList arrayList22 = new ArrayList();
            for (byte valueOf : bArr) {
                arrayList22.add(Byte.valueOf(valueOf));
            }
            Log.d(TAG, "data.length=" + bArr.length + " byteData.size=" + arrayList22.size());
            int a222 = bVar.a("/mnt/vendor/persist/camera/", str, arrayList22, (long) arrayList22.size());
            StringBuilder sb22 = new StringBuilder();
            sb22.append("writeResult for iMiSys20.MiSysWriteBuffer:");
            sb22.append(a222);
            Log.d(TAG, sb22.toString());
            return a222 == 0;
        }
        return false;
    }
}
