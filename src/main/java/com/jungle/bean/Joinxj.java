package com.jungle.bean;

import java.io.Serializable;

public class Joinxj implements Serializable {
    private Integer id;

    private String xjname;

    private String houseno;

    private String address;

    private String postcode;

    private String houseidcard;

    private String housephone;

    private String housemobile;

    private String houseperson;

    private String idcard;

    private String phone;

    private String message;

    private Integer uid;

    private String jointime;

    private Integer joinstatus;

    private String fileurl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getXjname() {
        return xjname;
    }

    public void setXjname(String xjname) {
        this.xjname = xjname == null ? null : xjname.trim();
    }

    public String getHouseno() {
        return houseno;
    }

    public void setHouseno(String houseno) {
        this.houseno = houseno == null ? null : houseno.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public String getHouseidcard() {
        return houseidcard;
    }

    public void setHouseidcard(String houseidcard) {
        this.houseidcard = houseidcard == null ? null : houseidcard.trim();
    }

    public String getHousephone() {
        return housephone;
    }

    public void setHousephone(String housephone) {
        this.housephone = housephone == null ? null : housephone.trim();
    }

    public String getHousemobile() {
        return housemobile;
    }

    public void setHousemobile(String housemobile) {
        this.housemobile = housemobile == null ? null : housemobile.trim();
    }

    public String getHouseperson() {
        return houseperson;
    }

    public void setHouseperson(String houseperson) {
        this.houseperson = houseperson == null ? null : houseperson.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
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

    public String getJointime() {
        return jointime;
    }

    public void setJointime(String jointime) {
        this.jointime = jointime == null ? null : jointime.trim();
    }

    public Integer getJoinstatus() {
        return joinstatus;
    }

    public void setJoinstatus(Integer joinstatus) {
        this.joinstatus = joinstatus;
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl == null ? null : fileurl.trim();
    }
}