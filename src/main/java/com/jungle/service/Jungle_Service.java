package com.jungle.service;

import com.jungle.bean.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface Jungle_Service {

    //查询地区并分类
    Map<String,Object> selectCityType();
    List<City> selectCityTypeAll();
    //根据条件搜索丛闲居信息
    List<Clxjmain> selectJungle(Clxjmain clxjmain);
    //根据id查询丛林闲居信息
    Clxjmain JungleDetailsById(Integer id);
    //添加订单
    boolean addOrder(Clxjorder clxjorder);
    //根据丛林id查询丛林闲居信息
    Clxjmain selectClxjmainById(Integer id);
    //根据闲居id查询车辆信息
    List<Carinfo> selectCarInfo(Integer cid);
    //根据车辆id查询用户评论
    List<Carcomment> carComment(Integer cid);
    //添加评论
    boolean addCarcoment(Carcomment carcomment);
    //根据车辆id查询车辆详细信息
    Carinfo CarOrderById(Integer id);
    //新增用车订单
    boolean insCarorder(Carorder carorder);

}
