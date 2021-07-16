package util;

import javax.servlet.http.Part;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyUtil {
    /**
     * @return String
     * @discription 获得一个时间串
     */
    public static String getStringID() {
        String id = null;
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHmmssSSS");
        id = sdf.format(date);
        return id;
    }

    /**
     * @return String
     * @discription 从part中获得原始文件名
     */
    public static String getFileName(Part part) {
        if (part == null) return null;
//    fileName形式为：form-data; name="resPath"; filename="20140920_110531.jpg"
        String fileName = part.getHeader("content-disposition");
        //没有选择文件
        if (fileName.lastIndexOf("=") + 2 == fileName.length() - 1)
            return null;
        return fileName.substring(fileName.lastIndexOf("=") + 2, fileName.length() - 1);
    }
}
