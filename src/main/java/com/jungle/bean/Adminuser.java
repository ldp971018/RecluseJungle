package com.jungle.bean;

import java.io.Serializable;
import java.util.Date;

public class Adminuser implements Serializable {
    private Integer id;

    private String username;

    private String pwd;

    private String name;

    private String mobile;

    private String usertype;

    private Boolean userflag;

    private Date regtime;

    private Integer joinid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype == null ? null : usertype.trim();
    }

    public Boolean getUserflag() {
        return userflag;
    }

    public void setUserflag(Boolean userflag) {
        this.userflag = userflag;
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public Integer getJoinid() {
        return joinid;
    }

    public void setJoinid(Integer joinid) {
        this.joinid = joinid;
    }
}