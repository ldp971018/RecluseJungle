package com.jungle.service;

import com.jungle.bean.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

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
    List<Donation> selRedisDonation(String donationtime, String donationname, Integer page, Integer limit) throws ParseException;

    //查询捐款总金额（基金会-我要查询）
    BigDecimal selRedisDonationCount();

    //月底支出查询（基金会-我要查询）
    List<Payformonth> selRedisPList(String projectname, BigDecimal paymoney, String monthly, Integer page, Integer limit) throws ParseException;

    //款物发放公示（基金会-我要查询）
    List<Grant> selRedisPLpublicity(String donationname, String recipients, String donationTime, Integer page, Integer limit) throws ParseException;

    //查询基金会支出总额（基金会-我要捐增）
    Double selExpenditure();

    //公示列表（基金会-公示列表）
    List<Helpinfo> selRedisFoundJzfzlist(Integer applystatus, String name, Long applymoney1, Long applymoney2, Integer page, Integer limit);

    //更加id查看详情（基金会-公示列表）
    Helpinfo selFoundJzfzDetailed(Integer id);

    //查询评论（基金会-公示列表-查看详情）
    List<Helpcomment> selRedisHelpcomment(Integer id, Integer page, Integer limit,boolean redis);

    //添加评论（基金会-公示列表-查看详情）
    int insHelpcomment(Integer helpid, Integer uid, String content);

}
