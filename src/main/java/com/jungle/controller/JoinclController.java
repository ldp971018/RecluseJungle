package com.jungle.controller;

import com.jungle.bean.Reguser;
import com.jungle.service.JoinclService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 丛林闲居-用户中心-加盟进度查询
 */
@Controller
public class JoinclController {
    @Resource
    JoinclService joinclServiceImpl;

    /**
     * 加盟进度查询-丛林
     * @param model
     * @return
     */
    @RequestMapping("showAllJoinclByUserid")
    public String showAllJoinclByUserid(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = joinclServiceImpl.findJoinclByUserid(user.getId());
        model.addAttribute("list", list);
        return "qiantai/UserJPquery";
    }
}
