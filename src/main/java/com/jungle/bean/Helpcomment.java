package com.jungle.bean;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;

@JsonIgnoreProperties({"handler", "hibernateLazyInitializer"})
public class Helpcomment implements Serializable {
    private Integer id;

    private Helpinfo helpinfo;

    private Integer uid;

    private String content;

    private String time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Helpinfo getHelpinfo() {
        return helpinfo;
    }

    public void setHelpinfo(Helpinfo helpinfo) {
        this.helpinfo = helpinfo;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    @Override
    public String toString() {
        return "Helpcomment{" +
                "id=" + id +
                ", helpinfo=" + helpinfo +
                ", uid=" + uid +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}