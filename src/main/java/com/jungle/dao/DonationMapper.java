package com.jungle.dao;

import com.jungle.bean.Donation;
import com.jungle.bean.DonationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DonationMapper {
    int countByExample(DonationExample example);

    int deleteByExample(DonationExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Donation record);

    int insertSelective(Donation record);

    List<Donation> selectByExample(DonationExample example);

    Donation selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Donation record, @Param("example") DonationExample example);

    int updateByExample(@Param("record") Donation record, @Param("example") DonationExample example);

    int updateByPrimaryKeySelective(Donation record);

    int updateByPrimaryKey(Donation record);

    Donation selectDonationCount();
}