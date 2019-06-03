package com.jungle.serviceImpl;

import com.jungle.bean.Clxjorder;
import com.jungle.bean.ClxjorderExample;
import com.jungle.dao.CarinfoMapper;
import com.jungle.dao.ClxjorderMapper;
import com.jungle.service.ClxjorderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class ClxjorderServiceImpl implements ClxjorderService {
    @Resource
    ClxjorderMapper clxjorderMapper;
    @Resource
    CarinfoMapper carinfoMapper;

    @Override
    public List<Clxjorder> findClxjorderByUserid(Integer id) {
        ClxjorderExample example = new ClxjorderExample();
        ClxjorderExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id);
        List<Clxjorder> list = clxjorderMapper.selectByExample(example);
        for(Clxjorder clxjorder : list){
            clxjorder.setCarinfo(carinfoMapper.selectByPrimaryKey(clxjorder.getCid()));
        }
        return list;
    }

    @Override
    public List<Clxjorder> findClxjorderByUseridAndState0(Integer id) {
        ClxjorderExample example = new ClxjorderExample();
        ClxjorderExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id).andStateEqualTo(0);
        List<Clxjorder> list = clxjorderMapper.selectByExample(example);
        for(Clxjorder clxjorder : list){
            clxjorder.setCarinfo(carinfoMapper.selectByPrimaryKey(clxjorder.getCid()));
        }
        return list;
    }

    @Override
    public List<Clxjorder> findClxjorderByUseridAndState1(Integer id) {
        ClxjorderExample example = new ClxjorderExample();
        ClxjorderExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id).andStateEqualTo(1);
        List<Clxjorder> list = clxjorderMapper.selectByExample(example);
        for(Clxjorder clxjorder : list){
            clxjorder.setCarinfo(carinfoMapper.selectByPrimaryKey(clxjorder.getCid()));
        }
        return list;
    }

    @Override
    public int editClxjorderState(Integer id, String oid) {
        ClxjorderExample example = new ClxjorderExample();
        ClxjorderExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id).andOidEqualTo(oid);
        List<Clxjorder> list = clxjorderMapper.selectByExample(example);
        if(list != null && list.size()>0){
            Clxjorder clxjorder = list.get(0);
            if(clxjorder.getState()==0){
                clxjorder.setState(1);
            }else if(clxjorder.getState()==1){
                clxjorder.setState(0);
            }
            return clxjorderMapper.updateByPrimaryKey(clxjorder);
        }
        return 0;
    }
}
