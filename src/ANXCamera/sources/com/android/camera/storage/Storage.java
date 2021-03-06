package com.android.camera.storage;

import android.app.usage.StorageStatsManager;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.DngCreator;
import android.location.Location;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.os.StatFs;
import android.os.UserHandle;
import android.os.storage.StorageManager;
import android.support.v4.app.FrameMetricsAggregator;
import android.text.TextUtils;
import android.util.Size;
import com.android.camera.ActivityBase;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifHelper;
import com.android.gallery3d.exif.ExifInterface;
import com.mi.config.b;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.parallelservice.util.ParallelUtil;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;
import miui.os.Build;
import miui.reflect.Method;

public class Storage {
    public static final String AVOID_SCAN_FILE_NAME = ".nomedia";
    public static int BUCKET_ID = DIRECTORY.toLowerCase(Locale.ENGLISH).hashCode();
    private static final String CAMERA_STORAGE_PATH_SUFFIX = "/DCIM/Camera";
    private static final String CAMERA_STORAGE_PATH_TEMP = "/DCIM/Camera/.temp";
    public static String CAMERA_TEMP_DIRECTORY = (FIRST_CONSIDER_STORAGE_PATH + CAMERA_STORAGE_PATH_TEMP);
    public static String DIRECTORY = (FIRST_CONSIDER_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX);
    public static final String DOCUMENT_PICTURE = "DOCUMENT_PICTURE";
    public static String FIRST_CONSIDER_STORAGE_PATH = (b.Fm ? SECONDARY_STORAGE_PATH : PRIMARY_STORAGE_PATH);
    public static final String HEIC_SUFFIX = ".HEIC";
    public static String HIDEDIRECTORY = (FIRST_CONSIDER_STORAGE_PATH + HIDE_CAMERA_STORAGE_PATH_SUFFIX);
    private static final String HIDE_CAMERA_STORAGE_PATH_SUFFIX = "/DCIM/Camera/.ubifocus";
    public static final String HSR_120_SUFFIX = "_HSR_120";
    public static final String HSR_240_SUFFIX = "_HSR_240";
    public static final String ID_CARD_PICTURE_1 = "ID_CARD_PICTURE_1";
    public static final String ID_CARD_PICTURE_2 = "ID_CARD_PICTURE_2";
    public static final String JPEG_SUFFIX = ".jpg";
    private static final AtomicLong LEFT_SPACE = new AtomicLong(0);
    public static final String LIVE_SHOT_PREFIX = "MV";
    public static final long LOW_STORAGE_THRESHOLD = 52428800;
    private static final int MAX_WRITE_RETRY = (Build.IS_ALPHA_BUILD ? 1 : 3);
    public static final String MIME_DNG = "image/x-adobe-dng";
    public static final String MIME_HEIC = "image/heic";
    public static final String MIME_JPEG = "image/jpeg";
    protected static final String PARALLEL_PROCESS_EXIF_PROCESS_TAG = "processing";
    public static final long PREPARING = -2;
    public static int PRIMARY_BUCKET_ID = (PRIMARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX).toLowerCase(Locale.ENGLISH).hashCode();
    public static int PRIMARY_RAW_BUCKET_ID = (PRIMARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX + RAW_PATH_SUFFIX).toLowerCase(Locale.ENGLISH).hashCode();
    private static final String PRIMARY_STORAGE_PATH = Environment.getExternalStorageDirectory().toString();
    public static final float QUOTA_RATIO = 0.9f;
    public static String RAW_DIRECTORY = (DIRECTORY + RAW_PATH_SUFFIX);
    private static final String RAW_PATH_SUFFIX = "/Raw";
    public static final String RAW_SUFFIX = ".dng";
    private static final String SAVE_TO_CLOUD_ALBUM_ACTION = "com.miui.gallery.SAVE_TO_CLOUD";
    private static final String SAVE_TO_CLOUD_ALBUM_CACHE_LOCATION_KEY = "extra_cache_location";
    private static final String SAVE_TO_CLOUD_ALBUM_FILE_LENGTH = "extra_file_length";
    private static final String SAVE_TO_CLOUD_ALBUM_PACKAGE = "com.miui.gallery";
    private static final String SAVE_TO_CLOUD_ALBUM_PATH_KAY = "extra_file_path";
    private static final String SAVE_TO_CLOUD_ALBUM_STORE_ID_KAY = "extra_media_store_id";
    private static final String SAVE_TO_CLOUD_ALBUM_TEMP_FILE_KAY = "extra_is_temp_file";
    public static int SECONDARY_BUCKET_ID = (SECONDARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX).toLowerCase(Locale.ENGLISH).hashCode();
    public static int SECONDARY_RAW_BUCKET_ID = (SECONDARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX + RAW_PATH_SUFFIX).toLowerCase(Locale.ENGLISH).hashCode();
    private static String SECONDARY_STORAGE_PATH = System.getenv("SECONDARY_STORAGE");
    private static final String TAG = "Storage";
    public static final String UBIFOCUS_SUFFIX = "_UBIFOCUS_";
    public static final long UNAVAILABLE = -1;
    public static final long UNKNOWN_SIZE = -3;
    public static final String VIDEO_8K_SUFFIX = "_8K";
    private static String sCurrentStoragePath = FIRST_CONSIDER_STORAGE_PATH;
    private static long sQuotaBytes;
    private static boolean sQuotaSupported;
    private static long sReserveBytes;
    private static WeakReference<StorageListener> sStorageListener;

    public interface StorageListener {
        void onStoragePathChanged();
    }

    private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
        if (th != null) {
            try {
                autoCloseable.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
        } else {
            autoCloseable.close();
        }
    }

    static {
        File file = new File(DIRECTORY + File.separator + AVOID_SCAN_FILE_NAME);
        if (file.exists()) {
            file.delete();
        }
    }

