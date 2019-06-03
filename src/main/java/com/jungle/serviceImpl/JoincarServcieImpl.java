package com.jungle.serviceImpl;

import com.jungle.bean.Joincar;
import com.jungle.bean.JoincarExample;
import com.jungle.dao.JoincarMapper;
import com.jungle.service.JoincarService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class JoincarServcieImpl implements JoincarService {
    @Resource
    JoincarMapper joincarMapper;

    @Override
    public List<Joincar> findJoincarByUserid(Integer id) {
        JoincarExample example = new JoincarExample();
        JoincarExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id);
        List<Joincar> list = joincarMapper.selectByExample(example);
        return list;
    }
}
