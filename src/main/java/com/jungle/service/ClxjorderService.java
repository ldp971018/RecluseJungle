package com.jungle.service;

import com.jungle.bean.Clxjorder;

import java.util.List;

public interface ClxjorderService {
    List<Clxjorder> findClxjorderByUserid(Integer id);

    List<Clxjorder> findClxjorderByUseridAndState0(Integer id);

    List<Clxjorder> findClxjorderByUseridAndState1(Integer id);

    int editClxjorderState(Integer id, String oid);
}
