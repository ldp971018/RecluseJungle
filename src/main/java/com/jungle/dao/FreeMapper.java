package com.jungle.dao;

import com.jungle.bean.Free;
import com.jungle.bean.FreeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FreeMapper {
    int countByExample(FreeExample example);

    int deleteByExample(FreeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Free record);

    int insertSelective(Free record);

    List<Free> selectByExample(FreeExample example);

    Free selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Free record, @Param("example") FreeExample example);

    int updateByExample(@Param("record") Free record, @Param("example") FreeExample example);

    int updateByPrimaryKeySelective(Free record);

    int updateByPrimaryKey(Free record);

    Free selFreeOfPwd(Integer confessionid);
}