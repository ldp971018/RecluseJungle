package com.jungle.aop;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jungle.util.PageUtil;
import com.jungle.util.RedisUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.List;


/**
 * @Author Aimelony
 * @Date 2019/6/2 10:05
 * @File Aop_CUD_Redis
 * @Describe 查询Redis增加缓存
 * 注意：分页参数必须为 page 当前页 limit每页显示条数
 * ----方法名必须为 selRedis*  返回值为list集合：List<Object>
 * ----redis true：不缓存 false：缓存
 * 待完善
 **/
@Aspect
@Order(1)
@Component
public class AopBySelRedis {
    @Autowired
    public RedisUtil redisUtil;

    public AopBySelRedis() {
        System.out.println("-----------------------初始化查询Redis增加缓存AOP--------------------------");
    }

    @Around("execution(* com.jungle.serviceImpl.*.selRedis*(..))")
    public Object around(ProceedingJoinPoint thisJoinPoint) {
        System.out.println("--------------------------------查询Redis增加缓存环绕通知！---------------------------");
        Object[] args = thisJoinPoint.getArgs();
        Signature signature = thisJoinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        //通过这获取到方法的所有参数名称的字符串数组
        String[] parameterNames = methodSignature.getParameterNames();
        Integer page = null, limit = null;
        //定义是否存在条件查询
        boolean flag = false;
        Object s = ((MethodSignature) signature).getReturnType().toString().split(" ")[1];
        //定义返回结果集合
        if (s.equals("java.util.List")) {
            //取得方法的参数名称及参数值
            for (int i = 0; i < parameterNames.length; i++) {
//            System.out.println("参数名-" + parameterNames[i] + " 参数值-" + args[i]);
                if ("page".equals(parameterNames[i])) {
                    page = (int) args[i];
                }
                if ("limit".equals(parameterNames[i])) {
                    limit = (int) args[i];
                }
                //判断除page和limit外带有参数且有值归类为有条件查询
                if (args[i] != null && !"".equals(args[i]) && !"limit".equals(parameterNames[i]) && !"page".equals(parameterNames[i])) {
                    System.out.println("if-" + signature.getName() + "-" + args[i] + "-" + parameterNames[i] + "-" + flag);
                    if ("redis".equals(parameterNames[i])) {
                        if ((Boolean) args[i]) {
                            flag = true;
                            break;
                        } else {
                            flag = false;
                            break;
                        }
                    } else {
                        flag = true;
                    }
                }

            }
        }
        //判断是否存在条件查询-条件查询则不计入Redis缓存
        if (flag) {
            try {
                //设置分页参数
                if (page != null && limit != null)
                    PageHelper.startPage(page, limit);
                //判断业务方法返回值是否为null
                //进行分页
                PageInfo<Object> pageInfo = new PageInfo<>((List<Object>) thisJoinPoint.proceed());
                return pageInfo.getList();

            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
        }


        //判断当前方法名的key是否存在
        if (redisUtil.hasKey(thisJoinPoint.getSignature().getName())) {
            s = ((MethodSignature) signature).getReturnType().toString().split(" ")[1];
            //定义返回结果集合
            if (s.equals("java.util.List")) {
                List<Object> content = (List<Object>) redisUtil.get(thisJoinPoint.getSignature().getName());
                //判断是否存在分页参数
                if (page != null && limit != null) {
                    PageUtil pageUtil = new PageUtil();
                    //进行分页操作
                    content = pageUtil.page(content, page, limit);
                }
                return content;
            } else {
                //从Redis数据库中获取key数据
                Object content = redisUtil.get(thisJoinPoint.getSignature().getName());
                System.out.println(signature.getName() + "-" + content);
                return content;
            }
        } else {
            //当前方法名的key不存在
            try {
                //放行业务方法
                Object proceed = thisJoinPoint.proceed();
                if (((MethodSignature) signature).getReturnType().toString().split(" ")[1].equals("java.lang.String"))
                    return proceed;
                //判断业务方法返回值是否为空
                String methodName = thisJoinPoint.getSignature().getName();
                if (!s.equals("java.util.List")) {
                    for (int i = 0; i < parameterNames.length; i++) {
                        if (!"page".equals(parameterNames[i]) && !"limit".equals(parameterNames[i]) && !"redis".equals(parameterNames[i])){
                            methodName += args[i];
                        }
                    }
                }
                if (proceed != null && proceed.toString() != null && !"".equals(proceed.toString())) {
                    //设置Redis缓存key为方法名
                    System.out.println("设置Redis-" + signature.getName());
                    redisUtil.set(methodName, proceed);
                }
                //判断是否带有分页参数
                if (page != null && limit != null) {
                    PageUtil pageUtil = new PageUtil();
                    //分页操作
                    List<Object> page1 = pageUtil.page((List<Object>) proceed, page, limit);
                    return page1;
                } else {
                    //返回业务方法返回值
                    return proceed;
                }
            } catch (Throwable e) {
                e.printStackTrace();
                return null;
            }
        }
    }


}
