package com.jungle.serviceImpl;

import com.jungle.bean.*;
import com.jungle.dao.*;
import com.jungle.service.FoundationService;
import com.jungle.util.DeleteFile;
import com.jungle.util.GetTimestamp;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author Aimelony
 * @Date 2019/5/29 15:25
 * @File FoundationServiceImpl
 * @Describe describe
 **/
@Service
public class FoundationServiceImpl implements FoundationService {
    public static Integer donationCount = null;
    public static Integer plistCount = null;
    public static Integer grantCount = null;
    public static Integer helpinfoCount = null;
    public static Integer helpcommentcount = null;
    @Autowired
    DonationMapper donationMapper;
    @Autowired
    private HelpinfoMapper helpinfoMapper;
    @Autowired
    private PayformonthMapper payformonthMapper;
    @Autowired
    private GrantMapper grantMapper;
    @Autowired
    private HelpcommentMapper helpcommentMapper;

    /**
     * 录入救助扶助信息
     *
     * @param helpinfo 救助对象（bean）
     * @param type     救助（salvation）1 - 扶助（saveUp）0
     * @param fileName 上传的文件
     * @return
     */
    @Override
    public int insHelpInfo(Helpinfo helpinfo, String type, MultipartFile[] fileName, HttpServletRequest req) {
        String path;
        File fileDir = null;
        int i = 0;
        try {
            path = req.getServletContext().getRealPath("foundationUploadFile");
            path = path + "\\" + GetTimestamp.getTimestamp();
            fileDir = new File(path);
            if (!fileDir.exists()) { //如果不存在 则创建
                fileDir.mkdirs();
            }
            for (int j = 0; j < fileName.length; j++) {
                File saveFile = new File(path, fileName[j].getOriginalFilename());
                FileUtils.copyInputStreamToFile(fileName[j].getInputStream(), saveFile); //复制
            }
            System.out.println("文件夹路径-" + path);
            if ("salvation".equals(type))
                helpinfo.setApplytype(true);//救助
            else
                helpinfo.setApplytype(false);//扶助
            String[] url = path.split("foundationUploadFile");
            helpinfo.setFileurl("\\foundationUploadFile" + url[1]);
            System.out.println("录入路径-" + "\\foundationUploadFile" + url[1]);
            helpinfo.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            i = helpinfoMapper.insertSelective(helpinfo);
            System.out.println("录入信息-" + i + " 路径-" + fileDir.exists());
            if (i == 0) {
                if (fileDir != null && fileDir.exists()) { //如果存在 则删除
                    DeleteFile.deleteFile(fileDir);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (fileDir != null && fileDir.exists()) { //如果存在 则删除
                DeleteFile.deleteFile(fileDir);
            }
            return i;
        }
        return i;
    }

    /**
     * 爱心捐赠明细（基金会-我要查询）
     *
     * @param donationtime 时间
     * @param donationname 姓名
     * @param page         当前页
     * @param limit        每页显示多少条数据
     * @return
     */
    @Override
    public List<Donation> selRedisDonation(String donationtime, String donationname, Integer page, Integer limit) throws ParseException {
        System.out.println("-------------爱心捐赠明细-----------");
        DonationExample donationExample = new DonationExample();
        DonationExample.Criteria criteria = donationExample.createCriteria();
        if (donationname != null && !"".equals(donationname))
            criteria.andDonationnameLike("%" + donationname + "%");
        if (donationtime != null && !"".equals(donationtime)) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date parse1 = sf.parse(donationtime + " 00:00:00");
            Date parse2 = sf.parse(donationtime + " 23:59:59");
            criteria.andDonationtimeBetween(parse1, parse2);
        }
        List<Donation> donations = donationMapper.selectByExample(donationExample);
        //得到本次查询所有数据的总长度（不考虑分页）
        if (donations != null)
            donationCount = donations.size();
        System.out.println("查询结果" + donations.toString());
        return donations;
    }

    /**
     * 查询捐款总金额 爱心捐赠明细（基金会-我要查询）
     *
     * @return
     */
    @Override
    public BigDecimal selRedisDonationCount() {
        Donation donation = donationMapper.selectDonationCount();
        if (donation != null) {
            return donation.getMoney();
        } else
            return BigDecimal.valueOf(0.0);
    }

    /**
     * 月底支出查询（基金会-我要查询）
     *
     * @param projectname 封装查询项目名条件
     * @param paymoney    封装查询金额条件
     * @param monthly     封装查询月度条件
     * @param page        当前页
     * @param limit       每页的数量
     * @return
     */
    @Override
    public List<Payformonth> selRedisPList(String projectname, BigDecimal paymoney, String monthly, Integer page, Integer limit) throws ParseException {
        PayformonthExample payformonthExample = new PayformonthExample();
        PayformonthExample.Criteria criteria = payformonthExample.createCriteria();
        if (projectname != null && !"".equals(projectname)) {
            criteria.andProjectnameLike("%" + projectname + "%");
        }
        if (paymoney != null && !"".equals(paymoney)) {
            criteria.andPaymoneyEqualTo(paymoney);
        }
        if (monthly != null && !"".equals(monthly)) {
            String[] split = monthly.split(" - ");

            if (split.length > 1) {
                String startTime = split[0];
                String endTime = split[1];
                criteria.andMonthlyBetween(startTime, endTime);
            }
        }
        List<Payformonth> payForMonths = payformonthMapper.selectByExample(payformonthExample);
        plistCount = payformonthMapper.selectByExample(payformonthExample).size();
        return payForMonths;
    }

    /**
     * 款物发放公示（基金会-我要查询）
     *
     * @param donationname 捐款人
     * @param recipients   受助人
     * @param donationTime 捐款时间
     * @param page         当前页
     * @param limit        每页的数量
     * @return
     */
    @Override
    public List<Grant> selRedisPLpublicity(String donationname, String recipients, String donationTime, Integer page, Integer limit) throws ParseException {
        GrantExample grantExample = new GrantExample();
        GrantExample.Criteria criteria = grantExample.createCriteria();
        if (donationname != null && !"".equals(donationname)) {
            criteria.andDonationnameLike("%" + donationname + "%");
        }
        if (recipients != null && !"".equals(recipients)) {
            criteria.andRecipientsLike("%" + recipients + "%");
        }
        if (donationTime != null && !"".equals(donationTime)) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date parse2 = sf.parse(donationTime + " 23:59:59");
            Date parse1 = sf.parse(donationTime + " 00:00:00");
            criteria.andDonationtimeBetween(parse1, parse2);
        }
        List<Grant> grants = grantMapper.selectByExample(grantExample);
        if (grants != null)
            grantCount = grants.size();
        return grants;
    }

