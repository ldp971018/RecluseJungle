package com.jungle.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jungle.bean.AjaxResult;
import com.jungle.bean.Confession;
import com.jungle.service.ConfessionService;
import com.util.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Return
 * @create 2019-06-04 9:27
 */
@Controller
@RequestMapping("/confession")
public class ConfessionController {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;
    @Autowired
    private ServletContext servletContext;

    @Autowired
    private ConfessionService confessionService;

    /**
     * 添加文字忏悔
     * @param confession
     * @return
     */
    @ResponseBody
    @RequestMapping("/addConfession")
    public AjaxResult addConfession(Confession confession){
        //1.生成随机的解读码
        String pwd = UUID.randomUUID().toString().substring(0,10);
        System.out.println("生成的随机的解读码===>"+pwd);
//        String ctime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        confession.setCtime(new Date());
        confession.setPwd(pwd);
        //传输的格式为文字那么类型为 b'1'
        confession.setType(true);
        //默认是没有回复的
        confession.setReturnflag(false);
        System.out.println(confession);
        int count =confessionService.addConfession(confession);
        if (count>0){
            return AjaxResult.success().add("message",pwd);
        }else{
            return AjaxResult.success().add("message","忏悔失败");
        }
    }

    /**
     * 上传语音文件
     * @param multipartFile
     * @return
     */
    @RequestMapping(value = "/confessiondupload", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveEmp(HttpServletRequest request, @RequestParam("record_file")MultipartFile multipartFile) {
        System.out.println("文件上传");
        Confession confession=new Confession();
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
            confession.setContent("upload" + realpath + "/" + uuidFileName);
        }
        //1.生成随机的解读码
        String pwd = UUID.randomUUID().toString().substring(0,10);
        System.out.println("生成的随机的解读码===>"+pwd);
//        String ctime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        confession.setCtime(new Date());
        confession.setPwd(pwd);
        //传输的格式为文字那么类型为 b'0'
        confession.setType(false);
        //默认是没有回复的
        confession.setReturnflag(false);
        System.out.println(confession);
        int count =confessionService.addConfession(confession);
        if (count>0){
            return AjaxResult.success().add("pwd",pwd);
        }else{
            return AjaxResult.success().add("message","忏悔失败");
        }
    }



    /**
     * 根据用户输入的忏悔码，判断是否存在
     * @param pwd
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkPwd")
    public AjaxResult checkPwd(String pwd){
        //1.根据解读码，查看忏悔信息
     Confession confession =confessionService.checkPwd(pwd);
     String message=null;
     //判断是否存在忏悔信息
     if (confession!=null){
            //判读大师是否已解读
            if (confession.getReturnflag()){
                message="";
                System.out.println("解读信息===>"+confession);
                return AjaxResult.success().add("message",message).add("id",confession.getId()).add("status",confession.getReturnflag());
            }else{
                message="大师还未进行解读。";
                return AjaxResult.fail().add("message",message);
            }
     }else{
            message="解脱码输入错误或不存在该解读码";
            return AjaxResult.fail().add("message",message);
     }
    }
}
