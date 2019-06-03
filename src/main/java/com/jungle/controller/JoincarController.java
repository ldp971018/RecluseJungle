package com.jungle.controller;

import com.jungle.bean.Reguser;
import com.jungle.service.JoincarService;
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
public class JoincarController {
    @Resource
    JoincarService joincarServiceImpl;

    /**
     * 加盟进度查询-用车
     * @param model
     * @return
     */
    @RequestMapping("showAllJoincarByUserid")
    public String showAllJoincarByUserid(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = joincarServiceImpl.findJoincarByUserid(user.getId());
        model.addAttribute("list", list);
        return "qiantai/UserJPquery";
    }
}
