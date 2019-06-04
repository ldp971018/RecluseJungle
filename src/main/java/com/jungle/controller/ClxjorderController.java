package com.jungle.controller;

import com.jungle.bean.Reguser;
import com.jungle.service.ClxjorderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 丛林闲居-用户中心-丛林闲居订单
 */
@Controller
public class ClxjorderController {
    @Resource
    ClxjorderService clxjorderServiceImpl;

    /**
     * 丛林闲居订单-所有订单
     * @param model
     * @return
     */
    @RequestMapping("showAllClxjorderByUserid")
    public String showAllClxjorderByUserid(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = clxjorderServiceImpl.findClxjorderByUserid(user.getId());
        model.addAttribute("list", list);
         return "qiantai/UserJAOrder";
    }

    /**
     * 丛林闲居订单-未完成
     */
    @RequestMapping("findClxjorderState0")
    public String findClxjorderState0(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = clxjorderServiceImpl.findClxjorderByUseridAndState0(user.getId());
        model.addAttribute("list", list);
        return "qiantai/UserJAOrder";
    }
    /**
     * 丛林闲居订单-已完成
     */
    @RequestMapping("findClxjorderState1")
    public String findClxjorderState1(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = clxjorderServiceImpl.findClxjorderByUseridAndState1(user.getId());
        model.addAttribute("list", list);
        return "qiantai/UserJAOrder";
    }
    /**
     * 取消预订/再次预订
     */
    @RequestMapping("editClxjorderState")
    public String editCarorderState(HttpSession session, @RequestParam String oid) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        clxjorderServiceImpl.editClxjorderState(user.getId(),oid);
        return "redirect:/showAllClxjorderByUserid";
    }

}
