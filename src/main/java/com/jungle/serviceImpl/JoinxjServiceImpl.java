package com.jungle.serviceImpl;

import com.jungle.bean.Joinxj;
import com.jungle.bean.JoinxjExample;
import com.jungle.dao.JoinxjMapper;
import com.jungle.service.JoinxjService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class JoinxjServiceImpl implements JoinxjService {
    @Resource
    JoinxjMapper joinxjMapper;

    @Override
    public List<Joinxj> findJoinxjByUserid(Integer id) {
        JoinxjExample example = new JoinxjExample();
        JoinxjExample.Criteria criteria = example.createCriteria();
        criteria.andUidEqualTo(id);
        List<Joinxj> list = joinxjMapper.selectByExample(example);
        return list;
    }
}
