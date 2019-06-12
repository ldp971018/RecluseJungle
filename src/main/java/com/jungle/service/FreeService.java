package com.jungle.service;

import com.jungle.bean.Free;

/**
 * @author Return
 * @create 2019-06-04 11:33
 */
public interface FreeService {

    Free selFreeOfPwd(Integer confessionid);

    void UpdateReadNum(Free free);
}
