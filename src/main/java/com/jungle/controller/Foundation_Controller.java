package com.jungle.controller;

import com.jungle.bean.*;
import com.jungle.service.FoundationService;
import com.jungle.serviceImpl.FoundationServiceImpl;
import com.jungle.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.ParseException;
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
    public RedisUtil redisUtil;
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
     * 查询捐款总金额 爱心捐赠明细（基金会-我要查询）（基金会-我要捐增）
     *
     * @return
     */
    @RequestMapping("/selDonationLoveCount")
    @ResponseBody
    public Map<String, Object> selDonation() {
        HashMap<String, Object> map = new HashMap<>();
        String money = "" + foundationServiceImpl.selRedisDonationCount();
        List countMoney = new ArrayList();
        for (int i = 0; i < money.length(); i++) {
            countMoney.add(money.substring(i, i + 1));
        }
        System.out.println("总金额-" + countMoney.toString());
        map.put("msg", countMoney);

        return map;
    }

    /**
     * 爱心捐赠明细（基金会-我要查询）
     *
     * @param page         当前页
     * @param limit        每页显示多少条数据
     * @param donationname 名称查询条件
     * @param donationtime 时间条件查询
     * @return
     */
    @RequestMapping("/selDonation")
    @ResponseBody
    public Map<String, Object> selDonation(@RequestParam(defaultValue = "") String donationname, @RequestParam(defaultValue = "") String donationtime, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer limit) {
        System.out.println("donationname："+donationname+"\tdonationtime:"+donationtime);
        System.out.println(page + "-" + limit);
        HashMap<String, Object> map = new HashMap<>();
        List<Donation> donations = null;
        try {
            donations = foundationServiceImpl.selRedisDonation(donationtime, donationname, page, limit);
        } catch (ParseException e) {
//            e.printStackTrace();
        }
        System.out.println(donations.toString());
        map.put("code", 0);
        System.out.println("返回的数量-" + FoundationServiceImpl.donationCount);
        if (null == FoundationServiceImpl.donationCount) {
            FoundationServiceImpl.donationCount = null;
            map.put("count", ((List<Object>) redisUtil.get("selRedisDonation")).size());
        } else {
            map.put("count", FoundationServiceImpl.donationCount);
            FoundationServiceImpl.donationCount = null;
        }
        map.put("data", donations);
        return map;
    }

    /**
     * 月底支出查询（基金会-我要查询）
     *
     * @param projectname 条件查询项目名
     * @param paymoney    条件查询支出金额
     * @param monthly     条件查询月度
     * @param page        当前页
     * @param limit       每页显示多少条数据
     * @return
     */
    @RequestMapping("/selPList")
    @ResponseBody
    public Map<String, Object> selPList(String projectname, BigDecimal paymoney, String monthly, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer limit) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);
        List<Payformonth> payformonths = null;
        try {
            payformonths = foundationServiceImpl.selRedisPList(projectname, paymoney, monthly, page, limit);
        } catch (ParseException e) {
//            e.printStackTrace();
        }
        if (null == FoundationServiceImpl.plistCount) {
            FoundationServiceImpl.plistCount = null;
            map.put("count", ((List<Object>) redisUtil.get("selRedisPList")).size());
        } else {
            map.put("count", FoundationServiceImpl.plistCount);
            FoundationServiceImpl.plistCount = null;
        }
        map.put("data", payformonths);

        return map;
    }

    /**
     * 款物发放公示（基金会-我要查询）
     *
     * @param donationname 捐款人
     * @param recipients   受助人
     * @param donationTime 捐款时间
     * @param page         当前页
     * @param limit        每页的数量
     * @return
     */
    @RequestMapping("/selPLpublicity")
    @ResponseBody
    public Map<String, Object> selPLpublicity(String donationname, String recipients, String donationTime, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer limit) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);
        List<Grant> grants = null;
        try {
            grants = foundationServiceImpl.selRedisPLpublicity(donationname, recipients, donationTime, page, limit);
        } catch (ParseException e) {
//            e.printStackTrace();
        }

        if (null == FoundationServiceImpl.grantCount) {
            FoundationServiceImpl.grantCount = null;
            map.put("count", ((List<Object>) redisUtil.get("selRedisPLpublicity")).size());
        } else {
            map.put("count", FoundationServiceImpl.grantCount);
            FoundationServiceImpl.grantCount = null;
        }
        map.put("data", grants);

        return map;
    }

    /**
     * 查询基金会支出总额（基金会-我要捐增）
     *
     * @return
     */
    @RequestMapping("/selExpenditure")
    @ResponseBody
    public Map<String, Object> selExpenditure() {
        HashMap<String, Object> map = new HashMap<>();
        Double expenditure = foundationServiceImpl.selExpenditure();
        map.put("msg", expenditure);
        return map;
    }

    /**
     * 公示列表（基金会-公示列表）
     *
     * @param applystatus 公示类型
     * @param name        申请人姓名
     * @param applymoney1 申请金额1
     * @param applymoney2 申请金额2
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/selFoundJzfzlist")
    @ResponseBody
    public Map<String, Object> selFoundJzfzlist(Integer applystatus, String name, Long applymoney1, Long applymoney2, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer limit) {
        System.out.println(applystatus + "-" + name + "-" + applymoney1 + "-" + applymoney2);
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", 0);
        List<Helpinfo> helpinfo = foundationServiceImpl.selRedisFoundJzfzlist(applystatus, name, applymoney1, applymoney2, page, limit);
        System.out.println(helpinfo.toString());
        if (null == FoundationServiceImpl.helpinfoCount) {
            map.put("count", ((List<Object>) redisUtil.get("selRedisFoundJzfzlist")).size());
            FoundationServiceImpl.helpinfoCount = null;
        } else {
            map.put("count", FoundationServiceImpl.helpinfoCount);
            FoundationServiceImpl.helpinfoCount = null;
        }
        map.put("data", helpinfo);
        return map;
    }

    /**
     * 查看详情（基金会-公示列表-数据）
     *
     * @param id 需要查询详情的id
     * @return
     */
    @RequestMapping("/selJzfzDetailed")
    @ResponseBody
    public Map<String, Object> selJzfzDetailed(Integer id) {
        System.out.println("id-" + id);
        Map<String, Object> map = new HashMap<>();
        Helpinfo helpinfo = foundationServiceImpl.selFoundJzfzDetailed(id);
        System.out.println(helpinfo.toString());
        map.put("data", helpinfo);
        return map;
    }

    /**
     * 查询评论（基金会-公示列表-查看详情）
     *
     * @param id 需要查询详情的id
     * @return
     */
    @RequestMapping("/selHelpcomment")
    @ResponseBody
    public Map<String, Object> selHelpcomment(Integer id, Integer page, Integer limit) {
        System.out.println("id-" + id);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        List<Helpcomment> helpcomment = foundationServiceImpl.selRedisHelpcomment(id, page, limit, true);
        if (FoundationServiceImpl.helpcommentcount == null) {
            map.put("count", ((List<Object>) redisUtil.get("selRedisHelpcomment")).size());
            FoundationServiceImpl.helpcommentcount = null;
        } else {
            map.put("count", FoundationServiceImpl.helpcommentcount);
            FoundationServiceImpl.helpcommentcount = null;
        }
        map.put("data", helpcomment);
        return map;
    }

    /**
     * 添加评论（基金会-公示列表-查看详情）
     *
     * @param helpid
     * @param uid
     * @param content
     * @return
     */
    @RequestMapping("/insHelpcomment")
    @ResponseBody
    public Map<String, Object> insHelpcomment(Integer helpid, Integer uid, String content) {
        System.out.println("添加评论-" + helpid + "-" + uid + "-" + content);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        int i = foundationServiceImpl.insHelpcomment(helpid, uid, content);
        if (i != 0)
            map.put("msg", "评论成功！");
        else
            map.put("msg", "评论失败！");
        return map;
    }

    /**
     * 爱心捐赠
     * @param donation
     * @return
     */
    @RequestMapping("/insDonation")
    @ResponseBody
    public Map<String, Object> insDonation(Donation donation){
        donation.setType("0");
        donation.setDonationtime(new Date());
        boolean flag=foundationServiceImpl.insDonation(donation);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        if(flag)
            map.put("msg", "感谢捐赠！欢迎下次再来");
        else
            map.put("msg", "对不起！您的捐赠有误！");
        return map;
    }

}
