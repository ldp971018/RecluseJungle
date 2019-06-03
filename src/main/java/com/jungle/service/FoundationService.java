package com.jungle.service;

import com.github.pagehelper.PageInfo;
import com.jungle.bean.Donation;
import com.jungle.bean.Helpinfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @Author Aimelony
 * @Date 2019/5/29 15:20
 * @File FoundationService
 * @Describe 基金会业务实现接口
 **/

public interface FoundationService {
    //救助扶助《申请信息录入》（基金会-我要求助）
    int insHelpInfo(Helpinfo helpinfo, String type, MultipartFile[] fileName, HttpServletRequest req);

    //爱心捐赠明细（基金会-我要查询）
    PageInfo<Donation> selDonation(String donationtime, String donationname, Integer page, Integer limit);

    //查询捐款总金额
    BigDecimal selDonationCount();
}
