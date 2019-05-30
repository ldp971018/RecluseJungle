package com.jungle.serviceImpl;

import com.jungle.bean.Helpinfo;
import com.jungle.dao.HelpinfoMapper;
import com.jungle.service.FoundationService;
import com.util.DeleteFile;
import com.util.GetTimestamp;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author Aimelony
 * @Date 2019/5/29 15:25
 * @File FoundationServiceImpl
 * @Describe describe
 **/
@Service
public class FoundationServiceImpl implements FoundationService {

    @Autowired
    private HelpinfoMapper helpinfoMapper;

    /**
     * 录入救助扶助信息
     *
     * @param helpinfo 救助对象（bean）
     * @param type     救助（salvation）1 - 扶助（saveUp）0
     * @param fileName 上传的文件
     * @return
     */
    @Override
    public int insHelpInfo(Helpinfo helpinfo, String type, MultipartFile[] fileName, HttpServletRequest req) {
        String path;
        File fileDir = null;
        int i = 0;
        try {
            path = req.getServletContext().getRealPath("foundationUploadFile");
            path = path + "\\" + GetTimestamp.getTimestamp();
            fileDir = new File(path);
            if (!fileDir.exists()) { //如果不存在 则创建
                fileDir.mkdirs();
            }
            for (int j = 0; j < fileName.length; j++) {
                File saveFile = new File(path, fileName[j].getOriginalFilename());
                FileUtils.copyInputStreamToFile(fileName[j].getInputStream(), saveFile); //复制
            }
            System.out.println("文件夹路径-" + path);
            if ("salvation".equals(type))
                helpinfo.setApplytype(true);//救助
            else
                helpinfo.setApplytype(false);//扶助
            String[] url = path.split("foundationUploadFile");
            helpinfo.setFileurl("\\foundationUploadFile" + url[1]);
            System.out.println("录入路径-"+"\\foundationUploadFile" + url[1]);
            helpinfo.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            i = helpinfoMapper.insertSelective(helpinfo);
            System.out.println("录入信息-" + i + " 路径-" + fileDir.exists());
            if (i == 0) {
                if (fileDir != null && fileDir.exists()) { //如果存在 则删除
                    DeleteFile.deleteFile(fileDir);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (fileDir != null && fileDir.exists()) { //如果存在 则删除
                DeleteFile.deleteFile(fileDir);
            }
            return i;
        }
        return i;
    }
}
