package com.jungle.service;

import com.jungle.bean.Reguser;

/**
 * @Author Aimelony
 * @Date 2019/5/27 20:27
 * @File Desk_ReguserService
 * 前台业务实现功能 接口
 **/
public interface Desk_RegUserService {
    //前台登录验证
    public Reguser login(Reguser reguser);

    //验证是否存在手机号
    public Reguser checkMobile(String mobile);

    //添加用户（前台注册）
    int insReguser(Reguser reguser);

    //修改用户密码（忘记密码）
    int updatePwd(Reguser reguser);
}

