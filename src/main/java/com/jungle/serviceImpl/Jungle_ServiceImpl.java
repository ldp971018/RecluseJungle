package com.jungle.serviceImpl;

import com.jungle.bean.*;
import com.jungle.dao.CityMapper;
import com.jungle.dao.CitygroupMapper;
import com.jungle.dao.ClxjmainMapper;
import com.jungle.dao.ClxjorderMapper;
import com.jungle.service.Jungle_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class Jungle_ServiceImpl implements Jungle_Service {
    @Autowired
    private ClxjmainMapper clxjmainMapper;
    @Autowired
    private CitygroupMapper citygroupMapper;
    @Autowired
    private ClxjorderMapper clxjorderMapper;
    @Autowired
    private CityMapper cityMapper;
    //查询地区并分类
    @Override
    public Map<String, Object> selectCityType() {
        List<Citygroup> list = citygroupMapper.selectMany();
        System.out.println("======>>>>>"+list.size());
        for (Citygroup citygroup:list){
            System.out.println(citygroup.getCity().getChinese());
        }
        Map<String,Object> map=new HashMap<>();

        List<Citygroup> list1=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getGid()==1){
                list1.add(list.get(i));
            }
        }
        map.put("rm",list1);
        List<Citygroup> list2=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getGid()==2){
                list2.add(list.get(i));
            }
        }
        map.put("a_f",list2);
        List<Citygroup> list3=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getGid()==3){
                list3.add(list.get(i));
            }
        }
        map.put("g_j",list3);
        List<Citygroup> list4=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getGid()==4){
                list4.add(list.get(i));
            }
        }
        map.put("k_n",list4);
        List<Citygroup> list5=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getGid()==5){
                list5.add(list.get(i));
            }
        }
        map.put("o_w",list5);
        List<Citygroup> list6=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getGid()==6){
                list6.add(list.get(i));
            }
        }
        map.put("x_z",list6);
        List<Citygroup> list7=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            if(list.get(i).getGid()==7){
                list7.add(list.get(i));
            }
        }
        map.put("gjcs",list7);
        return map;
    }

    /**
     * 查询所有城市
     * @return
     */
    @Override
    public List<City> selectCityTypeAll() {
        List<City> list = cityMapper.selectByExample(null);
        return list;
    }

    /**
     * 根据条件搜索丛闲居信息
     * @param clxjmain
     * @return
     */
    @Override
    public List<Clxjmain> selectJungle(Clxjmain clxjmain){
        List<Clxjmain> list = clxjmainMapper.selectByWhere(clxjmain);
        return list;
    }

    /**
     * 根据id查询丛林闲居信息
     * @param id
     * @return
     */
    @Override
    public Clxjmain JungleDetailsById(Integer id) {
        Clxjmain clxjmain=clxjmainMapper.selectByPrimaryKey(id);
        return clxjmain;
    }

    /**
     * 添加订单
     * @param clxjorder
     * @return
     */
    @Override
    public boolean addOrder(Clxjorder clxjorder) {
        int flag=clxjorderMapper.insert(clxjorder);
        if(flag==1){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 根据丛林id查询丛林闲居信息
     * @param id
     * @return
     */
    @Override
    public Clxjmain selectClxjmainById(Integer id) {
        Clxjmain clxjmain=clxjmainMapper.selectByPrimaryKey(id);
        return clxjmain;
    }
}
