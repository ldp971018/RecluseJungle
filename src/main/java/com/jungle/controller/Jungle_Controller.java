package com.jungle.controller;

import com.jungle.bean.*;
import com.jungle.service.Jungle_Service;
import com.util.GetTimestamp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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

    /**
     * 查询所有城市列表
     * @return
     */
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
        request.setAttribute("clxjmain",clxjmain);
        return "qiantai/clxjmain";
    }

    /**
     * 查询全部丛林
     * @param request
     * @return
     */
    @RequestMapping("selectCL_All")
    public String selectCL_All(HttpServletRequest request){
        Clxjmain clxjmain=new Clxjmain();
        clxjmain.setType2(true);
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
        request.setAttribute("clxjmain",clxjmain);
        request.setAttribute("JungleList",list);
        return "qiantai/JungleList";
    }
    /**
     * 查询全部闲居
     * @param request
     * @return
     */
    @RequestMapping("selectJungle_All")
    public String selectJungle_All(HttpServletRequest request){
        Clxjmain clxjmain=new Clxjmain();
        clxjmain.setType2(false);
        List<Clxjmain> list=jungle_service.selectJungle(clxjmain);
        request.setAttribute("JungleList",list);
        return "qiantai/clxjmain";
    }
    /**
     * 通过地址传参（城市名），进行查询闲居信息
     * @param request
     * @return
     */
    @RequestMapping("selectJungleByIndex")
    public String selectJungle(HttpServletRequest request){
        selectCLXJ(request);
        return "qiantai/JungleList";
    }
    /**
     * 通过地址传参（城市名），进行查询丛林信息
     * @param request
     * @return
     */
    @RequestMapping("selectCLByIndex")
    public String selectCL(HttpServletRequest request){
        selectCLXJ(request);
        return "qiantai/clxjmain";
    }

    /**
     * 丛林闲居回调查询方法
     * @param request
     */
    public void selectCLXJ(HttpServletRequest request){
        Clxjmain clxjmain=new Clxjmain();
        String city=request.getParameter("city");
        try {
            city=URLDecoder.decode(city,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println("city:"+city);
        if(request.getParameter("type1").equals("true")){
            clxjmain.setType1(true);
        }else{
            clxjmain.setType1(false);
        }
        if(request.getParameter("type2").equals("true")){
            clxjmain.setType2(true);
        }else{
            clxjmain.setType2(false);
        }
        clxjmain.setBelongCity(city);

        List<Clxjmain> list=jungle_service.selectJungle(clxjmain);
        request.setAttribute("JungleList",list);
        request.setAttribute("clxjmain",clxjmain);
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

    /**
     * 根据id查询详细信息
     * @param id
     * @return
     */
    @RequestMapping("JungleDetails")
    public String JungleDetailsById(HttpServletRequest request,Integer id){
        Clxjmain clxjmain=jungle_service.JungleDetailsById(id);
        request.setAttribute("clxjmainJson",clxjmain);
        Clxjmain clxjmain1=new Clxjmain();
        //根据地区查询周边信息
        clxjmain1.setBelongCity(clxjmain.getBelongCity());
        clxjmain1.setType2(clxjmain.getType2());
        List<Clxjmain> list=jungle_service.selectJungle(clxjmain1);
        request.setAttribute("clxjmainJsons",list);
        return "qiantai/JungleDetails";
    }

    /**
     * 预订页面
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("ResFiorder")
    public String ResFiorder(HttpServletRequest request,Integer id) {
        Clxjmain clxjmain = jungle_service.JungleDetailsById(id);
        request.setAttribute("clxjmainJson", clxjmain);
        return "qiantai/ResFiorder";
    }

    /**
     * 添加订单
     * @param clxjorder
     * @return
     */
    @RequestMapping("addOrder")
    public String addOrder(HttpServletRequest request,Clxjorder clxjorder,String type2){
        String suf="";//后缀
        if(type2.equals("true")){
            suf="cl";
        }else{
            suf="xj";
        }
        String oid=GetTimestamp.getTimestamp()+suf;
        clxjorder.setOid(oid);
        clxjorder.setReservetime(new Date());
        boolean flag=jungle_service.addOrder(clxjorder);
        if(flag){
            System.out.println("添加订单成功！");
            Clxjmain clxjmain=jungle_service.selectClxjmainById(clxjorder.getCid());
            request.setAttribute("clxjmain",clxjmain);
            request.setAttribute("clxjorder",clxjorder);
        }else {
            System.out.println("添加订单失败！");
        }
        return "qiantai/ResSuccess";
    }

    /**
     * 根据闲居id查询车辆信息
     * @param request
     * @param uid
     * @return
     */
    @RequestMapping("CarAllModels")
    public String CarOrder(HttpServletRequest request,Integer uid){
        List<Carinfo> list=jungle_service.selectCarInfo(uid);
        request.setAttribute("carinfoJsons",list);
        request.setAttribute("clxjmainid",uid);
        return "qiantai/CarAllModels";
    }

    /**
     * 根据车辆id查询用户评论
     * @param cid
     * @return
     */
    @ResponseBody
    @RequestMapping("carComment")
    public Map<String,Object> carComment(Integer cid){
        System.out.println("获取车辆id：");
        List<Carcomment> list=jungle_service.carComment(cid);
        Map<String,Object> map = new HashMap<>();
        map.put("count",list.size());
        map.put("carcommentJsons",list);
        return map;
    }

    /**
     * 添加评论
     * @param carcomment
     * @return
     */
    @ResponseBody
    @RequestMapping("addCarcoment")
    public Map<String,Object> addCarcoment(Carcomment carcomment){
        System.out.println("评论内容："+carcomment.getContent());
        Map<String,Object> map = new HashMap<>();
        carcomment.setCommenttime(new Date());
        boolean flag=jungle_service.addCarcoment(carcomment);
        if(flag){
            map.put("isOk","true");
        }else{
            map.put("isok","false");
        }
        return map;
    }

    /**
     * 根据车辆id查询车辆详细信息
     * @param id
     * @return
     */
    @RequestMapping("CarOrderById")
    public String CarOrderById(HttpServletRequest request,Integer id,String commentOk){
        Carinfo carinfo=jungle_service.CarOrderById(id);
        carinfo.setCommentOk(commentOk);
        request.setAttribute("carinfoJson",carinfo);
        return "qiantai/CarOrder";
    }

    /**
     * 添加用车订单
     * @param carorder
     * @return
     */
    @RequestMapping("insCarorder")
    public String insCarorder(HttpServletRequest request,Carorder carorder){
        String oid=GetTimestamp.getTimestamp()+"car";//根据时间戳生成订单id
        carorder.setOid(oid);
        carorder.setReservetime(new Date());
        carorder.setState(1);
        boolean flag=jungle_service.insCarorder(carorder);
        if(flag){
            System.out.println("用车订单添加成功");
            request.setAttribute("carorderOk",1);//新增用车订单成功！
            request.setAttribute("oid",oid);//订单号
            request.setAttribute("total",carorder.getTotal());//订单总价
        }else{
            System.out.println("用车订单添加失败");
            request.setAttribute("carorderOk",-1);//新增用车订单失败！
        }
        return "qiantai/CarOrder";
    }
}
