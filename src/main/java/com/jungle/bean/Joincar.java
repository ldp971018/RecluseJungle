package com.jungle.bean;

import java.io.Serializable;

public class Joincar implements Serializable {
    private Integer id;

    private String theowner;

    private String idcard;

    private String address;

    private String carname;

    private String travelnumber;

    private String travelrun;

    private String drivername;

    private String drivernumber;

    private String driverphone;

    private String insurancename;

    private String insurancenumber;

    private String insurancephone;

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

    public String getTheowner() {
        return theowner;
    }

    public void setTheowner(String theowner) {
        this.theowner = theowner == null ? null : theowner.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCarname() {
        return carname;
    }

    public void setCarname(String carname) {
        this.carname = carname == null ? null : carname.trim();
    }

    public String getTravelnumber() {
        return travelnumber;
    }

    public void setTravelnumber(String travelnumber) {
        this.travelnumber = travelnumber == null ? null : travelnumber.trim();
    }

    public String getTravelrun() {
        return travelrun;
    }

    public void setTravelrun(String travelrun) {
        this.travelrun = travelrun == null ? null : travelrun.trim();
    }

    public String getDrivername() {
        return drivername;
    }

    public void setDrivername(String drivername) {
        this.drivername = drivername == null ? null : drivername.trim();
    }

    public String getDrivernumber() {
        return drivernumber;
    }

    public void setDrivernumber(String drivernumber) {
        this.drivernumber = drivernumber == null ? null : drivernumber.trim();
    }

    public String getDriverphone() {
        return driverphone;
    }

    public void setDriverphone(String driverphone) {
        this.driverphone = driverphone == null ? null : driverphone.trim();
    }

    public String getInsurancename() {
        return insurancename;
    }

    public void setInsurancename(String insurancename) {
        this.insurancename = insurancename == null ? null : insurancename.trim();
    }

    public String getInsurancenumber() {
        return insurancenumber;
    }

    public void setInsurancenumber(String insurancenumber) {
        this.insurancenumber = insurancenumber == null ? null : insurancenumber.trim();
    }

    public String getInsurancephone() {
        return insurancephone;
    }

    public void setInsurancephone(String insurancephone) {
        this.insurancephone = insurancephone == null ? null : insurancephone.trim();
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