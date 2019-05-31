package com.jungle.controller;

import com.jungle.bean.City;
import com.jungle.bean.Citygroup;
import com.jungle.bean.Clxjmain;
import com.jungle.service.Jungle_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class Jungle_Controller {
    @Autowired
    private Jungle_Service jungle_service;

    /**
     * 查询城区
     * @return
     */
    @ResponseBody
    @RequestMapping("selectCityType")
    public Map<String,Object> selectCityType(){
        Map<String,Object> map = jungle_service.selectCityType();
        return map;
    }

    @ResponseBody
    @RequestMapping("selectCityTypeAll")
    public Map<String,Object> selectCityTypeAll(){
        Map<String,Object> map=new HashMap<>();
        List<City> list= jungle_service.selectCityTypeAll();
        map.put("citys",list);
        return map;
    }
    /**
     * 根据条件搜索丛林信息
     * @param clxjmain 实体类对象
     * @param request
     * @return
     */
    @RequestMapping("selectCL")
    public String selectCL(Clxjmain clxjmain, HttpServletRequest request){
        if(clxjmain.getBelongCity().equals("请选择城市"))
            clxjmain.setBelongCity("");
        List<Clxjmain> list=jungle_service.selectJungle(clxjmain);
        request.setAttribute("JungleList",list);
        return "qiantai/clxjmain";
    }
    /**
     * 根据条件搜索闲居信息
     * @param clxjmain 实体类对象
     * @param request
     * @return
     */
    @RequestMapping("selectJungle")
    public String selectJungle(Clxjmain clxjmain, HttpServletRequest request){
        if(clxjmain.getBelongCity().equals("请选择城市"))
            clxjmain.setBelongCity("");
        List<Clxjmain> list=jungle_service.selectJungle(clxjmain);
        request.setAttribute("JungleList",list);
        return "qiantai/JungleList";
    }

    /**
     * 加载index界面
     * @return
     */
    @RequestMapping("/loadIndex")
    public String loadIndex(HttpServletRequest request){
        //查询全部
        List<Clxjmain> listAll=jungle_service.selectJungle(null);
        //国内丛林
        Clxjmain clxjmainGNCL=new Clxjmain();
        clxjmainGNCL.setType1(true);
        clxjmainGNCL.setType2(true);
        List<Clxjmain> listGNCL=jungle_service.selectJungle(clxjmainGNCL);
        //国内闲居
        Clxjmain clxjmainGNXJ=new Clxjmain();
        clxjmainGNXJ.setType1(true);
        clxjmainGNXJ.setType2(false);
        List<Clxjmain> listGNXJ=jungle_service.selectJungle(clxjmainGNXJ);
        //境外丛林
        Clxjmain clxjmainGWCL=new Clxjmain();
        clxjmainGWCL.setType1(false);
        clxjmainGWCL.setType2(true);
        List<Clxjmain> listGWCL=jungle_service.selectJungle(clxjmainGWCL);
        //境外闲居
        Clxjmain clxjmainGWXJ=new Clxjmain();
        clxjmainGWXJ.setType1(false);
        clxjmainGWXJ.setType2(false);
        List<Clxjmain> listGWXJ=jungle_service.selectJungle(clxjmainGWXJ);
        request.setAttribute("listGNCL",listGNCL);
        request.setAttribute("listGNXJ",listGNXJ);
        request.setAttribute("listGWCL",listGWCL);
        request.setAttribute("listGWXJ",listGWXJ);
        request.setAttribute("indexInfo",listAll);
        return "qiantai/index";
    }
}