    public static Uri addDNGToDataBase(Context context, String str, long j, int i, int i2, int i3) {
        String name = new File(str).getName();
        String substring = name.substring(0, name.lastIndexOf(46) - 1);
        ContentValues contentValues = new ContentValues(7);
        contentValues.put("title", substring);
        contentValues.put("_display_name", name);
        contentValues.put("media_type", 1);
        contentValues.put("datetaken", Long.valueOf(j));
        contentValues.put("mime_type", MIME_DNG);
        contentValues.put("_data", str);
        contentValues.put("width", Integer.valueOf(i));
        contentValues.put("height", Integer.valueOf(i2));
        contentValues.put("orientation", Integer.valueOf(i3));
        try {
            return context.getContentResolver().insert(getMediaUri(context, false, str), contentValues);
        } catch (Exception e2) {
            String str2 = TAG;
            Log.e(str2, "Failed to write MediaStore, path " + str, (Throwable) e2);
            return null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:141:0x01b2 A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:142:0x01b4  */
    public static Uri addImage(Context context, String str, long j, Location location, int i, byte[] bArr, boolean z, int i2, int i3, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, String str2, PictureInfo pictureInfo) {
        boolean z7;
        boolean z8;
        String str3;
        String str4;
        boolean z9;
        Throwable th;
        OutputStream outputStream;
        OutputStream outputStream2;
        Throwable th2;
        Throwable th3;
        Throwable th4;
        Context context2 = context;
        String str5 = str;
        long j2 = j;
        Location location2 = location;
        int i4 = i;
        Log.d(TAG, "addImage: parallel=" + z6 + " appendExif=" + z5);
        byte[] updateExif = updateExif(bArr, z6, str2, pictureInfo, i, i2, i3);
        String generateFilepath4Image = generateFilepath4Image(str5, z3, z4, z);
        Log.d(TAG, "addImage: path=" + generateFilepath4Image);
        boolean z10 = z5;
        int i5 = 0;
        while (true) {
            try {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(new ByteArrayInputStream(updateExif));
                try {
                    if (isUseDocumentMode()) {
                        try {
                            outputStream = FileCompat.getFileOutputStream(generateFilepath4Image, true);
                        } catch (Throwable th5) {
                            th = th5;
                            th = th;
                            throw th;
                        }
                    } else {
                        outputStream = new FileOutputStream(generateFilepath4Image);
                    }
                    outputStream2 = outputStream;
                    try {
                        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream2);
                        if (!z2) {
                            z9 = z10;
                            byte[] bArr2 = new byte[4096];
                            while (true) {
                                int read = bufferedInputStream.read(bArr2);
                                if (read == -1) {
                                    break;
                                }
                                bufferedOutputStream.write(bArr2, 0, read);
                            }
                        } else {
                            try {
                                boolean z11 = i4 % 180 == 0;
                                z9 = z10;
                                Bitmap flipJpeg = flipJpeg(updateExif, z11, !z11);
                                if (flipJpeg == null) {
                                    byte[] bArr3 = new byte[4096];
                                    while (true) {
                                        int read2 = bufferedInputStream.read(bArr3);
                                        if (read2 == -1) {
                                            break;
                                        }
                                        bufferedOutputStream.write(bArr3, 0, read2);
                                    }
                                } else {
                                    ExifInterface exif = Util.getExif(updateExif);
                                    byte[] thumbnailBytes = exif.getThumbnailBytes();
                                    if (thumbnailBytes != null) {
                                        Bitmap flipJpeg2 = flipJpeg(thumbnailBytes, z11, !z11);
                                        if (flipJpeg2 != null) {
                                            exif.setCompressedThumbnail(flipJpeg2);
                                            flipJpeg2.recycle();
                                        }
                                        z9 = false;
                                    }
                                    exif.writeExif(flipJpeg, (OutputStream) bufferedOutputStream);
                                    flipJpeg.recycle();
                                }
                            } catch (Throwable th6) {
                                th = th6;
                                th3 = th;
                                throw th3;
                            }
                        }
                        z10 = z9;
                        if (z10) {
                            try {
                                bufferedOutputStream.flush();
                                if (!isUseDocumentMode()) {
                                    ExifHelper.writeExifByFilePath(generateFilepath4Image, i4, location2, j2);
                                } else {
                                    try {
                                        ParcelFileDescriptor parcelFileDescriptor = FileCompat.getParcelFileDescriptor(generateFilepath4Image, false);
                                        try {
                                            ExifHelper.writeExifByFd(parcelFileDescriptor.getFileDescriptor(), i4, location2, j2);
                                            if (parcelFileDescriptor != null) {
                                                $closeResource((Throwable) null, parcelFileDescriptor);
                                            }
                                        } catch (Throwable th7) {
                                            Throwable th8 = th7;
                                            if (parcelFileDescriptor == null) {
                                                break;
                                            }
                                            $closeResource(th4, parcelFileDescriptor);
                                            break;
                                            throw th8;
                                        }
                                    } catch (Exception e2) {
                                        Log.e(TAG, "write exif failed, file is " + generateFilepath4Image, (Throwable) e2);
                                    }
                                }
                            } catch (Throwable th9) {
                                th3 = th9;
                                z9 = z10;
                            }
                        }
                        try {
                            $closeResource((Throwable) null, bufferedOutputStream);
                            if (outputStream2 != null) {
                                $closeResource((Throwable) null, outputStream2);
                            }
                            try {
                                $closeResource((Throwable) null, bufferedInputStream);
                                z7 = false;
                                Context context3 = context;
                                break;
                            } catch (Exception e3) {
                                e = e3;
                            } catch (Throwable th10) {
                                Throwable th11 = th10;
                                $closeResource(th, bufferedInputStream);
                                throw th11;
                            }
                        } catch (Throwable th12) {
                            th = th12;
                            th2 = th;
                            throw th2;
                        }
                    } catch (Throwable th13) {
                        th = th13;
                        z9 = z10;
                        th2 = th;
                        throw th2;
                    }
                } catch (Throwable th14) {
                    th = th14;
                    z9 = z10;
                    th = th;
                    throw th;
                }
            } catch (Exception e4) {
                e = e4;
                z9 = z10;
                dumpExceptionEnv(e, generateFilepath4Image);
                Log.e(TAG, "Failed to write image", (Throwable) e);
                i5++;
                final Context context4 = context;
                if (Util.isQuotaExceeded(e) && (context4 instanceof ActivityBase)) {
                    ActivityBase activityBase = (ActivityBase) context4;
                    if (!activityBase.isActivityPaused()) {
                        activityBase.runOnUiThread(new Runnable() {
                            public void run() {
                                ToastUtils.showToast(context4, (int) R.string.spaceIsLow_content_primary_storage_priority);
                            }
                        });
                    }
                    i5 = MAX_WRITE_RETRY;
                } else if (i5 < MAX_WRITE_RETRY) {
                    System.gc();
                    try {
                        Thread.sleep(50);
                    } catch (InterruptedException unused) {
                    }
                }
                if (i5 >= MAX_WRITE_RETRY) {
                    z7 = true;
                    if (!z7) {
                    }
                } else {
                    int i6 = i2;
                    location2 = location;
                    boolean z12 = z;
                    boolean z13 = z3;
                    boolean z14 = z4;
                }
            }
            int i62 = i2;
            location2 = location;
            boolean z122 = z;
            boolean z132 = z3;
            boolean z142 = z4;
        }
        if (!z7) {
            return null;
        }
        if (z4) {
            boolean isProduceFocusInfoSuccess = Util.isProduceFocusInfoSuccess(updateExif);
            int centerFocusDepthIndex = Util.getCenterFocusDepthIndex(updateExif, i2, i3);
            String str6 = "_";
            String substring = str5.substring(0, isProduceFocusInfoSuccess ? str5.lastIndexOf(str6) : str5.lastIndexOf(UBIFOCUS_SUFFIX));
            String generateFilepath4Image2 = generateFilepath4Image(substring, false, false, false);
            StringBuilder sb = new StringBuilder();
            sb.append(substring);
            if (!isProduceFocusInfoSuccess) {
                str6 = UBIFOCUS_SUFFIX;
            }
            sb.append(str6);
            sb.append(centerFocusDepthIndex);
            z8 = z3;
            String generateFilepath4Image3 = generateFilepath4Image(sb.toString(), z8, false, false);
            if (generateFilepath4Image2 == null || generateFilepath4Image3 == null) {
                String str7 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("oldPath: ");
                String str8 = "null";
                if (generateFilepath4Image3 == null) {
                    generateFilepath4Image3 = str8;
                }
                sb2.append(generateFilepath4Image3);
                sb2.append(" newPath: ");
                if (generateFilepath4Image2 != null) {
                    str8 = generateFilepath4Image2;
                }
                sb2.append(str8);
                Log.e(str7, sb2.toString());
            } else {
                new File(generateFilepath4Image3).renameTo(new File(generateFilepath4Image2));
            }
            if (!isProduceFocusInfoSuccess) {
                deleteImage(substring);
            }
            str3 = substring;
            str4 = generateFilepath4Image2;
        } else {
            int i7 = i2;
            int i8 = i3;
            z8 = z3;
            str3 = str5;
            str4 = generateFilepath4Image;
        }
        if ((z8 && !z4) || isSaveToHidenFolder(str3)) {
            return null;
        }
        String str9 = z ? HEIC_SUFFIX : JPEG_SUFFIX;
        boolean z15 = false;
        byte[] bArr4 = updateExif;
        Uri insertToMediaStore = insertToMediaStore(context, str3, str3 + str9, j, z ? MIME_HEIC : MIME_JPEG, i, str4, new File(str4).length(), i2, i3, location, z6);
        if (insertToMediaStore == null) {
            Log.e(TAG, "failed to insert to DB: " + str4);
            return null;
        }
        long length = (long) bArr4.length;
        long parseId = ContentUris.parseId(insertToMediaStore);
        if (location == null) {
            z15 = true;
        }
        saveToCloudAlbum(context, str4, length, z6, parseId, z15);
        return insertToMediaStore;
    }

    public static Uri addImageForEffect(Context context, String str, long j, Location location, int i, byte[] bArr, int i2, int i3, boolean z, boolean z2, String str2, PictureInfo pictureInfo) {
        return addImage(context, str, j, location, i, bArr, false, i2, i3, z, false, false, false, z2, str2, pictureInfo);
    }

    public static Uri addImageForGroupOrPanorama(Context context, String str, int i, long j, Location location, int i2, int i3) {
        File file;
        String str2 = str;
        if (!(context == null || str2 == null)) {
            try {
                file = new File(str2);
            } catch (Exception e2) {
                String str3 = TAG;
                Log.e(str3, "Failed to open panorama file: " + e2.getMessage(), (Throwable) e2);
                file = null;
            }
            if (file != null && file.exists()) {
                String name = file.getName();
                String str4 = str2;
                Uri insertToMediaStore = insertToMediaStore(context, name, name, j, MIME_JPEG, i, str, file.length(), i2, i3, location, false);
                saveToCloudAlbum(context, str4, -1, location == null);
                return insertToMediaStore;
            }
        }
        return null;
    }

    public static Uri addImageForSnapCamera(Context context, String str, long j, Location location, int i, byte[] bArr, int i2, int i3, boolean z, boolean z2, boolean z3, String str2, PictureInfo pictureInfo) {
        return addImage(context, str, j, location, i, bArr, false, i2, i3, z, z2, z3, false, false, str2, pictureInfo);
    }

    /* JADX INFO: finally extract failed */
    public static Uri addRawImage(Context context, String str, CameraCharacteristics cameraCharacteristics, CaptureResult captureResult, byte[] bArr, long j, int i, int i2, int i3) {
        OutputStream outputStream;
        Throwable th;
        String generateRawFilepath = generateRawFilepath(str);
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        try {
            DngCreator dngCreator = new DngCreator(cameraCharacteristics, captureResult);
            try {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(new ByteArrayInputStream(bArr));
                try {
                    boolean z = true;
                    th = isUseDocumentMode() ? FileCompat.getFileOutputStream(generateRawFilepath, true) : new FileOutputStream(generateRawFilepath);
                    try {
                        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
                        try {
                            dngCreator.setOrientation(ExifInterface.getExifOrientationValue(i3));
                            dngCreator.writeInputStream(bufferedOutputStream, new Size(i, i2), bufferedInputStream, 0);
                            Uri addDNGToDataBase = addDNGToDataBase(context, generateRawFilepath, j, i, i2, i3);
                            String str2 = TAG;
                            Log.d(str2, "addRawImage path " + generateRawFilepath + ", uri = " + addDNGToDataBase);
                            if (currentLocation != null) {
                                z = false;
                            }
                            saveToCloudAlbum(context, generateRawFilepath, -1, z);
                            $closeResource((Throwable) null, bufferedOutputStream);
                            if (outputStream != null) {
                                $closeResource((Throwable) null, outputStream);
                            }
                            $closeResource((Throwable) null, bufferedInputStream);
                            $closeResource((Throwable) null, dngCreator);
                            return addDNGToDataBase;
                        } catch (Throwable th2) {
                            Throwable th3 = th2;
                            $closeResource(th, bufferedOutputStream);
                            throw th3;
                        }
                    } catch (Throwable th4) {
                        Throwable th5 = th4;
                        try {
                            throw th5;
                        } catch (Throwable th6) {
                            Throwable th7 = th6;
                            if (outputStream != null) {
                                $closeResource(th5, outputStream);
                            }
                            throw th7;
                        }
                    }
                } finally {
                    outputStream = th;
                    try {
                    } catch (Throwable th8) {
                        Throwable th9 = th8;
                        $closeResource(outputStream, bufferedInputStream);
                        throw th9;
                    }
                }
            } catch (Throwable th10) {
                Throwable th11 = th10;
                try {
                    throw th11;
                } catch (Throwable th12) {
                    Throwable th13 = th12;
                    $closeResource(th11, dngCreator);
                    throw th13;
                }
            }
        } catch (Throwable th14) {
            String str3 = TAG;
            Log.w(str3, "addRawImage failed, path " + generateRawFilepath, th14);
            return null;
        }
    }

    public static boolean createHideFile() {
        return Util.createFile(new File(CAMERA_TEMP_DIRECTORY + File.separator + AVOID_SCAN_FILE_NAME));
    }

    public static void deleteImage(String str) {
        File file = new File(HIDEDIRECTORY);
        if (file.exists() && file.isDirectory()) {
            for (File file2 : file.listFiles()) {
                if (file2.getName().indexOf(str) != -1) {
                    file2.delete();
                }
            }
        }
    }

    private static boolean deleteSdcardFile(String str) {
        boolean deleteFile;
        int i = 0;
        do {
            i++;
            deleteFile = FileCompat.deleteFile(str);
            if (deleteFile) {
                break;
            }
        } while (i < 5);
        return deleteFile;
    }

    private static void dumpExceptionEnv(Exception exc, String str) {
        boolean z;
        if (exc instanceof FileNotFoundException) {
            long maxMemory = Runtime.getRuntime().maxMemory();
            long j = Runtime.getRuntime().totalMemory();
            long freeMemory = Runtime.getRuntime().freeMemory();
            File file = new File(str);
            try {
                File file2 = new File(str + ".ex");
                z = file2.createNewFile();
                file2.delete();
            } catch (IOException unused) {
                z = false;
            }
            String str2 = TAG;
            Locale locale = Locale.ENGLISH;
            Object[] objArr = new Object[7];
            objArr[0] = Long.valueOf(maxMemory);
            objArr[1] = Long.valueOf(j);
            objArr[2] = Long.valueOf(freeMemory);
            objArr[3] = file.exists() ? "exists" : "not exists";
            objArr[4] = file.isDirectory() ? "isDirectory" : "isNotDirectory";
            objArr[5] = file.canWrite() ? "canWrite" : "canNotWrite";
            objArr[6] = z ? "testFileCanWrite" : "testFileCannotWrite";
            Log.e(str2, String.format(locale, "Failed to write image, memory state(max:%d, total:%d, free:%d), file state(%s;%s;%s;%s)", objArr), (Throwable) exc);
        }
    }

    public static Bitmap flipJpeg(byte[] bArr, boolean z, boolean z2) {
        if (bArr == null) {
            return null;
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPurgeable = true;
        Bitmap decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        Matrix matrix = new Matrix();
        float f2 = -1.0f;
        float f3 = z ? -1.0f : 1.0f;
        if (!z2) {
            f2 = 1.0f;
        }
        matrix.setScale(f3, f2, ((float) decodeByteArray.getWidth()) * 0.5f, ((float) decodeByteArray.getHeight()) * 0.5f);
        try {
            Bitmap createBitmap = Bitmap.createBitmap(decodeByteArray, 0, 0, decodeByteArray.getWidth(), decodeByteArray.getHeight(), matrix, true);
            if (createBitmap != decodeByteArray) {
                decodeByteArray.recycle();
            }
            if (createBitmap.getWidth() == -1 || createBitmap.getHeight() == -1) {
                return null;
            }
            return createBitmap;
        } catch (Exception e2) {
            Log.w(TAG, "Failed to rotate thumbnail", (Throwable) e2);
            return null;
        }
    }

    public static String generateFilepath(String str) {
        return DIRECTORY + '/' + str;
    }

    public static String generateFilepath(String str, String str2) {
        if (isDocumentPicture(str) || isIdCardPicture(str)) {
            return CAMERA_TEMP_DIRECTORY + '/' + str + str2;
        }
        return DIRECTORY + '/' + str + str2;
    }

    public static String generateFilepath4Image(String str, boolean z) {
        return generateFilepath(str, z ? HEIC_SUFFIX : JPEG_SUFFIX);
    }

    public static String generateFilepath4Image(String str, boolean z, boolean z2, boolean z3) {
        String str2 = z2 ? ".y" : z3 ? HEIC_SUFFIX : JPEG_SUFFIX;
        if (z && isLowStorageSpace(HIDEDIRECTORY)) {
            return null;
        }
        if (!z) {
            return generateFilepath(str, str2);
        }
        return HIDEDIRECTORY + '/' + str + str2;
    }

    public static String generatePrimaryDirectoryPath() {
        return PRIMARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX;
    }

    public static String generatePrimaryFilepath(String str) {
        return generatePrimaryDirectoryPath() + '/' + str;
    }

    public static String generatePrimaryTempFile() {
        return PRIMARY_STORAGE_PATH + CAMERA_STORAGE_PATH_TEMP;
    }

    public static String generateRawFilepath(String str) {
        return RAW_DIRECTORY + "/" + str + RAW_SUFFIX;
    }

    public static String generateTempFilepath() {
        return DIRECTORY + "/.temp";
    }

    public static long getAvailableSpace() {
        return getAvailableSpace(DIRECTORY);
    }

    public static long getAvailableSpace(String str) {
        if (TextUtils.isEmpty(str)) {
            Log.w(TAG, "getAvailableSpace path is empty");
            return -1;
        }
        File file = new File(str);
        boolean mkdirs = isUseDocumentMode() ? FileCompat.mkdirs(str) : Util.mkdirs(file, FrameMetricsAggregator.EVERY_DURATION, -1, -1);
        if (!file.exists() || !file.isDirectory()) {
            Log.w(TAG, "getAvailableSpace path = " + str + ", exists = " + file.exists() + ", isDirectory = " + file.isDirectory() + ", canWrite = " + file.canWrite());
            return -1;
        }
        if (mkdirs && str.endsWith(CAMERA_STORAGE_PATH_SUFFIX)) {
            if (MediaProviderUtil.insertCameraDirectory(CameraAppImpl.getAndroidContext(), str) != null) {
                Log.d(TAG, "insertDirectory success, path " + str);
            } else {
                Log.w(TAG, "insertDirectory fail, path " + str);
            }
        }
        try {
            if (HIDEDIRECTORY.equals(str)) {
                Util.createFile(new File(HIDEDIRECTORY + File.separator + AVOID_SCAN_FILE_NAME));
            }
            long availableBytes = new StatFs(str).getAvailableBytes();
            if (DIRECTORY.equals(str)) {
                if (isUsePhoneStorage() && isQuotaSupported() && availableBytes < sReserveBytes) {
                    Context androidContext = CameraAppImpl.getAndroidContext();
                    ApplicationInfo applicationInfo = androidContext.getApplicationInfo();
                    try {
                        long totalBytes = sQuotaBytes - ((StorageStatsManager) androidContext.getSystemService(StorageStatsManager.class)).queryExternalStatsForUser(applicationInfo.storageUuid, UserHandle.getUserHandleForUid(applicationInfo.uid)).getTotalBytes();
                        if (totalBytes < 0) {
                            totalBytes = 0;
                        }
                        if (totalBytes < availableBytes) {
                            availableBytes = totalBytes;
                        }
                    } catch (IOException e2) {
                        Log.e(TAG, e2.getMessage(), (Throwable) e2);
                    }
                }
                setLeftSpace(availableBytes);
            }
            return availableBytes;
        } catch (Exception e3) {
            Log.i(TAG, "Fail to access external storage", e3);
            return -3;
        }
    }

    public static long getLeftSpace() {
        long j = LEFT_SPACE.get();
        String str = TAG;
        Log.i(str, "getLeftSpace() return " + j);
        return j;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0046, code lost:
        if (isLowStorageSpace(PRIMARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX) != false) goto L_0x004a;
     */
    public static Uri getMediaUri(Context context, boolean z, String str) {
        boolean z2 = true;
        if (hasSecondaryStorage()) {
            if (str == null || !str.startsWith(SECONDARY_STORAGE_PATH)) {
                if (!isLowStorageSpace(SECONDARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX)) {
                    if (!CameraSettings.getPriorityStoragePreference()) {
                    }
                }
            }
            return CompatibilityUtils.getMediaUri(context, z, z2);
        }
        z2 = false;
        return CompatibilityUtils.getMediaUri(context, z, z2);
    }

    public static String getPrimaryStoragePath() {
        if (PRIMARY_STORAGE_PATH == null) {
            return null;
        }
        return PRIMARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX;
    }

    private static Intent getSaveToCloudIntent(Context context, String str, long j, boolean z, long j2, boolean z2) {
        Intent intent = new Intent(SAVE_TO_CLOUD_ALBUM_ACTION);
        intent.setPackage("com.miui.gallery");
        List<ResolveInfo> queryBroadcastReceivers = context.getPackageManager().queryBroadcastReceivers(intent, 0);
        if (queryBroadcastReceivers != null && queryBroadcastReceivers.size() > 0) {
            intent.setComponent(new ComponentName("com.miui.gallery", queryBroadcastReceivers.get(0).activityInfo.name));
        }
        intent.putExtra(SAVE_TO_CLOUD_ALBUM_PATH_KAY, str);
        intent.putExtra(SAVE_TO_CLOUD_ALBUM_FILE_LENGTH, j);
        if (z) {
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_TEMP_FILE_KAY, true);
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_STORE_ID_KAY, j2);
        } else {
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_TEMP_FILE_KAY, false);
        }
        if (z2) {
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_CACHE_LOCATION_KEY, LocationManager.instance().getLastKnownLocation());
            Log.d(TAG, "broadcast last location to gallery");
        }
        return intent;
    }

    public static String getSecondaryStoragePath() {
        if (SECONDARY_STORAGE_PATH == null) {
            return null;
        }
        return SECONDARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX;
    }

    public static boolean hasSecondaryStorage() {
        return Build.VERSION.SDK_INT >= 28 ? UserHandle.myUserId() == 0 && b.cl() && SECONDARY_STORAGE_PATH != null : b.cl() && SECONDARY_STORAGE_PATH != null;
    }

    private static void initQuota(Context context) {
        if (Build.VERSION.SDK_INT >= 26) {
            StorageStatsManager storageStatsManager = (StorageStatsManager) context.getSystemService(StorageStatsManager.class);
            Class[] clsArr = {StorageStatsManager.class};
            Method method = Util.getMethod(clsArr, "isQuotaSupported", "(Ljava/util/UUID;)Z");
            if (method != null) {
                sQuotaSupported = method.invokeBoolean(clsArr[0], storageStatsManager, StorageManager.UUID_DEFAULT);
                if (sQuotaSupported) {
                    long totalBytes = new StatFs(PRIMARY_STORAGE_PATH).getTotalBytes();
                    sQuotaBytes = (long) (((float) totalBytes) * 0.9f);
                    sReserveBytes = totalBytes - sQuotaBytes;
                    String str = TAG;
                    Log.d(str, "quota: " + sQuotaBytes + "|" + sReserveBytes);
                }
            }
        }
    }

    public static void initStorage(Context context) {
        initQuota(context);
        if (b.cl()) {
            FileCompat.updateSDPath();
            String sdcardPath = CompatibilityUtils.getSdcardPath(context);
            String str = TAG;
            Log.v(str, "initStorage sd=" + sdcardPath);
            if (sdcardPath != null) {
                SECONDARY_STORAGE_PATH = sdcardPath;
                SECONDARY_BUCKET_ID = (SECONDARY_STORAGE_PATH + CAMERA_STORAGE_PATH_SUFFIX).toLowerCase(Locale.ENGLISH).hashCode();
            } else {
                SECONDARY_STORAGE_PATH = null;
            }
            readSystemPriorityStorage();
        }
    }

    private static Uri insertToMediaStore(Context context, String str, String str2, long j, String str3, int i, String str4, long j2, int i2, int i3, Location location, boolean z) {
        ContentValues contentValues = new ContentValues(11);
        contentValues.put("title", str);
        contentValues.put("_display_name", str2);
        contentValues.put("datetaken", Long.valueOf(j));
        contentValues.put("mime_type", str3);
        contentValues.put("orientation", Integer.valueOf(i));
        contentValues.put("_data", str4);
        contentValues.put("_size", Long.valueOf(j2));
        contentValues.put("width", Integer.valueOf(i2));
        contentValues.put("height", Integer.valueOf(i3));
        if (location != null) {
            contentValues.put("latitude", Double.valueOf(location.getLatitude()));
            contentValues.put("longitude", Double.valueOf(location.getLongitude()));
        }
        if (!z) {
            try {
                Uri insert = context.getContentResolver().insert(getMediaUri(context, false, str4), contentValues);
                String str5 = TAG;
                Log.d(str5, "insert: title " + str + ", orientation = " + i + ", uri = " + insert);
                return insert;
            } catch (Exception e2) {
                String str6 = TAG;
                Log.e(str6, "Failed to write MediaStore:" + e2.getMessage(), (Throwable) e2);
                return null;
            }
        } else {
            Uri insert2 = context.getContentResolver().insert(getMediaUri(context, false, str4), contentValues);
            ParallelUtil.insertImageToParallelService(context, ContentUris.parseId(insert2), str4);
            String str7 = TAG;
            Log.d(str7, "parallel insert: title " + str + ", orientation = " + i + ", uri = " + insert2);
            return insert2;
        }
    }

    public static boolean isCurrentStorageIsSecondary() {
        String str = SECONDARY_STORAGE_PATH;
        return str != null && str.equals(sCurrentStoragePath);
    }

    public static boolean isDirectoryExistsAndCanWrite(String str) {
        File file = new File(str);
        return file.exists() && file.isDirectory() && file.canWrite();
    }

    public static boolean isDocumentPicture(String str) {
        return TextUtils.equals(DOCUMENT_PICTURE, str);
    }

    public static boolean isIdCardPicture(String str) {
        return isIdCardPictureOne(str) || isIdCardPictureTwo(str);
    }

    public static boolean isIdCardPictureOne(String str) {
        return TextUtils.equals(ID_CARD_PICTURE_1, str);
    }

    public static boolean isIdCardPictureTwo(String str) {
        return TextUtils.equals(ID_CARD_PICTURE_2, str);
    }

    public static boolean isLowStorageAtLastPoint() {
        return getLeftSpace() < LOW_STORAGE_THRESHOLD;
    }

    public static boolean isLowStorageSpace(String str) {
        return getAvailableSpace(str) < LOW_STORAGE_THRESHOLD;
    }

    public static boolean isPhoneStoragePriority() {
        return PRIMARY_STORAGE_PATH.equals(FIRST_CONSIDER_STORAGE_PATH);
    }

    public static boolean isQuotaSupported() {
        return sQuotaSupported && sQuotaBytes > 0;
    }

    public static boolean isRelatedStorage(Uri uri) {
        if (uri == null) {
            return false;
        }
        String path = uri.getPath();
        if (path != null) {
            return path.equals(PRIMARY_STORAGE_PATH) || path.equals(SECONDARY_STORAGE_PATH);
        }
        return false;
    }

    public static boolean isSaveToHidenFolder(String str) {
        return isDocumentPicture(str) || isIdCardPicture(str);
    }

    public static boolean isSecondPhoneStorage(String str) {
        return str != null && !TextUtils.isEmpty(SECONDARY_STORAGE_PATH) && str.startsWith(SECONDARY_STORAGE_PATH);
    }

    public static boolean isUseDocumentMode() {
        if (Build.VERSION.SDK_INT >= 28 && !isUsePhoneStorage()) {
            return !DataRepository.dataItemFeature().tc() || !isDirectoryExistsAndCanWrite(sCurrentStoragePath);
        }
        return false;
    }

    public static boolean isUsePhoneStorage() {
        return PRIMARY_STORAGE_PATH.equals(sCurrentStoragePath);
    }

    public static Uri newImage(Context context, String str, long j, int i, int i2, int i3, boolean z) {
        String generateFilepath4Image = generateFilepath4Image(str, z);
        ContentValues contentValues = new ContentValues(6);
        contentValues.put("datetaken", Long.valueOf(j));
        contentValues.put("orientation", Integer.valueOf(i));
        contentValues.put("_data", generateFilepath4Image);
        contentValues.put("width", Integer.valueOf(i2));
        contentValues.put("height", Integer.valueOf(i3));
        contentValues.put("mime_type", z ? MIME_HEIC : MIME_JPEG);
        try {
            return context.getContentResolver().insert(getMediaUri(context, false, generateFilepath4Image), contentValues);
        } catch (Exception e2) {
            String str2 = TAG;
            Log.e(str2, "Failed to new image" + e2);
            return null;
        }
    }

    public static void readSystemPriorityStorage() {
        boolean z;
        if (hasSecondaryStorage()) {
            z = PriorityStorageBroadcastReceiver.isPriorityStorage();
            CameraSettings.setPriorityStoragePreference(z);
        } else {
            z = false;
        }
        FIRST_CONSIDER_STORAGE_PATH = z ? SECONDARY_STORAGE_PATH : PRIMARY_STORAGE_PATH;
        sCurrentStoragePath = FIRST_CONSIDER_STORAGE_PATH;
        updateDirectory();
    }

    private static boolean renameSdcardFile(String str, String str2) {
        int i = 0;
        boolean z = false;
        do {
            i++;
            try {
                z = FileCompat.renameFile(str, str2);
                if (z) {
                    break;
                }
            } catch (IOException e2) {
                Log.e(TAG, "renameSdcardFile failed", (Throwable) e2);
            }
        } while (i < 5);
        return z;
    }

    public static void saveMorphoPanoramaOriginalPic(ByteBuffer byteBuffer, int i, String str) {
        File file = new File(DIRECTORY + File.separator + str + File.separator);
        if (!file.exists()) {
            file.mkdirs();
        }
        String generateFilepath4Image = generateFilepath4Image(str + File.separator + str + "_" + i, false);
        FileChannel fileChannel = null;
        try {
            File file2 = new File(generateFilepath4Image);
            if (!file2.exists()) {
                file2.createNewFile();
            }
            fileChannel = new FileOutputStream(file2, false).getChannel();
            fileChannel.write(byteBuffer);
            if (fileChannel == null) {
                return;
            }
        } catch (Exception e2) {
            String str2 = TAG;
            Log.e(str2, "saveMorphoPanoramaOriginalPic  " + e2.toString());
            if (fileChannel == null) {
                return;
            }
        } catch (Throwable th) {
            if (fileChannel != null) {
                try {
                    fileChannel.close();
                } catch (Exception unused) {
                }
            }
            throw th;
        }
        try {
            fileChannel.close();
        } catch (Exception unused2) {
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x007a A[SYNTHETIC, Splitter:B:22:0x007a] */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0083 A[SYNTHETIC, Splitter:B:26:0x0083] */
    /* JADX WARNING: Removed duplicated region for block: B:32:? A[RETURN, SYNTHETIC] */
    public static void saveOriginalPic(byte[] bArr, int i, String str) {
        File file = new File(DIRECTORY + File.separator + str + File.separator);
        if (!file.exists()) {
            file.mkdirs();
        }
        FileOutputStream fileOutputStream = null;
        try {
            File file2 = new File(generateFilepath4Image(str + File.separator + str + "_" + i, false));
            if (!file2.exists()) {
                file2.createNewFile();
            }
            FileOutputStream fileOutputStream2 = new FileOutputStream(file2);
            try {
                fileOutputStream2.write(bArr);
            } catch (Exception e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
                try {
                    Log.e(TAG, "saveMorphoPanoramaOriginalPic exception occurs", (Throwable) e);
                    if (fileOutputStream == null) {
                    }
                } catch (Throwable th) {
                    th = th;
                    if (fileOutputStream != null) {
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.flush();
                        fileOutputStream.close();
                    } catch (Exception unused) {
                    }
                }
                throw th;
            }
            try {
                fileOutputStream2.flush();
                fileOutputStream2.close();
            } catch (Exception unused2) {
            }
        } catch (Exception e3) {
            e = e3;
            Log.e(TAG, "saveMorphoPanoramaOriginalPic exception occurs", (Throwable) e);
            if (fileOutputStream == null) {
                fileOutputStream.flush();
                fileOutputStream.close();
            }
        }
    }

    public static void saveToCloudAlbum(Context context, String str, long j, boolean z) {
        saveToCloudAlbum(context, str, j, false, -1, z);
    }

    public static void saveToCloudAlbum(Context context, String str, long j, boolean z, long j2, boolean z2) {
        context.sendBroadcast(getSaveToCloudIntent(context, str, j, z, j2, z2));
    }

    public static boolean secondaryStorageMounted() {
        StringBuilder sb = new StringBuilder();
        sb.append(SECONDARY_STORAGE_PATH);
        sb.append(File.separator);
        sb.append(Environment.DIRECTORY_DCIM);
        return hasSecondaryStorage() && getAvailableSpace(sb.toString()) > 0;
    }

    private static void setLeftSpace(long j) {
        LEFT_SPACE.set(j);
        String str = TAG;
        Log.i(str, "setLeftSpace(" + j + ")");
    }

    public static void setStorageListener(StorageListener storageListener) {
        if (storageListener != null) {
            sStorageListener = new WeakReference<>(storageListener);
        }
    }

    public static void switchStoragePathIfNeeded() {
        if (hasSecondaryStorage()) {
            String str = FIRST_CONSIDER_STORAGE_PATH;
            String str2 = SECONDARY_STORAGE_PATH;
            if (str.equals(str2)) {
                str2 = PRIMARY_STORAGE_PATH;
            }
            String str3 = sCurrentStoragePath;
            if (!isLowStorageSpace(str + CAMERA_STORAGE_PATH_SUFFIX)) {
                sCurrentStoragePath = str;
            } else {
                if (!isLowStorageSpace(str2 + CAMERA_STORAGE_PATH_SUFFIX)) {
                    sCurrentStoragePath = str2;
                } else {
                    return;
                }
            }
            if (!sCurrentStoragePath.equals(str3)) {
                updateDirectory();
                WeakReference<StorageListener> weakReference = sStorageListener;
                if (!(weakReference == null || weakReference.get() == null)) {
                    ((StorageListener) sStorageListener.get()).onStoragePathChanged();
                }
            }
            String str4 = TAG;
            Log.d(str4, "Storage path is switched path = " + DIRECTORY + ", FIRST_CONSIDER_STORAGE_PATH = " + FIRST_CONSIDER_STORAGE_PATH + ", SECONDARY_STORAGE_PATH = " + SECONDARY_STORAGE_PATH);
        }
    }

    public static void switchToPhoneStorage() {
        String str = PRIMARY_STORAGE_PATH;
        FIRST_CONSIDER_STORAGE_PATH = str;
        if (!str.equals(sCurrentStoragePath)) {
            Log.v(TAG, "switchToPhoneStorage");
            sCurrentStoragePath = PRIMARY_STORAGE_PATH;
            updateDirectory();
            WeakReference<StorageListener> weakReference = sStorageListener;
            if (weakReference != null && weakReference.get() != null) {
                ((StorageListener) sStorageListener.get()).onStoragePathChanged();
            }
        }
    }

    private static void updateDirectory() {
        DIRECTORY = sCurrentStoragePath + CAMERA_STORAGE_PATH_SUFFIX;
        RAW_DIRECTORY = DIRECTORY + RAW_PATH_SUFFIX;
        HIDEDIRECTORY = sCurrentStoragePath + HIDE_CAMERA_STORAGE_PATH_SUFFIX;
        BUCKET_ID = DIRECTORY.toLowerCase(Locale.ENGLISH).hashCode();
    }

    private static byte[] updateExif(byte[] bArr, boolean z, String str, PictureInfo pictureInfo, int i, int i2, int i3) {
        if (!z && TextUtils.isEmpty(str) && pictureInfo == null) {
            return bArr;
        }
        long currentTimeMillis = System.currentTimeMillis();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ExifInterface exifInterface = new ExifInterface();
            exifInterface.readExif(bArr);
            if (z) {
                exifInterface.addParallelProcessComment("processing", i, i2, i3);
            }
            if (!TextUtils.isEmpty(str)) {
                String str2 = TAG;
                Log.d(str2, "save algorithm: " + str);
                exifInterface.addAlgorithmComment(str);
            }
            if (pictureInfo != null) {
                String str3 = TAG;
                Log.d(str3, "save xiaomi comment: " + pictureInfo.getInfoString() + ", aiType = " + pictureInfo.getAiType());
                exifInterface.addAiType(pictureInfo.getAiType());
                if (pictureInfo.isBokehFrontCamera()) {
                    exifInterface.addFrontMirror(pictureInfo.isFrontMirror() ? 1 : 0);
                }
                pictureInfo.setAfRoi(i, i2, i3);
                exifInterface.addXpComment(pictureInfo.getXpCommentBytes());
                exifInterface.addXiaomiComment(pictureInfo.getInfoString());
            }
            exifInterface.writeExif(bArr, (OutputStream) byteArrayOutputStream);
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            bArr = byteArray;
        } catch (Exception e2) {
            String str4 = TAG;
            Log.e(str4, "updateExif error " + e2.getMessage(), (Throwable) e2);
        }
        String str5 = TAG;
        Log.v(str5, "update exif cost=" + (System.currentTimeMillis() - currentTimeMillis));
        return bArr;
    }

    /* JADX WARNING: Can't wrap try/catch for region: R(4:24|25|26|27) */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x0089, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:?, code lost:
        throw r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x008c, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x008d, code lost:
        r2 = r0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x008e, code lost:
        if (r13 != null) goto L_0x0090;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:?, code lost:
        $closeResource(r1, r13);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x0093, code lost:
        throw r2;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:26:0x0065 */
    /* JADX WARNING: Removed duplicated region for block: B:100:0x01b8  */
    /* JADX WARNING: Removed duplicated region for block: B:104:0x01e0  */
    /* JADX WARNING: Removed duplicated region for block: B:107:0x0206  */
    /* JADX WARNING: Removed duplicated region for block: B:111:0x021f  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x00ba  */
    /* JADX WARNING: Removed duplicated region for block: B:77:0x0118  */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x011b  */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x012f  */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x0131  */
    /* JADX WARNING: Removed duplicated region for block: B:85:0x0136  */
    /* JADX WARNING: Removed duplicated region for block: B:92:0x0186  */
    public static boolean updateImage(Context context, byte[] bArr, boolean z, ExifInterface exifInterface, Uri uri, String str, Location location, int i, int i2, int i3, String str2) {
        String str3;
        String str4;
        String str5;
        boolean z2;
        byte[] bArr2 = bArr;
        boolean z3 = z;
        ExifInterface exifInterface2 = exifInterface;
        String str6 = str;
        String str7 = str2;
        boolean z4 = false;
        boolean z5 = str7 == null && isUseDocumentMode();
        String generateFilepath4Image = generateFilepath4Image(str6, z3);
        if (z5) {
            str3 = generateFilepath4Image;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append(str7 != null ? generateFilepath4Image(str7, z3) : generateFilepath4Image);
            sb.append(".tmp");
            str3 = sb.toString();
        }
        File file = new File(str3);
        if (bArr2 != null) {
            try {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(new ByteArrayInputStream(bArr2));
                try {
                    OutputStream fileOutputStream = isUseDocumentMode() ? FileCompat.getFileOutputStream(str3, true) : new BufferedOutputStream(new FileOutputStream(file));
                    if (exifInterface2 == null) {
                        byte[] bArr3 = new byte[4096];
                        while (true) {
                            int read = bufferedInputStream.read(bArr3);
                            if (read == -1) {
                                break;
                            }
                            fileOutputStream.write(bArr3, 0, read);
                        }
                    } else {
                        exifInterface2.writeExif(bArr2, fileOutputStream);
                        Log.e(TAG, "Failed to rewrite Exif");
                        fileOutputStream.write(bArr2);
                    }
                    if (fileOutputStream != null) {
                        $closeResource((Throwable) null, fileOutputStream);
                    }
                    $closeResource((Throwable) null, bufferedInputStream);
                } finally {
                    Throwable th = th;
                    try {
                    } catch (Throwable th2) {
                        Throwable th3 = th2;
                        $closeResource(th, bufferedInputStream);
                        throw th3;
                    }
                }
            } catch (Exception e2) {
                Log.e(TAG, "Failed to write image", (Throwable) e2);
                return false;
            }
        } else if (str7 != null) {
            str4 = generateFilepath4Image(str7, z3);
            long length = file.length();
            if (!isUseDocumentMode()) {
                boolean renameTo = file.renameTo(new File(generateFilepath4Image));
                if (!(exifInterface2 == null || str7 == null)) {
                    try {
                        new File(generateFilepath4Image(str7, z3)).delete();
                    } catch (Exception e3) {
                        Log.e(TAG, "Exception when delete old file " + str7, (Throwable) e3);
                    }
                }
                if (!renameTo) {
                    Log.w(TAG, "renameTo failed, tmpPath = " + str4);
                    return false;
                }
            }
            ContentValues contentValues = new ContentValues(10);
            contentValues.put("title", str6);
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str6);
            sb2.append(!z3 ? HEIC_SUFFIX : JPEG_SUFFIX);
            contentValues.put("_display_name", sb2.toString());
            String str8 = !isUseDocumentMode() ? str4 : generateFilepath4Image;
            if (bArr2 == null) {
                contentValues.put("mime_type", z3 ? MIME_HEIC : MIME_JPEG);
                contentValues.put("orientation", Integer.valueOf(i));
                contentValues.put("_size", Long.valueOf(length));
                contentValues.put("width", Integer.valueOf(i2));
                contentValues.put("height", Integer.valueOf(i3));
                if (location != null) {
                    contentValues.put("latitude", Double.valueOf(location.getLatitude()));
                    contentValues.put("longitude", Double.valueOf(location.getLongitude()));
                }
                contentValues.put("_data", str8);
            } else if (str7 != null) {
                contentValues.put("_data", str8);
            }
            context.getContentResolver().update(uri, contentValues, (String) null, (String[]) null);
            if (!z5 && isUseDocumentMode()) {
                str5 = generateFilepath4Image + ".mid";
                if (!renameSdcardFile(generateFilepath4Image, str5)) {
                    z2 = renameSdcardFile(str4, generateFilepath4Image);
                    if (z2) {
                        deleteSdcardFile(str5);
                    } else {
                        Log.w(TAG, "fail to rename " + str4 + " to " + generateFilepath4Image);
                        deleteSdcardFile(str4);
                    }
                } else {
                    Log.w(TAG, "fail to rename " + generateFilepath4Image + " to " + str5);
                    deleteSdcardFile(str5);
                    z2 = false;
                }
                FileCompat.removeDocumentFileForPath(str4);
                FileCompat.removeDocumentFileForPath(generateFilepath4Image);
                if (!z2) {
                    Log.w(TAG, "renameTo failed, tmpPath = " + str4);
                    return false;
                }
            }
            long length2 = (long) bArr2.length;
            if (location == null) {
                z4 = true;
            }
            saveToCloudAlbum(context, generateFilepath4Image, length2, z4);
            return true;
        }
        str4 = str3;
        long length3 = file.length();
        if (!isUseDocumentMode()) {
        }
        ContentValues contentValues2 = new ContentValues(10);
        contentValues2.put("title", str6);
        StringBuilder sb22 = new StringBuilder();
        sb22.append(str6);
        sb22.append(!z3 ? HEIC_SUFFIX : JPEG_SUFFIX);
        contentValues2.put("_display_name", sb22.toString());
        if (!isUseDocumentMode()) {
        }
        if (bArr2 == null) {
        }
        context.getContentResolver().update(uri, contentValues2, (String) null, (String[]) null);
        str5 = generateFilepath4Image + ".mid";
        if (!renameSdcardFile(generateFilepath4Image, str5)) {
        }
        FileCompat.removeDocumentFileForPath(str4);
        FileCompat.removeDocumentFileForPath(generateFilepath4Image);
        if (!z2) {
        }
        long length22 = (long) bArr2.length;
        if (location == null) {
        }
        saveToCloudAlbum(context, generateFilepath4Image, length22, z4);
        return true;
    }

    public static boolean updateImageSize(ContentResolver contentResolver, Uri uri, long j) {
        ContentValues contentValues = new ContentValues(1);
        contentValues.put("_size", Long.valueOf(j));
        try {
            contentResolver.update(uri, contentValues, (String) null, (String[]) null);
            return true;
        } catch (Exception e2) {
            String str = TAG;
            Log.e(str, "Failed to updateMediaStore" + e2);
            return false;
        }
    }

    public static boolean updateImageWithExtraExif(Context context, byte[] bArr, boolean z, ExifInterface exifInterface, Uri uri, String str, Location location, int i, int i2, int i3, String str2, boolean z2, boolean z3, String str3, PictureInfo pictureInfo) {
        return updateImage(context, updateExif(bArr, z3, str3, pictureInfo, i, i2, i3), z, exifInterface, uri, str, location, i, i2, i3, str2);
    }
}
