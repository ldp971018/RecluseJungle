package com.jungle.serviceImpl;

import com.jungle.bean.*;
import com.jungle.dao.*;
import com.jungle.service.Jungle_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
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
    private CarinfoMapper carinfoMapper;
    @Autowired
    private CarcommentMapper carcommentMapper;
    @Autowired
    private CarorderMapper carorderMapper;
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

    /**
     * 根据闲居id查询车辆信息
     * @return
     */
    @Override
    public List<Carinfo> selectCarInfo(Integer cid) {
        CarinfoExample carinfoExample = new CarinfoExample();
        CarinfoExample.Criteria criteria = carinfoExample.createCriteria();
        criteria.andCidEqualTo(cid);
        List<Carinfo> carinfo = carinfoMapper.selectByExample(carinfoExample);
        commentOk(carinfo);
        return carinfo;
    }
    /**
     * 根据车辆id查询用户评论
     * @param cid
     * @return
     */
    @Override
    public List<Carcomment> carComment(Integer cid) {
        List<Carcomment> list=carcommentMapper.selectByCidWhereUser(cid);
        return list;
    }

    /**
     * 添加评论
     * @param carcomment
     * @return
     */
    @Override
    public boolean addCarcoment(Carcomment carcomment) {
        int flag=carcommentMapper.insert(carcomment);
        if(flag==1){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 根据车辆id查询车辆详细信息
     * @param id
     * @return
     */
    @Override
    public Carinfo CarOrderById(Integer id) {
        Carinfo carinfo=carinfoMapper.selectByPrimaryKey(id);
        return carinfo;
    }

    /**
     * 新增用车订单
     * @param carorder
     * @return
     */
    @Override
    public boolean insCarorder(Carorder carorder) {
        int flag=carorderMapper.insert(carorder);
        if(flag==1){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 计算好评率的方法
     * @param carinfo
     */
    public void commentOk(List<Carinfo> carinfo){
        List<Carcomment> carcomment=carcommentMapper.selectByExample(null);
        DecimalFormat df = new DecimalFormat("#.00");//保留两位小数
        for(int i=0;i<carinfo.size();i++){
            int count=0,count1=0;//统计评论总数量
            for(int j=0;j<carcomment.size();j++){
                if(carinfo.get(i).getId()==carcomment.get(j).getCid()){
                    if(carcomment.get(j).getCflag()!=1){
                        count++;//统计评论总数量（不包括中评）
                    }
                    if(carcomment.get(j).getCflag()==0){
                        count1++;//统计好评数量
                    }
                }
            }
            if(count==0){
                carinfo.get(i).setCommentOk("100");
            }else {
                Double d = (1.0 * count1 / count) * 100;//计算好评率
                System.out.println("得到count1:" + count1 + "\t得到count:" + count + "\t得到f:" + d);
                carinfo.get(i).setCommentOk(df.format(d));
            }
        }
    }
}
