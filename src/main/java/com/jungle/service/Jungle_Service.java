package com.jungle.service;

import com.jungle.bean.City;
import com.jungle.bean.Citygroup;
import com.jungle.bean.Clxjmain;
import com.jungle.bean.Clxjorder;
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
}
