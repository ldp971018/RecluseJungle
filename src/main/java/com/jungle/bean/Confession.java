package com.jungle.bean;

import java.io.Serializable;
import java.util.Date;

public class Confession implements Serializable {
    private Integer id;

    private Boolean type;

    private String content;

    private String pwd;

    private Date ctime;

    private Boolean returnflag;

    private Integer returnuid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public Boolean getReturnflag() {
        return returnflag;
    }

    public void setReturnflag(Boolean returnflag) {
        this.returnflag = returnflag;
    }

    public Integer getReturnuid() {
        return returnuid;
    }

    public void setReturnuid(Integer returnuid) {
        this.returnuid = returnuid;
    }
}