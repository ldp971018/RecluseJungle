package com.util;

import java.util.UUID;

//通过此工具类，获得随机的文件名称
public class UploadUtils {
	/*
	 * 获得文件名称
	 */
	public static String getUuidFileName(String fileName) {
		//1.首先获得文件名中“.”的位置索引
		int index=fileName.lastIndexOf(".");
		//2.得到文件后缀
		String ext=fileName.substring(index);
		//3.获得随机名称
		String name=UUID.randomUUID().toString().replace("-", "")+ext;
		return name;
	}
	/*
	 * 获得文件目录
	 */
	public static String getPath(String uuidFileName) {
		int code1=uuidFileName.hashCode();
		int d1=code1& 0xf;//作为一级目录
		int code2=code1 >>4;
		int d2=code2& 0xf;//作为二级目录
		return "/"+d1+"/"+d2;
	}
}

