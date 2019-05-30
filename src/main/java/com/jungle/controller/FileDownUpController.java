package com.jungle.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;

/**
 * @Author Aimelony
 * @Date 2019/5/28 19:47
 * @File FileDownloadController
 * 用于文件下载上传
 **/
@Controller
public class FileDownUpController {
    @RequestMapping("/download")
    public void download(String fileName, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        fileName = URLDecoder.decode(fileName, "UTF-8");
        System.out.println("文件名-" + fileName);
        // 设置响应流文件进行下载
        resp.setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes("utf-8"), "ISO-8859-1"));
        // 把二进制流放入到响应体中
        ServletOutputStream os = resp.getOutputStream();
        // 得到文件夹的路径
        String path = req.getServletContext().getRealPath("downloadFile");
        System.out.println(path);
        // 得到一个文件
        File file = new File(path, fileName);
        // 通过jar包的工具类转换成二进制数组
        byte[] bytes = FileUtils.readFileToByteArray(file);
        os.write(bytes);
        os.flush();
        os.close();
    }
}
