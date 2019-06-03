package com.jungle.controller;

import com.jungle.bean.Reguser;
import com.jungle.service.CarorderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 丛林闲居-用户中心-用车订单
 */
@Controller
public class CarorderController {
    @Resource
    CarorderService carorderServiceImpl;

    /**
     * 我的用车订单-所有订单
     * @param model
     * @return
     */
    @RequestMapping("showAllCarorderByUserid")
    public String showAllCarorderByUserid(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = carorderServiceImpl.findCarorderByUserid(user.getId());
        model.addAttribute("list", list);
        return "qiantai/UserCarOrder";
    }

    /**
     * 我的用车订单-未完成
     */
    @RequestMapping("findCarorderState0")
    public String findCarorderState0(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = carorderServiceImpl.findCarorderByUseridAndState0(user.getId());
        model.addAttribute("list", list);
        return "qiantai/UserCarOrder";
    }
    /**
     * 我的用车订单-已完成
     */
    @RequestMapping("findCarorderState1")
    public String findCarorderState1(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = carorderServiceImpl.findCarorderByUseridAndState1(user.getId());
        model.addAttribute("list", list);
        return "qiantai/UserCarOrder";
    }

    /**
     * 取消预订/再次预订
     */
    @RequestMapping("editCarorderState")
    public String editCarorderState(HttpSession session, @RequestParam String oid) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        carorderServiceImpl.editCarorderState(user.getId(),oid);
        return "redirect:/showAllCarorderByUserid";
    }

}
