package com.jungle.serviceImpl;

import com.jungle.bean.Joincl;
import com.jungle.bean.JoinclExample;
import com.jungle.dao.JoinclMapper;
import com.jungle.service.JoinclService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class JoinclServiceImpl implements JoinclService {
    @Resource
    JoinclMapper joinclMapper;
    @Override
    public List<Joincl> findJoinclByUserid(Integer id) {
        JoinclExample example = new JoinclExample();
        JoinclExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id);
        List<Joincl> list = joinclMapper.selectByExample(example);
        return list;
    }
}
