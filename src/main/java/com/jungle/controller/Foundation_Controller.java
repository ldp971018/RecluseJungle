package com.jungle.controller;

import com.jungle.bean.Helpinfo;
import com.jungle.service.FoundationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;


/**
 * @Author Aimelony
 * @Date 2019/5/29 14:15
 * @File Foundation_Controller
 * @Describe 基金会控制器（用于处理基金会模块）
 **/
@Controller
public class Foundation_Controller {
    @Autowired
    private FoundationService foundationServiceImpl;

    /**
     * 救助扶助（申请信息录入）
     *
     * @param helpinfo 救助对象
     * @param type     救助（salvation）-扶助（saveUp）
     * @param fileName 上传的文件
     */
    @RequestMapping("/helpinfo")
    public String helpinfo(Helpinfo helpinfo, String type, MultipartFile[] fileName, HttpServletRequest req) {
        System.out.println(type + "-" + helpinfo.toString());
        for (int i = 0; i < fileName.length; i++)
            System.out.println(fileName[i].getOriginalFilename());
        if (helpinfo != null && helpinfo.getName() != null && !"".equals(helpinfo.getName()) && type != null && !"".equals(type)) {
            int i = foundationServiceImpl.insHelpInfo(helpinfo, type, fileName, req);
            if (i != 0)
                req.setAttribute("msg", "信息已提交！请留意后续通知！");
            else
                req.setAttribute("msg", "信息提交失败！，我们感到十分抱歉,请重试！");
        } else {
            req.setAttribute("msg", "检测您的提交信息存在异常！");
        }
        return "qiantai/FoundRescue";
    }

}
