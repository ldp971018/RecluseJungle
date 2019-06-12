package com.jungle.dao;

import com.jungle.bean.Payformonth;
import com.jungle.bean.PayformonthExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PayformonthMapper {
    int countByExample(PayformonthExample example);

    int deleteByExample(PayformonthExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Payformonth record);

    int insertSelective(Payformonth record);

    List<Payformonth> selectByExample(PayformonthExample example);

    Payformonth selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Payformonth record, @Param("example") PayformonthExample example);

    int updateByExample(@Param("record") Payformonth record, @Param("example") PayformonthExample example);

    int updateByPrimaryKeySelective(Payformonth record);

    int updateByPrimaryKey(Payformonth record);

    Payformonth selExpenditure();
}