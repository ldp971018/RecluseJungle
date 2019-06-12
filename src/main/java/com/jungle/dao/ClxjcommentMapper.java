package com.jungle.dao;

import com.jungle.bean.Clxjcomment;
import com.jungle.bean.ClxjcommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClxjcommentMapper {
    int countByExample(ClxjcommentExample example);

    int deleteByExample(ClxjcommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Clxjcomment record);

    int insertSelective(Clxjcomment record);

    List<Clxjcomment> selectByExample(ClxjcommentExample example);

    List<Clxjcomment> selectByExampleWithUser(ClxjcommentExample example);

    Clxjcomment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Clxjcomment record, @Param("example") ClxjcommentExample example);

    int updateByExample(@Param("record") Clxjcomment record, @Param("example") ClxjcommentExample example);

    int updateByPrimaryKeySelective(Clxjcomment record);

    int updateByPrimaryKey(Clxjcomment record);
}