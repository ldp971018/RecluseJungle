<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.jungle.util.DateUtils" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:directive.page import="java.util.Calendar"/>
<%
    String path = request.getContextPath();
%>
<%
    String timeBanner = "你好";
    Calendar cal = Calendar.getInstance();
    int hour = cal.get(Calendar.HOUR_OF_DAY);
    if (hour >= 5 && hour < 11) {
        timeBanner = "上午好，";
    } else if (hour >= 11 && hour < 13) {
        timeBanner = "中午好，";
    } else if (hour >= 13 && hour < 18) {
        timeBanner = "下午好，";
    } else if (hour >= 18 && hour < 23) {
        timeBanner = "晚上好，";
    } else {
        timeBanner = "夜深啦，";
    }
%>
<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("yyyy年MM月dd日");
    java.util.Date currentTime = new java.util.Date();//得到当前系统时间
    java.util.Date date2 = DateUtils.ctrlDate(currentTime, 1);

    String str_date1 = formatter.format(currentTime); //将日期时间格式化

    String str_date4 = formatter.format(date2); //将下一天

    String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式

    String str_date3 = formatter2.format(currentTime); //将Date型日期时间转换成年月日

/**
 * 获得指定日期的后一天 
 *
 * @param specifiedDay
 * @return
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>head</title>
    <link rel="stylesheet" href="<%=path%>/static/style/cy.css">
    <link rel="stylesheet" href="<%=path%>/static/style/style.css">
</head>
<script type="text/javascript">
    //获取地址栏
    function GetRequest() {
        var url = location.search; //获取url中"?"符后的字串
        var theRequest = new Object();
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = (strs[i].split("=")[1]);
            }
        }
        theRequest["url"] = window.location.pathname;
        return theRequest;
    }

    function loginOut() {
        var Request = new Object();
        Request = GetRequest();
        var returnUrl, requrl;
        returnUrl = Request['id'];
        requrl = Request['url'];
        window.location.href = "<%=path%>/logout?returnurl=" + requrl + "&id=" + returnUrl;
    }

    function login() {
        var Request = new Object();
        Request = GetRequest();
        var returnUrl, requrl;
        returnUrl = Request['id'];
        requrl = Request['url'];
        if (returnUrl == 'undefined')
            window.location.href = "<%=path%>/login?returnurl=" + requrl;
        else
            window.location.href = "<%=path%>/login?returnurl=" + requrl + "&id=" + returnUrl;
    }
</script>
<body onload="dateTime()">
<!--首页TOP-->
<div class="index-top">
    <div class="index-top3">
        <div class="left">
            <span class="one"><a href=""><img width="158" height="64"
                                              src="<%=path%>/static/images/logo1.png"></a></span>
            <span class="two"><img src="<%=path%>/static/images/index_q.png"></span>

            <div class="three">
                <span><img src="<%=path%>/static/images/index_03.png"></span>
                <ul>
                    <li class="rx">客户服务热线:</li>
                    <li class="phone">400-688-6798</li>
                </ul>
            </div>
        </div>
        <div class="right">
            <p class="one"><img src="<%=path%>/static/images/index_06.jpg"></p>
            <p class="two"><img src="<%=path%>/static/images/e_03.jpg"></p>
            <p class="three none"><img width="104" height="105" src="<%=path%>/static/images/weixin.png"></p>
        </div>
    </div>
</div>
<!--首页banner-->
<div class="index-banner">
    <div class="index-banner1">
        <ul>
            <li><a href="/index.jsp">首页</a></li>
            <li><a href="/clxjmain">丛林</a></li>
            <li><a href="/JungleList">闲居</a></li>
            <li><a href="ConEntryPage.jsp">忏悔</a></li>
            <li><a href="/foundIndex">基金会</a></li>
            <li><a href="joincl.jsp">加盟</a></li>
            <li><a href="/ContactUs">联系我们</a></li>
            <li><a href="/clsz">丛林素斋</a></li>
            <li>
                <div id="dateTime"></div>
            </li>
        </ul>
        <c:if test="${regUser==null }">
            <div class="dl"><a href="javascript:void(0)" onclick="login()">登录</a><i>|</i><a href="/register">注册</a></div>
        </c:if>
        <c:if test="${regUser!=null }">
            <div class="index-grzx "><a href="userPersonal">个人中心</a>&nbsp;&nbsp;&nbsp;&nbsp;<i>|</i>&nbsp;&nbsp;&nbsp;&nbsp;<a
                href="javascript:void(0)" onclick="loginOut()">退出</a></div>
        </c:if>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    function dateTime() {
        var date = new Date();
        var time = "" + date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        jQuery("#dateTime").html("&emsp;&emsp;&emsp;<font color='white'>" + time + "</font>");
        setTimeout(dateTime, 1000);
    }
</script>