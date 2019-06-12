package com.jungle.serviceImpl;

import com.jungle.bean.Free;
import com.jungle.dao.FreeMapper;
import com.jungle.service.FreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Return
 * @create 2019-06-04 11:34
 */

@Service
@Transactional
public class FreeServiceImpl implements FreeService{

    @Autowired
    private FreeMapper freeMapper;

    /**
     * 查询
     * @param confessionid
     * @return
     */
    @Override
    public Free selFreeOfPwd(Integer confessionid) {
        return freeMapper.selFreeOfPwd(confessionid);
    }

    /**
     * 增加访问量
     * @param free
     */
    @Override
    public void UpdateReadNum(Free free) {
        freeMapper.updateByPrimaryKeySelective(free);
    }
}
