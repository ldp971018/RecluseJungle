package com.jungle.serviceImpl;

import com.jungle.bean.Helpinfo;
import com.jungle.bean.HelpinfoExample;
import com.jungle.dao.HelpinfoMapper;
import com.jungle.service.HelpinfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class HelpinfoServiceImpl implements HelpinfoService {
    @Resource
    HelpinfoMapper helpinfoMapper;

    @Override
    public List<Helpinfo> findAllHelpinfo() {
        return helpinfoMapper.selectByExample(null);
    }

    @Override
    public List<Helpinfo> findAllHelpinfoStatus0() {
        HelpinfoExample example = new HelpinfoExample();
        HelpinfoExample.Criteria criteria = example.createCriteria();
        criteria.andApplystatusEqualTo(0);
        List<Helpinfo> list = helpinfoMapper.selectByExample(example);
        return list;
    }

    @Override
    public List<Helpinfo> findAllHelpinfoStatus1() {
        HelpinfoExample example = new HelpinfoExample();
        HelpinfoExample.Criteria criteria = example.createCriteria();
        criteria.andApplystatusEqualTo(1);
        List<Helpinfo> list = helpinfoMapper.selectByExample(example);
        return list;
    }

    @Override
    public List<Helpinfo> findAllHelpinfoStatus2() {
        HelpinfoExample example = new HelpinfoExample();
        HelpinfoExample.Criteria criteria = example.createCriteria();
        criteria.andApplystatusEqualTo(2);
        List<Helpinfo> list = helpinfoMapper.selectByExample(example);
        return list;
    }
}
