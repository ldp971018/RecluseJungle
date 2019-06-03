package com.jungle.service;

import com.jungle.bean.Helpinfo;

import java.util.List;

public interface HelpinfoService {
    List<Helpinfo> findAllHelpinfo();

    List<Helpinfo> findAllHelpinfoStatus0();

    List<Helpinfo> findAllHelpinfoStatus1();

    List<Helpinfo> findAllHelpinfoStatus2();
}
