package com.jungle.bean;

import java.io.Serializable;
import java.util.Date;

public class Free implements Serializable {
    private Integer id;

    private Integer confessionid;

    private Boolean type;

    private String content;

    private Date ftime;

    private Integer readnum;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getConfessionid() {
        return confessionid;
    }

    public void setConfessionid(Integer confessionid) {
        this.confessionid = confessionid;
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

    public Date getFtime() {
        return ftime;
    }

    public void setFtime(Date ftime) {
        this.ftime = ftime;
    }

    public Integer getReadnum() {
        return readnum;
    }

    public void setReadnum(Integer readnum) {
        this.readnum = readnum;
    }
}