package com.jungle.dao;

import com.jungle.bean.Helpinfo;
import com.jungle.bean.HelpinfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HelpinfoMapper {
    int countByExample(HelpinfoExample example);

    int deleteByExample(HelpinfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Helpinfo record);

    int insertSelective(Helpinfo record);

    Helpinfo selectByExpenditure();

    List<Helpinfo> selectByExample(HelpinfoExample example);

    Helpinfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Helpinfo record, @Param("example") HelpinfoExample example);

    int updateByExample(@Param("record") Helpinfo record, @Param("example") HelpinfoExample example);

    int updateByPrimaryKeySelective(Helpinfo record);

    int updateByPrimaryKey(Helpinfo record);
}