package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author Aimelony
 * @Date 2019/5/29 15:53
 * @File GetTimestamp
 * @Describe 得到时间搓
 **/
public class GetTimestamp {
    /**
     * 得到当前时间精确毫秒
     *
     * @return
     */
    public synchronized static String getTimestamp() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssS");
        String format = simpleDateFormat.format(new Date());
        return format;
    }

    public static void main(String[] args) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssS");
        String format = simpleDateFormat.format(new Date());
        System.out.println(format);
    }
}
