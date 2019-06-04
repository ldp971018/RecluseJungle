package com.jungle.aop;

import com.jungle.util.RedisUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @Author Aimelony
 * @Date 2019/6/3 11:01
 * @File Aop_CUD_Redis
 * @Describe 增删改Redis清除缓存
 **/
@Aspect
@Order(2)
@Component
public class Aop_CUD_Redis {
    @Autowired
    public RedisUtil redisUtil;

    public Aop_CUD_Redis() {
        System.out.println("-----------------------初始化增删改Redis清除缓存AOP--------------------------");
    }


    @After("execution(* com.jungle.serviceImpl.*.ins*(..))||execution(* com.jungle.serviceImpl.*.upd*(..))||execution(* com.jungle.serviceImpl.*.del*(..))")
    public void after(JoinPoint joinPoint) {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        String name = methodSignature.getName();
        String method = "";
        if (name.split("del").length > 1) {
            method = name.split("del")[1];
        }
        if (name.split("upd").length > 1) {
            method = name.split("upd")[1];
        }
        if (name.split("ins").length > 1) {
            method = name.split("ins")[1];
        }

        method = "selRedis" + method;
        System.out.println(method + redisUtil.hasKey(method));
        if (redisUtil.hasKey(method)) {
            redisUtil.delete(method);
        }
    }

}
