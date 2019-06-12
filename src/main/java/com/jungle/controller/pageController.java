package com.jungle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 用于其他无业务功能的页面跳转
 */
@Controller
public class pageController {
    /**
     * 跳转前台登录页面
     *
     * @return
     */
    @RequestMapping("/login")
    public String login(String returnurl, String id, HttpSession session) {
        System.out.println("跳转-" + returnurl + "-" + id);
        session.setAttribute("returnurl", returnurl);
        if (!"undefined".equals(id))
            session.setAttribute("id", id);
        return "qiantai/login";
    }

    /**
     * 跳转前台主界面左链页面
     *
     * @return
     */
    @RequestMapping("/left")
    public String left() {
        return "qiantai/left";
    }

    /**
     * 跳转到注册页面
     *
     * @return
     */
    @RequestMapping("/register")
    public String register() {
        return "qiantai/register";
    }

    /**
     * 跳转到忘记密码页面
     *
     * @return
     */
    @RequestMapping("/retrievePassword")
    public String retrievePassword() {
        return "qiantai/RetrievePassword";
    }

    /**
     * 跳转前台主界面右边主页面
     *
     * @return
     */
    @RequestMapping("/right")
    public String right() {
        return "qiantai/right";
    }

    /**
     * 跳转丛林界面
     *
     * @return
     */
    @RequestMapping("clxjmain")
    public String clxjmain() {
        return "redirect:selRedisCL_All";
    }

    /**
     * 跳转闲居界面
     *
     * @return
     */
    @RequestMapping("JungleList")
    public String JungleList() {
        return "redirect:selRedisJungle_All";
    }


    /**
     * 跳转到基金会页面（基金会）
     *
     * @return
     */
    @RequestMapping("/foundIndex")
    public String foundIndex() {
        return "qiantai/FoundIndex";
    }

    /**
     * 跳转到我要求助（基金会）
     *
     * @return
     */
    @RequestMapping("/foundRescue")
    public String foundRescue() {
        return "qiantai/FoundRescue";
    }

    /**
     * 跳转到我要查询（基金会）
     *
     * @return
     */
    @RequestMapping("/donationLove")
    public String donationLove(HttpServletRequest request, @RequestParam(defaultValue = "") String donationname, @RequestParam(defaultValue = "") String donationtime) {
        request.setAttribute("donationname",donationname);
        request.setAttribute("donationtime",donationtime);
        return "qiantai/DonationLove";
    }

    /**
     * 跳转到我要捐款（基金会）
     *
     * @return
     */
    @RequestMapping("/foundDonations")
    public String foundDonations() {
        return "qiantai/FoundDonations";
    }


    /**
     * 跳转到公示列表（基金会）
     *
     * @return
     */
    @RequestMapping("/foundJzfzlist")
    public String foundJzfzlist() {
        return "qiantai/FoundJzfzlist";
    }

    /**
     * 跳转到月底支出查询（基金会-我要查询）
     *
     * @return
     */
    @RequestMapping("/pLlist")
    public String pLlist() {
        return "qiantai/PLlist";
    }

    /**
     * 跳转到款物发放公示（基金会-我要查询）
     *
     * @return
     */
    @RequestMapping("/pLpublicity")
    public String pLpublicity() {
        return "qiantai/PLpublicity";
    }

    /**
     * 跳转到查看详情（基金会-公示列表）
     *
     * @param id
     * @return
     */
    @RequestMapping("/foundJzfzDetailed")
    public String foundJzfzDetailed(Integer id, HttpServletRequest req) {
        System.out.println("page-" + id);
//        modelAndView.setViewName("qiantai/FoundJzfzDetailed");
//        modelAndView.addObject("id", id);
        req.setAttribute("id", id);
        return "qiantai/FoundjzfzDetailed";
    }


    /**
     * 跳转个人中心
     *
     * @return
     */
    @RequestMapping("userPersonal")
    public String userPersonal() {
        return "qiantai/UserPersonal";
    }

    /**
     * 跳转修改密码
     */
    @RequestMapping("userCPassword")
    public String userCPassword() {
        return "qiantai/UserCPassword";
    }

    /**
     * 联系我们
     * @return
     */
    @RequestMapping("/ContactUs")
    public String ContactUs(){
        return "qiantai/ContactUs";
    }
    /**
     * 跳转到忏悔页面
     * @return
     */
    @RequestMapping("ConEntryPage")
    public String ConEntryPage(){
        return "qiantai/ConEntryPage";
    }

    /**
     * 进入忏悔
     */
    @RequestMapping("/ConRoom")
    public String ConRoom(){
        return "qiantai/ConRoom";
    }

    /**
     * 跳转加盟丛林
     */
    @RequestMapping("/joincl")
    public String joincl(){
        return "qiantai/joincl";
    }


    /**
     * 丛林素斋
     * @return
     */
    @RequestMapping("/clsz")
    public String clsz(){
        return "qiantai/clsz";
    }
}
