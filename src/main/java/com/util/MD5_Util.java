package com.util;

import org.apache.shiro.crypto.hash.SimpleHash;

/**
 * 调用Shiro使用盐值加密
 */
public class MD5_Util {
    private static String arithmetic = "MD5";   //加密算法
    private static int number = 2;  //需要循环加密次数

    public static String getArithmetic() {
        return arithmetic;
    }

    public static void setArithmetic(String arithmetic) {
        MD5_Util.arithmetic = arithmetic;
    }

    public static int getNumber() {
        return number;
    }

    public static void setNumber(int number) {
        MD5_Util.number = number;
    }

    /**
     * @param salt     盐
     * @param password 需要加密的源
     * @return
     */
    public static String MD5_Encryption(String salt, String password) {
        String result = new SimpleHash(arithmetic, password, salt, number).toString();
        return result;
    }

    /**
     * 密码比对校验
     *
     * @param source   原密码
     * @param salt     盐
     * @param password 需对比的密码
     * @return
     */
    public static boolean MD5_Verify(String source, String salt, String password) {
        if (source.equals(MD5_Encryption(salt , password)))
            return true;
        else
            return false;
    }


    public static void main(String[] args) {
        String s = MD5_Util.MD5_Encryption("15179442623", "123456");
        System.out.println(s);
        boolean b = MD5_Verify("cd57b36cfbf1bbf88f8da37eb0379d02", "15179442623", "123456");
        System.out.println(b);
    }
}
