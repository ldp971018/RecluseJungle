package com.jungle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pageController {
    /**
     * 跳转前台登录页面
     *
     * @return
     */
    @RequestMapping("/login")
    public String login() {
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
     * @return
     */
    @RequestMapping("clxjmain")
    public String clxjmain() {
        return "qiantai/clxjmain";
    }
    /**
     * 跳转闲居界面
     * @return
     */
    @RequestMapping("JungleList")
    public String JungleList() {
        return "qiantai/JungleList";
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
    public String donationLove() {
        return "qiantai/DonationLove";
    }

    /**
     * 跳转到我要捐款（基金会）
     *
     * @return
     */
    @RequestMapping("/foundDonations")
    public String foundDonations() {
        return "qiantai/foundDonations";
    }

    /**
     * 跳转到求助进度（基金会）
     *
     * @return
     */
    @RequestMapping("/userPquery")
    public String userPquery() {
        return "qiantai/UserPquery";
    }

    /**
     * 跳转到我要求助（基金会）
     *
     * @return
     */
    @RequestMapping("/foundJzfzlist")
    public String foundJzfzlist() {
        return "qiantai/FoundJzfzlist";
    }
}
