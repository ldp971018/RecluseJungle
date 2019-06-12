package com.jungle.service;

import com.jungle.bean.Confession;

/**
 * @author Return
 * @create 2019-06-04 9:25
 */

public interface ConfessionService {
    int addConfession(Confession confession);

    Confession checkPwd(String pwd);

    Confession getConfessionById(Integer confessionid);
}
