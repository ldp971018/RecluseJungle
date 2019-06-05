package com.jungle.bean;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
@JsonIgnoreProperties({ "handler","hibernateLazyInitializer" })
public class Helpinfo implements Serializable {
    private Integer id;

    private String name;

    private Boolean sex;

    private Integer age;

    private String idcard;

    private String phonenum;

    private String email;

    private String address;

    private Long income;

    private Boolean basicliving;

    private Long applymoney;

    private String fileurl;

    private String applycontent;

    private Integer applystatus;

    private Boolean applytype;

    private String time;

    private Reguser reguser;

    private String applymoneyusertime;

    private String vouchname;

    private String vouchidcard;

    private String vouchaddress;

    private String vouchcompany;

    private String vouchphonenum;

    private String vouchmobile;

    private String vouchdddress;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum == null ? null : phonenum.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Long getIncome() {
        return income;
    }

    public void setIncome(Long income) {
        this.income = income;
    }

    public Boolean getBasicliving() {
        return basicliving;
    }

    public void setBasicliving(Boolean basicliving) {
        this.basicliving = basicliving;
    }

    public Long getApplymoney() {
        return applymoney;
    }

    public void setApplymoney(Long applymoney) {
        this.applymoney = applymoney;
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl == null ? null : fileurl.trim();
    }

    public String getApplycontent() {
        return applycontent;
    }

    public void setApplycontent(String applycontent) {
        this.applycontent = applycontent == null ? null : applycontent.trim();
    }

    public Integer getApplystatus() {
        return applystatus;
    }

    public void setApplystatus(Integer applystatus) {
        this.applystatus = applystatus;
    }

    public Boolean getApplytype() {
        return applytype;
    }

    public void setApplytype(Boolean applytype) {
        this.applytype = applytype;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public Reguser getReguser() {
        return reguser;
    }

    public void setReguser(Reguser reguser) {
        this.reguser = reguser;
    }

    public String getApplymoneyusertime() {
        return applymoneyusertime;
    }

    public void setApplymoneyusertime(String applymoneyusertime) {
        this.applymoneyusertime = applymoneyusertime == null ? null : applymoneyusertime.trim();
    }

    public String getVouchname() {
        return vouchname;
    }

    public void setVouchname(String vouchname) {
        this.vouchname = vouchname == null ? null : vouchname.trim();
    }

    public String getVouchidcard() {
        return vouchidcard;
    }

    public void setVouchidcard(String vouchidcard) {
        this.vouchidcard = vouchidcard == null ? null : vouchidcard.trim();
    }

    public String getVouchaddress() {
        return vouchaddress;
    }

    public void setVouchaddress(String vouchaddress) {
        this.vouchaddress = vouchaddress == null ? null : vouchaddress.trim();
    }

    public String getVouchcompany() {
        return vouchcompany;
    }

    public void setVouchcompany(String vouchcompany) {
        this.vouchcompany = vouchcompany == null ? null : vouchcompany.trim();
    }

    public String getVouchphonenum() {
        return vouchphonenum;
    }

    public void setVouchphonenum(String vouchphonenum) {
        this.vouchphonenum = vouchphonenum == null ? null : vouchphonenum.trim();
    }

    public String getVouchmobile() {
        return vouchmobile;
    }

    public void setVouchmobile(String vouchmobile) {
        this.vouchmobile = vouchmobile == null ? null : vouchmobile.trim();
    }

    public String getVouchdddress() {
        return vouchdddress;
    }

    public void setVouchdddress(String vouchdddress) {
        this.vouchdddress = vouchdddress == null ? null : vouchdddress.trim();
    }

    @Override
    public String toString() {
        return "Helpinfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", idcard='" + idcard + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", income=" + income +
                ", basicliving=" + basicliving +
                ", applymoney=" + applymoney +
                ", fileurl='" + fileurl + '\'' +
                ", applycontent='" + applycontent + '\'' +
                ", applystatus=" + applystatus +
                ", applytype=" + applytype +
                ", time='" + time + '\'' +
                ", reguser=" + reguser +
                ", applymoneyusertime='" + applymoneyusertime + '\'' +
                ", vouchname='" + vouchname + '\'' +
                ", vouchidcard='" + vouchidcard + '\'' +
                ", vouchaddress='" + vouchaddress + '\'' +
                ", vouchcompany='" + vouchcompany + '\'' +
                ", vouchphonenum='" + vouchphonenum + '\'' +
                ", vouchmobile='" + vouchmobile + '\'' +
                ", vouchdddress='" + vouchdddress + '\'' +
                '}';
    }
}