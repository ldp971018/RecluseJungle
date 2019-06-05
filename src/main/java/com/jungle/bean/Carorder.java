package com.jungle.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Carorder {
    private String oid;

    private Integer cid;

    private String startplace;

    private String endplace;

    private Long total;

    private String checkperson;

    private String checkphone;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date usetime;

    private Boolean useroption;

    private String message;

    private Integer uid;

    private Integer state;

    private Date reservetime;

    private  Carinfo carinfo;

    public Carinfo getCarinfo() {
        return carinfo;
    }

    public void setCarinfo(Carinfo carinfo) {
        this.carinfo = carinfo;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getStartplace() {
        return startplace;
    }

    public void setStartplace(String startplace) {
        this.startplace = startplace == null ? null : startplace.trim();
    }

    public String getEndplace() {
        return endplace;
    }

    public void setEndplace(String endplace) {
        this.endplace = endplace == null ? null : endplace.trim();
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public String getCheckperson() {
        return checkperson;
    }

    public void setCheckperson(String checkperson) {
        this.checkperson = checkperson == null ? null : checkperson.trim();
    }

    public String getCheckphone() {
        return checkphone;
    }

    public void setCheckphone(String checkphone) {
        this.checkphone = checkphone == null ? null : checkphone.trim();
    }

    public Date getUsetime() {
        return usetime;
    }

    public void setUsetime(Date usetime) {
        this.usetime = usetime;
    }

    public Boolean getUseroption() {
        return useroption;
    }

    public void setUseroption(Boolean useroption) {
        this.useroption = useroption;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getReservetime() {
        return reservetime;
    }

    public void setReservetime(Date reservetime) {
        this.reservetime = reservetime;
    }
}