package com.jungle.util;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author Aimelony
 * @Date 2019/6/3 8:36
 * @File PageUtil
 * @Describe 用于aop环绕Redis手动分页
 **/
public class PageUtil {
    public List<Object> page(List<Object> list, Integer page, Integer limit) {
        System.out.println("-当前页-" + page + "-每页显示数-" + limit + "手动分页类-" + list.toString());
        List<Object> lists = new ArrayList<>();
        for (int i = page > 0 ? (page - 1) * limit : 0; i < (list.size() >= (page * limit) ? (page * limit) : list.size()); i++) {
            lists.add(list.get(i));
        }
        return lists;
    }
}
