package com.jungle.serviceImpl;

import com.jungle.bean.Reguser;
import com.jungle.bean.ReguserExample;
import com.jungle.dao.ReguserMapper;
import com.jungle.service.Desk_RegUserService;
import com.util.MD5_Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author Aimelony
 * @Date 2019/5/27 20:30
 * @File Desk_Reguser_ServiceImpl
 **/
@Service
@Transactional
public class Desk_RegUserServiceImpl implements Desk_RegUserService {
    @Autowired
    private ReguserMapper reguserMapper;

    //测试加密算法
    public static void main(String[] args) {
        String pwd = MD5_Util.MD5_Encryption("17607945616", "123456");
        System.out.println(pwd);
    }

    /**
     * 登录验证
     *
     * @param reguser 用户对象
     * @return
     */
    @Override
    public Reguser login(Reguser reguser) {
        System.out.println(reguser);
        ReguserExample reguserExample = new ReguserExample();
        ReguserExample.Criteria criteria = reguserExample.createCriteria();
        criteria.andUsernameEqualTo(reguser.getUsername());
        criteria.andPwdEqualTo(MD5_Util.MD5_Encryption(reguser.getUsername(), reguser.getPwd()));
        List<Reguser> regusers = reguserMapper.selectByExample(reguserExample);
        System.out.println(regusers.toString());
        if (regusers != null && regusers.size() > 0)
            return regusers.get(0);
        else
            return null;
    }

    /**
     * 验证手机号（用户名）是否存在
     *
     * @param mobile 手机号（用户名）
     * @return true：存在  false：不存在
     */
    @Override
    public Reguser checkMobile(String mobile) {
        ReguserExample reguserExample = new ReguserExample();
        ReguserExample.Criteria criteria = reguserExample.createCriteria();
        criteria.andUsernameEqualTo(mobile);
        List<Reguser> regusers = reguserMapper.selectByExample(reguserExample);
        if (regusers != null && regusers.size() > 0)
            return regusers.get(0);
        else
            return null;
    }

    /**
     * 添加用户（注册）
     *
     * @param reguser 用户对象
     * @return
     */
    @Override
    public int insReguser(Reguser reguser) {
        reguser.setUsername(reguser.getMobile());
        reguser.setPwd(MD5_Util.MD5_Encryption(reguser.getUsername(), reguser.getPwd()));
        int i = reguserMapper.insertSelective(reguser);
        return i;
    }

    /**
     * 修改用户密码（忘记密码）
     *
     * @param reguser
     * @return
     */
    @Override
    public int updatePwd(Reguser reguser) {
        reguser.setPwd(MD5_Util.MD5_Encryption(reguser.getUsername(), reguser.getPwd()));
        ReguserExample reguserExample = new ReguserExample();
        ReguserExample.Criteria criteria = reguserExample.createCriteria();
        criteria.andUsernameEqualTo(reguser.getUsername());
        int i = reguserMapper.updateByExampleSelective(reguser, reguserExample);
        return i;
    }

}
