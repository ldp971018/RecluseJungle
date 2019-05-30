package com.jungle.service;

import com.jungle.bean.Helpinfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author Aimelony
 * @Date 2019/5/29 15:20
 * @File FoundationService
 * @Describe 基金会业务实现接口
 **/

public interface FoundationService {
    int insHelpInfo(Helpinfo helpinfo, String type, MultipartFile[] fileName, HttpServletRequest req);
}
