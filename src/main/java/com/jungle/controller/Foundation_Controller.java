package com.jungle.controller;

import com.github.pagehelper.PageInfo;
import com.jungle.bean.Donation;
import com.jungle.bean.Helpinfo;
import com.jungle.service.FoundationService;
import com.jungle.serviceImpl.FoundationServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.*;


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

    /**
     * 查询捐款总金额 爱心捐赠明细（基金会-我要查询）
     *
     * @return
     */
    @RequestMapping("/selDonationLoveCount")
    @ResponseBody
    public Map<String, Object> selDonation() {
        HashMap<String, Object> map = new HashMap<>();
        String money = "" + foundationServiceImpl.selDonationCount();
        List countMoney = new ArrayList();
        for (int i = 0; i < money.length(); i++) {
            countMoney.add(money.substring(i, i + 1));
        }
        map.put("msg", countMoney);

        return map;
    }

    /**
     * 爱心捐赠明细（基金会-我要查询）
     *
     * @param page  当前页
     * @param limit 每页显示多少条数据
     * @return
     */
    @RequestMapping("/selDonation")
    @ResponseBody
    public Map<String, Object> selDonation(@RequestParam(defaultValue = "") String donationname, @RequestParam(defaultValue = "") String donationtime, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer limit) {
        System.out.println(page + "-" + limit);
        HashMap<String, Object> map = new HashMap<>();
        PageInfo<Donation> pageInfo = foundationServiceImpl.selDonation(donationtime, donationname, page, limit);
        System.out.println(pageInfo.getList().toString());
        map.put("code", 0);
        map.put("count", FoundationServiceImpl.donationCount);
        map.put("data", pageInfo.getList());
        return map;
    }

}
