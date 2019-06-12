package com.jungle.controller;

import com.jungle.bean.Reguser;
import com.jungle.service.Desk_ReguserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author Aimelony
 * @Date 2019/5/27 20:20
 * @File Desk_Controller
 **/
@Controller
public class Desk_Controller {
    @Autowired
    private Desk_ReguserService desk_Reguserservice;

    /**
     * 前台页面登录
     *
     * @param reguser 登录对象
     * @param session
     * @param req
     * @return
     */
    @RequestMapping("Desk_login")
    public void Desk_login(Reguser reguser, HttpSession session, HttpServletRequest req, HttpServletResponse res) {
        try {
            System.out.println("Desk_login" + reguser);
            if (reguser != null && reguser.getUsername() != null && !reguser.getUsername().equals("")
                    && reguser.getPwd() != null && !reguser.getPwd().equals("")) {
                Reguser user = desk_Reguserservice.login(reguser);
                System.out.println(user);
                if (user != null) {
                    session.setAttribute("regUser", user);
                    String returnurl = (String) session.getAttribute("returnurl");
                    String id = (String) session.getAttribute("id");
                    System.out.println("需返回url-" + returnurl + "-id" + id);
                    StringBuffer sb = new StringBuffer("forward:");
                    if (id != null && (!"".equals(id) && !"undefined".equals(id)) && returnurl != null && !"".equals(returnurl)) {
                        res.sendRedirect(returnurl + "?id=" + id);
                    } else if ((id == null || "undefined".equals(id)) && returnurl != null && !"".equals(returnurl)) {
                        res.sendRedirect(returnurl);
                    } else {
                        res.sendRedirect("qiantai/login");
                    }
                    session.removeAttribute("returnurl");
                    session.removeAttribute("id");
                } else {
//                    req.setAttribute("login", "用户名或密码错误！");
                    session.setAttribute("login", "用户名或密码错误！");
                    res.sendRedirect("/login");
                }
            } else {
//                req.setAttribute("login", "用户名或密码错误！");
                session.setAttribute("login", "用户名或密码错误！");
                res.sendRedirect("/login");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 验证手机号
     *
     * @param reguser
     * @return
     */
    @RequestMapping("checkMobile")
    @ResponseBody
    public Map<String, Object> checkMobile(Reguser reguser) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", 1);
        if (reguser != null && reguser.getUsername() != null && !reguser.getUsername().equals("")) {
            Reguser reguser1 = desk_Reguserservice.checkMobile(reguser.getUsername());
            System.out.println(reguser1);
            if (reguser1 != null) {
                map.put("status", true);
                map.put("msg", "此手机号已存在！");
                map.put("email", reguser1.getEmail());
            } else {
                map.put("status", false);
                map.put("msg", "");
            }
        } else {
            map.put("status", false);
            map.put("msg", "请输入手机号码！");
        }
        return map;
    }

    /**
     * 对比邮箱验证码
     *
     * @param username 用户名
     * @param code1    输入的验证码
     * @param req
     * @return
     */
    @RequestMapping("/verification")
    @ResponseBody
    public Map<String, Object> verification(String username, String code1, HttpServletRequest req) {
        Map<String, Object> map = new HashMap<>();
        System.out.println(username + "--" + code1);
        String sourceCode = (String) req.getSession().getAttribute(username);
        if (sourceCode != null && sourceCode.equalsIgnoreCase(code1)) {
            map.put("code", 1);
            map.put("msg", "");
        } else {
            map.put("code", 0);
            map.put("msg", "验证码错误");
        }
        return map;
    }

    /**
     * 用户忘记密码（重置密码）
     *
     * @return
     */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public Map<String, Object> updatePwd(Reguser reguser, HttpServletRequest req) {
        Map<String, Object> map = new HashMap<>();
        if (reguser != null && reguser.getUsername() != null && !"".equals(reguser.getUsername()) && reguser.getPwd() != null
                && !"".equals(reguser.getPwd())) {
            req.getSession().removeAttribute(reguser.getUsername());
            int i = desk_Reguserservice.updatePwd(reguser);
            if (i != 0) {
                map.put("status", true);
            } else {
                map.put("status", false);
                map.put("msg", "发生了未知错误，我们感到十分抱歉,请重试");
            }
        } else {
            map.put("status", false);
            map.put("msg", "发生了未知错误，我们感到十分抱歉,请重试");
        }
        return map;
    }

    /**
     * 用户注册
     *
     * @param reguser
     * @return
     */
    @RequestMapping("/insRegister")
    @ResponseBody
    public Map<String, Object> register(Reguser reguser) {
        System.out.println("insRegister" + reguser);
        Map<String, Object> map = new HashMap<>();
        if (reguser != null && reguser.getMobile() != null && !"".equals(reguser.getMobile()) && reguser.getEmail() != null && !"".equals(reguser.getEmail())
                && reguser.getPwd() != null && !"".equals(reguser.getPwd())) {
            int i = desk_Reguserservice.insReguser(reguser);
            System.out.println(i);
            if (i != 0)
                map.put("status", true);
            else
                map.put("status", "false");
        } else {
            map.put("status", "false");
        }
        return map;
    }


    /**
     * 前台用户退出登录
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public void logout(String returnurl, String id, HttpSession session, HttpServletResponse res) {
        try {
            session.removeAttribute("regUser");
            System.out.println("退出账号：" + returnurl + "-" + id);
            if (id != null && !"".equals(id) && !"undefined".equals(id) && returnurl != null && !"".equals(returnurl)) {
                res.sendRedirect(returnurl + "?id=" + id);
            } else if (id == null && returnurl != null && !"".equals(returnurl)) {
                res.sendRedirect(returnurl);
            } else {
                res.sendRedirect("/loadIndex");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 修改用户信息
     *
     * @param reguser
     */
    @RequestMapping("modifyUser")
    public String modifyUser(Reguser reguser, HttpSession session) {
        Reguser regUser = (Reguser) session.getAttribute("regUser");
        reguser.setPwd(regUser.getPwd());
        reguser.setRegtime(regUser.getRegtime());
        System.out.print(reguser);
        int i = desk_Reguserservice.updUser(reguser);
        if (i != 0) {
            session.setAttribute("regUser", reguser);
            return "forward:userPersonal";
        }
        return null;
    }

    @RequestMapping("modifyUserPwd")
    public String modifyUserPwd(Reguser reguser, HttpSession session, String oldpwd) {
        Reguser regUser = (Reguser) session.getAttribute("regUser");
        //原密码
        String p = regUser.getPwd();
        int i = desk_Reguserservice.updUserPwd(p, reguser, oldpwd);
        if (i != 0) {
            return "forward:/login";
        }
        return "forward:/userCPassword";
    }


}
