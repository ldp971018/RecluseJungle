package com.jungle.service;

import com.jungle.bean.Carorder;

import java.util.List;

public interface CarorderService {
    List<Carorder> findCarorderByUserid(Integer id);

    List<Carorder> findCarorderByUseridAndState0(Integer id);

    List<Carorder> findCarorderByUseridAndState1(Integer id);

    int editCarorderState(Integer id, String oid);
}
