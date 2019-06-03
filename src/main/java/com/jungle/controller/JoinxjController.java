package com.jungle.controller;

import com.jungle.bean.Reguser;
import com.jungle.service.JoinxjService;
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
public class JoinxjController {
    @Resource
    JoinxjService joinxjServiceImpl;

    /**
     * 加盟进度查询-闲居
     * @param model
     * @param
     * @return
     */
    @RequestMapping("showAllJoinxjByUserid")
    public String showAllJoinxjByUserid(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = joinxjServiceImpl.findJoinxjByUserid(user.getId());
        model.addAttribute("list", list);
        return "qiantai/UserJPquery";
    }
}
