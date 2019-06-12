package com.jungle.controller;

import com.jungle.bean.Confession;
import com.jungle.bean.Free;
import com.jungle.service.ConfessionService;
import com.jungle.service.FreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Return
 * @create 2019-06-04 11:36
 */
@Controller
@RequestMapping("/free")
public class FreeController  {

    @Autowired
    private FreeService freeService;
    @Autowired
    private ConfessionService confessionService;

    /**
     * 根据忏悔的id查询大师解读的信息
     * @param confession
     * @param model
     * @return
     */
    @RequestMapping("/selFreeOfPwd")
    public String selFreeOfPwd(Confession confession,Model model){
        Confession confession2 = confessionService.checkPwd(confession.getPwd());
        if (confession2!=null) {
            Free free = freeService.selFreeOfPwd(confession2.getId());
            //每次阅读需要将的阅读次数加1
            if (free.getReadnum()!=null){
                free.setReadnum(free.getReadnum() + 1);
                freeService.UpdateReadNum(free);
            }else{
                free.setReadnum(1);
                freeService.UpdateReadNum(free);
            }
            Confession confession1 = confessionService.getConfessionById(confession2.getId());
            model.addAttribute("free", free);
            model.addAttribute("confession", confession1);
        }
        return "qiantai/ConRead";
    }
}
