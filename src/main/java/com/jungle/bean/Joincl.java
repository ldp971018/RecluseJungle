package com.jungle.bean;

import java.io.Serializable;

public class Joincl implements Serializable {
    private Integer id;

    private String clname;

    private String permitno;

    private String address;

    private String legalname;

    private String legalphone;

    private String legalidcard;

    private String contactsname;

    private String contactsmobile;

    private String contactsphone;

    private String postcode;

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

    public String getClname() {
        return clname;
    }

    public void setClname(String clname) {
        this.clname = clname == null ? null : clname.trim();
    }

    public String getPermitno() {
        return permitno;
    }

    public void setPermitno(String permitno) {
        this.permitno = permitno == null ? null : permitno.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getLegalname() {
        return legalname;
    }

    public void setLegalname(String legalname) {
        this.legalname = legalname == null ? null : legalname.trim();
    }

    public String getLegalphone() {
        return legalphone;
    }

    public void setLegalphone(String legalphone) {
        this.legalphone = legalphone == null ? null : legalphone.trim();
    }

    public String getLegalidcard() {
        return legalidcard;
    }

    public void setLegalidcard(String legalidcard) {
        this.legalidcard = legalidcard == null ? null : legalidcard.trim();
    }

    public String getContactsname() {
        return contactsname;
    }

    public void setContactsname(String contactsname) {
        this.contactsname = contactsname == null ? null : contactsname.trim();
    }

    public String getContactsmobile() {
        return contactsmobile;
    }

    public void setContactsmobile(String contactsmobile) {
        this.contactsmobile = contactsmobile == null ? null : contactsmobile.trim();
    }

    public String getContactsphone() {
        return contactsphone;
    }

    public void setContactsphone(String contactsphone) {
        this.contactsphone = contactsphone == null ? null : contactsphone.trim();
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
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

    @Override
    public String toString() {
        return "Joincl{" +
                "id=" + id +
                ", clname='" + clname + '\'' +
                ", permitno='" + permitno + '\'' +
                ", address='" + address + '\'' +
                ", legalname='" + legalname + '\'' +
                ", legalphone='" + legalphone + '\'' +
                ", legalidcard='" + legalidcard + '\'' +
                ", contactsname='" + contactsname + '\'' +
                ", contactsmobile='" + contactsmobile + '\'' +
                ", contactsphone='" + contactsphone + '\'' +
                ", postcode='" + postcode + '\'' +
                ", message='" + message + '\'' +
                ", uid=" + uid +
                ", jointime='" + jointime + '\'' +
                ", joinstatus=" + joinstatus +
                ", fileurl='" + fileurl + '\'' +
                '}';
    }
}