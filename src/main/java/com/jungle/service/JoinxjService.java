package com.jungle.service;

import com.jungle.bean.Joinxj;

import java.util.List;

public interface JoinxjService {
    List<Joinxj> findJoinxjByUserid(Integer id);
}
