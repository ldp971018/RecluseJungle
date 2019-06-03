package com.jungle.service;

import com.jungle.bean.Joincar;

import java.util.List;

public interface JoincarService {
    List<Joincar> findJoincarByUserid(Integer id);
}
