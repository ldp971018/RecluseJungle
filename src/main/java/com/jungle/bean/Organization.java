package com.jungle.bean;

import java.io.Serializable;
import java.util.Date;

public class Organization implements Serializable {
    private Integer orgId;

    private String orgName;

    private String orgDescription;

    private String orgManager;

    private String orgPhone;

    private Integer orgParentid;

    private Date orgEstablishtime;

    private String orgPath;

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName == null ? null : orgName.trim();
    }

    public String getOrgDescription() {
        return orgDescription;
    }

    public void setOrgDescription(String orgDescription) {
        this.orgDescription = orgDescription == null ? null : orgDescription.trim();
    }

    public String getOrgManager() {
        return orgManager;
    }

    public void setOrgManager(String orgManager) {
        this.orgManager = orgManager == null ? null : orgManager.trim();
    }

    public String getOrgPhone() {
        return orgPhone;
    }

    public void setOrgPhone(String orgPhone) {
        this.orgPhone = orgPhone == null ? null : orgPhone.trim();
    }

    public Integer getOrgParentid() {
        return orgParentid;
    }

    public void setOrgParentid(Integer orgParentid) {
        this.orgParentid = orgParentid;
    }

    public Date getOrgEstablishtime() {
        return orgEstablishtime;
    }

    public void setOrgEstablishtime(Date orgEstablishtime) {
        this.orgEstablishtime = orgEstablishtime;
    }

    public String getOrgPath() {
        return orgPath;
    }

    public void setOrgPath(String orgPath) {
        this.orgPath = orgPath == null ? null : orgPath.trim();
    }
}