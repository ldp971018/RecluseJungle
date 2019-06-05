package com.jungle.dao;

import com.jungle.bean.Carcomment;
import com.jungle.bean.CarcommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CarcommentMapper {
    int countByExample(CarcommentExample example);

    int deleteByExample(CarcommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Carcomment record);

    int insertSelective(Carcomment record);

    List<Carcomment> selectByExample(CarcommentExample example);

    List<Carcomment> selectByCidWhereUser(@Param("cid") Integer cid);

    Carcomment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Carcomment record, @Param("example") CarcommentExample example);

    int updateByExample(@Param("record") Carcomment record, @Param("example") CarcommentExample example);

    int updateByPrimaryKeySelective(Carcomment record);

    int updateByPrimaryKey(Carcomment record);
}