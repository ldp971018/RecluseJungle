package com.jungle.serviceImpl;

import com.jungle.bean.Confession;
import com.jungle.dao.ConfessionMapper;
import com.jungle.service.ConfessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Return
 * @create 2019-06-04 9:26
 */
@Service
@Transactional
public class ConfessionServiceImpl implements ConfessionService {

    @Autowired
    private ConfessionMapper confessionMapper;

    /**
     * 添加文字忏悔
     * @param confession
     * @return
     */
    @Override
    public int addConfession(Confession confession) {
        return confessionMapper.insertSelective(confession);
    }

    /**
     * 检测忏悔信息的状态
     * @param pwd
     * @return
     */
    @Override
    public Confession checkPwd(String pwd) {
        return confessionMapper.checkPwd(pwd);
    }

    /**
     * 根据的查询的忏悔信息
     * @param confessionid
     * @return
     */
    @Override
    public Confession getConfessionById(Integer confessionid) {
        return confessionMapper.selectByPrimaryKey(confessionid);
    }
}
