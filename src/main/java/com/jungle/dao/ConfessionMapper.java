package com.jungle.dao;

import com.jungle.bean.Confession;
import com.jungle.bean.ConfessionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ConfessionMapper {
    int countByExample(ConfessionExample example);

    int deleteByExample(ConfessionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Confession record);

    int insertSelective(Confession record);

    List<Confession> selectByExample(ConfessionExample example);

    Confession selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Confession record, @Param("example") ConfessionExample example);

    int updateByExample(@Param("record") Confession record, @Param("example") ConfessionExample example);

    int updateByPrimaryKeySelective(Confession record);

    int updateByPrimaryKey(Confession record);

    Confession checkPwd(String pwd);
}