package org.jcodec.codecs.h264.mp4;

import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import org.jcodec.common.Preconditions;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.Header;

public class AvcCBox extends Box {
    private int level;
    private int nalLengthSize;
    private List<ByteBuffer> ppsList = new ArrayList();
    private int profile;
    private int profileCompat;
    private List<ByteBuffer> spsList = new ArrayList();

    public AvcCBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "avcC";
    }

    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.put((byte) 1);
        byteBuffer.put((byte) this.profile);
        byteBuffer.put((byte) this.profileCompat);
        byteBuffer.put((byte) this.level);
        byteBuffer.put((byte) -1);
        byteBuffer.put((byte) (this.spsList.size() | 224));
        for (ByteBuffer next : this.spsList) {
            byteBuffer.putShort((short) (next.remaining() + 1));
            byteBuffer.put((byte) 103);
            NIOUtils.write(byteBuffer, next);
        }
        byteBuffer.put((byte) this.ppsList.size());
        for (ByteBuffer next2 : this.ppsList) {
            byteBuffer.putShort((short) ((byte) (next2.remaining() + 1)));
            byteBuffer.put((byte) 104);
            NIOUtils.write(byteBuffer, next2);
        }
    }

    public int estimateSize() {
        int i = 17;
        for (ByteBuffer remaining : this.spsList) {
            i += remaining.remaining() + 3;
        }
        for (ByteBuffer remaining2 : this.ppsList) {
            i += remaining2.remaining() + 3;
        }
        return i;
    }

    public void parse(ByteBuffer byteBuffer) {
        NIOUtils.skip(byteBuffer, 1);
        this.profile = byteBuffer.get() & 255;
        this.profileCompat = byteBuffer.get() & 255;
        this.level = byteBuffer.get() & 255;
        this.nalLengthSize = (byteBuffer.get() & 255 & 3) + 1;
        byte b2 = byteBuffer.get() & 31;
        for (int i = 0; i < b2; i++) {
            short s = byteBuffer.getShort();
            Preconditions.checkState(39 == (byteBuffer.get() & 63));
            this.spsList.add(NIOUtils.read(byteBuffer, s - 1));
        }
        byte b3 = byteBuffer.get() & 255;
        for (int i2 = 0; i2 < b3; i2++) {
            short s2 = byteBuffer.getShort();
            Preconditions.checkState(40 == (byteBuffer.get() & 63));
            this.ppsList.add(NIOUtils.read(byteBuffer, s2 - 1));
        }
    }
}
