package com.jungle.controller;

import com.jungle.bean.Joincl;
import com.jungle.bean.Reguser;
import com.jungle.service.JoinclService;
import com.util.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

/**
 * 丛林闲居-用户中心-加盟进度查询
 */
@Controller
public class JoinclController {


    @Resource
    JoinclService joinclServiceImpl;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;
    @Autowired
    private ServletContext servletContext;

    /**
     * 加盟进度查询-丛林
     * @param model
     * @return
     */
    @RequestMapping("showAllJoinclByUserid")
    public String showAllJoinclByUserid(HttpSession session, Model model) {
        Reguser user = (Reguser) session.getAttribute("regUser");
        List<?> list = joinclServiceImpl.findJoinclByUserid(user.getId());
        model.addAttribute("list", list);
        return "qiantai/UserJPquery";
    }

    @RequestMapping("/addJoincl")
    public String addJoincl(HttpServletRequest request,
                            @RequestParam("hetongUpload")MultipartFile multipartFile,
                            Joincl joincl){
        System.out.println(joincl);
        if (multipartFile != null) {
            String path = servletContext.getRealPath("/upload");
            // 一个目录存放多个相同文件是会覆盖，进行随机赋值名
            System.out.println(multipartFile.getOriginalFilename());
            String uuidFileName = UploadUtils.getUuidFileName(multipartFile.getOriginalFilename());
            // 创建文件目录:文件过多，加载太慢，使用目录分离
            String realpath = UploadUtils.getPath(uuidFileName);
            // 创建目录
            String url = path + realpath;
            File file = new File(url);
            // 判断是否存在
            if (!file.exists()) {
                file.mkdirs();
            }
            // 开始上传
            File destFile = new File(url + "/" + uuidFileName);
            try {
                multipartFile.transferTo(destFile);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("上传文件失败");
            }
            System.out.println("上传路径===>"+url + "/" + uuidFileName);
            //保存
            joincl.setMessage("upload" + realpath + "/" + uuidFileName);
        }
        return "redirect:/showAllJoinclByUserid";
    }

}
