package com.jungle.controller;

import com.jungle.service.HelpinfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * 丛林闲居-用户中心-求助进度查询
 */
@Controller
public class HelpinfoController {
    @Resource
    HelpinfoService helpinfoServiceImpl;

    /**
     * 求助进度查询-所有求助
     * @param model
     * @return
     */
    @RequestMapping("showAllHelpinfo")
    public String showAllHelpinfo(Model model) {
        List<?> list = helpinfoServiceImpl.findAllHelpinfo();
        model.addAttribute("list", list);
        return "qiantai/UserPquery";
    }

    /**
     * 求助进度查询-未通过
     */
    @RequestMapping("findHelpinfoStatus0")
    public String findHelpinfoStatus0(Model model) {
        List<?> list = helpinfoServiceImpl.findAllHelpinfoStatus0();
        model.addAttribute("list", list);
        return "qiantai/UserPquery";
    }
    /**
     * 求助进度查询-初审通过
     */
    @RequestMapping("findHelpinfoStatus1")
    public String findHelpinfoStatus1(Model model) {
        List<?> list = helpinfoServiceImpl.findAllHelpinfoStatus1();
        model.addAttribute("list", list);
        return "qiantai/UserPquery";
    }
    /**
     * 求助进度查询-终审通过
     */
    @RequestMapping("findHelpinfoStatus2")
    public String findHelpinfoStatus2(Model model) {
        List<?> list = helpinfoServiceImpl.findAllHelpinfoStatus2();
        model.addAttribute("list", list);
        return "qiantai/UserPquery";
    }
}
