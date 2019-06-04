package com.jungle.bean;

import java.io.Serializable;
import java.util.Date;

public class Uploadfiles implements Serializable {
    private Integer fileid;

    private String filename;

    private String filedescription;

    private Date filecreatedate;

    private String filekind;

    private String filemodule;

    private String targetfilename;

    private String filetype;

    private Integer filesize;

    public Integer getFileid() {
        return fileid;
    }

    public void setFileid(Integer fileid) {
        this.fileid = fileid;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public String getFiledescription() {
        return filedescription;
    }

    public void setFiledescription(String filedescription) {
        this.filedescription = filedescription == null ? null : filedescription.trim();
    }

    public Date getFilecreatedate() {
        return filecreatedate;
    }

    public void setFilecreatedate(Date filecreatedate) {
        this.filecreatedate = filecreatedate;
    }

    public String getFilekind() {
        return filekind;
    }

    public void setFilekind(String filekind) {
        this.filekind = filekind == null ? null : filekind.trim();
    }

    public String getFilemodule() {
        return filemodule;
    }

    public void setFilemodule(String filemodule) {
        this.filemodule = filemodule == null ? null : filemodule.trim();
    }

    public String getTargetfilename() {
        return targetfilename;
    }

    public void setTargetfilename(String targetfilename) {
        this.targetfilename = targetfilename == null ? null : targetfilename.trim();
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype == null ? null : filetype.trim();
    }

    public Integer getFilesize() {
        return filesize;
    }

    public void setFilesize(Integer filesize) {
        this.filesize = filesize;
    }
}