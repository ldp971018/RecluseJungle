package com.jungle.serviceImpl;

import com.jungle.bean.Carorder;
import com.jungle.bean.CarorderExample;
import com.jungle.dao.CarinfoMapper;
import com.jungle.dao.CarorderMapper;
import com.jungle.service.CarorderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class CarorderServiceImpl implements CarorderService {
    @Resource
    CarorderMapper carorderMapper;
    @Resource
    CarinfoMapper carinfoMapper;

    @Override
    public List<Carorder> findCarorderByUserid(Integer id) {
        CarorderExample example = new CarorderExample();
        CarorderExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id);
        List<Carorder> list = carorderMapper.selectByExample(example);
        for(Carorder carorder : list){
            carorder.setCarinfo(carinfoMapper.selectByPrimaryKey(carorder.getCid()));
        }
        return list;
    }

    @Override
    public List<Carorder> findCarorderByUseridAndState0(Integer id) {
        CarorderExample example = new CarorderExample();
        CarorderExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id).andStateEqualTo(0);
        List<Carorder> list = carorderMapper.selectByExample(example);
        for(Carorder carorder : list){
            carorder.setCarinfo(carinfoMapper.selectByPrimaryKey(carorder.getCid()));
        }
        return list;
    }

    @Override
    public List<Carorder> findCarorderByUseridAndState1(Integer id) {
        CarorderExample example = new CarorderExample();
        CarorderExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id).andStateEqualTo(1);
        List<Carorder> list = carorderMapper.selectByExample(example);
        for(Carorder carorder : list){
            carorder.setCarinfo(carinfoMapper.selectByPrimaryKey(carorder.getCid()));
        }
        return list;
    }

    @Override
    public int editCarorderState(Integer id, String oid) {
        CarorderExample example = new CarorderExample();
        CarorderExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id).andOidEqualTo(oid);
        List<Carorder> list = carorderMapper.selectByExample(example);
        if(list != null && list.size()>0){
            Carorder carorder = list.get(0);
            if(carorder.getState()==0){
                carorder.setState(1);
            }else if(carorder.getState()==1){
                carorder.setState(0);
            }
            return carorderMapper.updateByPrimaryKey(carorder);
        }
        return 0;
    }
}