    /**
     * 公示列表（基金会-公示列表）
     *
     * @param applystatus 公示类型
     * @param name        申请人姓名
     * @param applymoney1 申请金额1
     * @param applymoney2 申请金额2
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<Helpinfo> selRedisFoundJzfzlist(Integer applystatus, String name, Long applymoney1, Long applymoney2, Integer page, Integer limit) {
        HelpinfoExample helpinfoExample = new HelpinfoExample();
        HelpinfoExample.Criteria criteria = helpinfoExample.createCriteria();
        if (applystatus != null && !"".equals(applystatus)) {
            criteria.andApplystatusEqualTo(applystatus);
        }
        if (name != null && !"".equals(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        if (applymoney1 != null && !"".equals(applymoney1) && (applymoney2 != null && !"".equals(applymoney2))) {
            criteria.andApplymoneyBetween(applymoney1, applymoney2);
        }
        List<Helpinfo> helpinfos = helpinfoMapper.selectByExample(helpinfoExample);
        helpinfoCount = helpinfoMapper.selectByExample(helpinfoExample).size();
        System.out.println(helpinfos.toString());
        return helpinfos;
    }

    /**
     * 查看详情（基金会-公示列表-数据）
     *
     * @param id
     * @return
     */
    @Override
    public Helpinfo selFoundJzfzDetailed(Integer id) {
        Helpinfo helpinfo = helpinfoMapper.selectByPrimaryKey(id);
        return helpinfo;
    }

    /**
     * 查询评论（基金会-公示列表-查看详情）
     *
     * @param id    需要查询的id
     * @param redis 是否开启Redis缓存 true：开启 false：不开启
     * @return
     */
    @Override
    public List<Helpcomment> selRedisHelpcomment(Integer id, Integer page, Integer limit, boolean redis) {
        HelpcommentExample helpcommentExample = new HelpcommentExample();
        HelpcommentExample.Criteria criteria = helpcommentExample.createCriteria();
        criteria.andHelpidEqualTo(id);
        helpcommentExample.setOrderByClause("time desc");
        List<Helpcomment> helpcomments = helpcommentMapper.selectByExample(helpcommentExample);
        helpcommentcount = helpcommentMapper.selectByExample(helpcommentExample).size();
        return helpcomments;
    }

    /**
     * 添加评论（基金会-公示列表-查看详情）
     *
     * @param helpid
     * @param uid
     * @param content
     * @return
     */
    @Override
    public int insHelpcomment(Integer helpid, Integer uid, String content) {
        Helpcomment helpcomment = new Helpcomment();
        helpcomment.setContent(content);
        helpcomment.setUid(uid);
        Helpinfo helpinfo = new Helpinfo();
        helpinfo.setId(helpid);
        helpcomment.setHelpinfo(helpinfo);
        helpcomment.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        return helpcommentMapper.insertSelective(helpcomment);
    }


}
