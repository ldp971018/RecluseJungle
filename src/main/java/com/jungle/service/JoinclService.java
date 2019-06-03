package com.jungle.service;

import com.jungle.bean.Joincl;

import java.util.List;

public interface JoinclService {
    List<Joincl> findJoinclByUserid(Integer id);
}
