package com.jungle.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Grant implements Serializable {
    private Integer id;

    private String donationname;

    private String goods;

    private Long num;

    private BigDecimal worthless;

    private String useto;

    private String recipients;

    private Date donationtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDonationname() {
        return donationname;
    }

    public void setDonationname(String donationname) {
        this.donationname = donationname == null ? null : donationname.trim();
    }

    public String getGoods() {
        return goods;
    }

    public void setGoods(String goods) {
        this.goods = goods == null ? null : goods.trim();
    }

    public Long getNum() {
        return num;
    }

    public void setNum(Long num) {
        this.num = num;
    }

    public BigDecimal getWorthless() {
        return worthless;
    }

    public void setWorthless(BigDecimal worthless) {
        this.worthless = worthless;
    }

    public String getUseto() {
        return useto;
    }

    public void setUseto(String useto) {
        this.useto = useto == null ? null : useto.trim();
    }

    public String getRecipients() {
        return recipients;
    }

    public void setRecipients(String recipients) {
        this.recipients = recipients == null ? null : recipients.trim();
    }

    public Date getDonationtime() {
        return donationtime;
    }

    public void setDonationtime(Date donationtime) {
        this.donationtime = donationtime;
    }
}