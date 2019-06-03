package com.jungle.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jungle.bean.Donation;
import com.jungle.bean.DonationExample;
import com.jungle.bean.Helpinfo;
import com.jungle.dao.DonationMapper;
import com.jungle.dao.HelpinfoMapper;
import com.jungle.service.FoundationService;
import com.util.DeleteFile;
import com.util.GetTimestamp;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

    public static Integer donationCount = 0;

    @Autowired
    DonationMapper donationMapper;
    @Autowired
    private HelpinfoMapper helpinfoMapper;

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
    public PageInfo<Donation> selDonation(String donationtime, String donationname, Integer page, Integer limit) {
        DonationExample donationExample = new DonationExample();
        DonationExample.Criteria criteria = donationExample.createCriteria();
        if (donationname != null && !"".equals(donationname))
            criteria.andDonationnameLike("%" + donationname + "%");
        if (donationtime != null && !"".equals(donationtime)) {
//                criteria.andDonationtimeEqualTo(donation.getDonationtime());
//            String start = donationtime.getYear() + "-" + donationtime.getMonth() + "-" + donationtime.getDay() + " 00:00:00";
//            String end = donationtime.getYear() + "-" + donationtime.getMonth() + "-" + donationtime.getDay() + " 23:59:59";
//            criteria.andDonationtimeBetween(new Date(start), new Date(end));
            try {
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date parse1 = sf.parse(donationtime + " 00:00:00");
                Date parse2 = sf.parse(donationtime + " 23:59:59");
                criteria.andDonationtimeBetween(parse1, parse2);
            } catch (ParseException e) {
                e.printStackTrace();
                PageInfo<Donation> pageInfo = new PageInfo<>();
                return pageInfo;
            }
        }
        PageHelper.startPage(page, limit);
        List<Donation> donations = donationMapper.selectByExample(donationExample);
        //得到本次查询所有数据的总长度（不考虑分页）
        donationCount = donationMapper.countByExample(donationExample);
        System.out.println("查询结果" + donations.toString());
        PageInfo<Donation> pageInfo = new PageInfo<>(donations);
        return pageInfo;
    }

    /**
     * 查询捐款总金额 爱心捐赠明细（基金会-我要查询）
     *
     * @return
     */
    @Override
    public BigDecimal selDonationCount() {
        Donation donation = donationMapper.selectDonationCount();
        if (donation != null)
            return donation.getMoney();
        else
            return BigDecimal.valueOf(0.0);
    }
}
