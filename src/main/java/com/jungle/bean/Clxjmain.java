package com.jungle.bean;

import java.io.Serializable;
import java.util.Date;

public class Clxjmain implements Serializable {
    private Integer id;

    private String name;

    private Boolean type1;

    private Boolean type2;

    private String belongCity;

    private String firstImgBig;

    private String firstImgMin;

    private String carouselImg;

    private Long price;

    private String introduction;

    private String address;

    private String longitude;

    private String latitude;

    private Integer reserveNum;

    private Boolean recommend;

    private Integer joinid;

    private Integer checkstatus;

    private String abbot;

    private String opentime;

    private String createtime;

    private String mobile;

    private String commentOk;

    public String getCommentOk() {
        return commentOk;
    }

    public void setCommentOk(String commentOk) {
        this.commentOk = commentOk;
    }

    public Integer getId() {
        return id;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
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

    public Boolean getType1() {
        return type1;
    }

    public void setType1(Boolean type1) {
        this.type1 = type1;
    }

    public Boolean getType2() {
        return type2;
    }

    public void setType2(Boolean type2) {
        this.type2 = type2;
    }

    public String getBelongCity() {
        return belongCity;
    }

    public void setBelongCity(String belongCity) {
        this.belongCity = belongCity == null ? null : belongCity.trim();
    }

    public String getFirstImgBig() {
        return firstImgBig;
    }

    public void setFirstImgBig(String firstImgBig) {
        this.firstImgBig = firstImgBig == null ? null : firstImgBig.trim();
    }

    public String getFirstImgMin() {
        return firstImgMin;
    }

    public void setFirstImgMin(String firstImgMin) {
        this.firstImgMin = firstImgMin == null ? null : firstImgMin.trim();
    }

    public String getCarouselImg() {
        return carouselImg;
    }

    public void setCarouselImg(String carouselImg) {
        this.carouselImg = carouselImg == null ? null : carouselImg.trim();
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude == null ? null : longitude.trim();
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude == null ? null : latitude.trim();
    }

    public Integer getReserveNum() {
        return reserveNum;
    }

    public void setReserveNum(Integer reserveNum) {
        this.reserveNum = reserveNum;
    }

    public Boolean getRecommend() {
        return recommend;
    }

    public void setRecommend(Boolean recommend) {
        this.recommend = recommend;
    }

    public Integer getJoinid() {
        return joinid;
    }

    public void setJoinid(Integer joinid) {
        this.joinid = joinid;
    }

    public Integer getCheckstatus() {
        return checkstatus;
    }

    public void setCheckstatus(Integer checkstatus) {
        this.checkstatus = checkstatus;
    }

    public String getAbbot() {
        return abbot;
    }

    public void setAbbot(String abbot) {
        this.abbot = abbot == null ? null : abbot.trim();
    }

    public String getOpentime() {
        return opentime;
    }

    public void setOpentime(String opentime) {
        this.opentime = opentime;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }
}