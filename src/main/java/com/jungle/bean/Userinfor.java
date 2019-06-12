package com.jungle.bean;

import java.io.Serializable;
import java.util.Date;

public class Userinfor implements Serializable {
    private Integer userId;

    private String userName;

    private Boolean userSex;

    private String userWork;

    private String userContact;

    private String userAddress;

    private Boolean userMarriage;

    private Integer userDepartment;

    private Date userEmploytime;

    private String userPassword;

    private String userEducation;

    private String userLoginname;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Boolean getUserSex() {
        return userSex;
    }

    public void setUserSex(Boolean userSex) {
        this.userSex = userSex;
    }

    public String getUserWork() {
        return userWork;
    }

    public void setUserWork(String userWork) {
        this.userWork = userWork == null ? null : userWork.trim();
    }

    public String getUserContact() {
        return userContact;
    }

    public void setUserContact(String userContact) {
        this.userContact = userContact == null ? null : userContact.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public Boolean getUserMarriage() {
        return userMarriage;
    }

    public void setUserMarriage(Boolean userMarriage) {
        this.userMarriage = userMarriage;
    }

    public Integer getUserDepartment() {
        return userDepartment;
    }

    public void setUserDepartment(Integer userDepartment) {
        this.userDepartment = userDepartment;
    }

    public Date getUserEmploytime() {
        return userEmploytime;
    }

    public void setUserEmploytime(Date userEmploytime) {
        this.userEmploytime = userEmploytime;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getUserEducation() {
        return userEducation;
    }

    public void setUserEducation(String userEducation) {
        this.userEducation = userEducation == null ? null : userEducation.trim();
    }

    public String getUserLoginname() {
        return userLoginname;
    }

    public void setUserLoginname(String userLoginname) {
        this.userLoginname = userLoginname == null ? null : userLoginname.trim();
    }
}