<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>丛林闲居</title>
    <link rel="stylesheet" href="<%=path%>/static/style/cy.css">
    <link rel="stylesheet" href="<%=path%>/static/style/style.css">
    <script type="text/javascript" src="<%=path%>/static/js/jquery.js"></script>
</head>
<script language="javascript">
    function enterkey() {
        if (event.keyCode == 13) {
            yanzheng();
        }
    }
</script>
<style>
    .drag {
        width: 300px;
        height: 40px;
        line-height: 40px;
        background-color: #e8e8e8;
        position: relative;
        margin: 0 auto;
    }

    .bg {
        width: 40px;
        height: 100%;
        position: absolute;
        background-color: #75CDF9;
    }

    .text {
        position: absolute;
        width: 100%;
        height: 100%;
        text-align: center;
        user-select: none;
    }

    .btn {
        width: 40px;
        height: 38px;
        position: absolute;
        border: 1px solid #ccc;
        cursor: move;
        font-family: "宋体";
        text-align: center;
        background-color: #fff;
        user-select: none;
        color: #666;
    }
</style>
<body onkeydown="enterkey()">
<!--登录页TOP-->
<%
    String type = request.getParameter("type");
%>
<div class="index-top1">
    <div class="left">
        <span class="one"><a href=""><img src="<%=path%>/static/images/logo1.png" height="64px"
                                          width="158px"></a></span>
    </div>
    <div class="right1">
        <div class="three1">
            <span><img src="<%=path%>/static/images/index_03.png"></span>
            <ul>
                <li class="rx">客户服务热线:</li>
                <li class="phone">400-688-6798</li>
            </ul>
        </div>
    </div>
</div>
<div class="login-main">
    <div class="login-xf">
        <div class="lx-nei">
            <ul>
                <li class="yhdl1">用户登录<span id="error"
                                            style="border: none;color: red;margin-left: 30px;width: 180px;background-color:#fff;">${login}</span>
                    <c:remove var="login" scope="session"></c:remove>
                </li>
                <li class="yhm"><input id="username" maxlength="11" type="text" placeholder="手机号"
                                       onblur="checkUsername()"><span></span></li>
                <li class="yhm1"><input id="pwd" type="password" placeholder="密码" onblur="checkPwd()"> <span></span>
                </li>
                <li class="yzmtr">
                    <div class="drag" style="border-radius: 10px">
                        <div class="bg" style="border-radius: 10px"></div>
                        <div class="text" onselectstart="return false;" style="border-radius: 10px">请拖动滑块验证</div>
                        <div class="btn" style="border-radius: 10px">&gt;&gt;</div>
                    </div>
                </li>
                <li class="mouth1"><span class="one"><a href="/retrievePassword">忘记密码</a> </span><span class="one"
                                                                                                       style="margin-left: 200px;"><a
                        href="/register">注册</a> </span></li>
                <li class="dl"><input type="button" value="登录" onclick="yanzheng()"></li>
            </ul>
        </div>
    </div>
</div>
<input type="hidden" id="url"/>
<div class="success" id="show">
    <div>
        <div class="cgxd3">
            <div class="cgxd-main" style="padding-top:30px;">
                <p class="xdcg"><img src="<%=path%>/static/images/dlcg.png"></p>
                <p class="ddbh"><em id="em"></em></p>
            </div>
        </div>

    </div>

</div>


<footer>
    <ul>
        <li>江西省丛林闲居投资有限公司，工业和信息化部网站备案许可证编号：赣ICP备15010915号</li>
        <li>Copyright © 2015 <a href="#">丛林闲居</a> 版权所有 3wcl.com | 客服中心：400-688-6798</li>
    </ul>
    <p><a href="#"><img src="<%=path%>/static/images/index_48.jpg"></a><a href="#"><img
            src="<%=path%>/static/images/index_50.jpg"></a><a
            href="#"><img src="<%=path%>/static/images/index_52.jpg"></a> <a href="#"><img
            src="<%=path%>/static/images/index_54.jpg"></a><a
            href="#"><img src="<%=path%>/static/images/index_56.jpg"></a> <a href="#"><img
            src="<%=path%>/static/images/index_58.jpg"></a>
    </p>
</footer>

<script type="text/javascript">
    var success = false;

    var error = $("#error")
    var username = document.getElementById("username").value;
    var pwd = document.getElementById("pwd").value;

    function checkUsername() {
        if (!/^1[3|4|5|7|8]\d{9}$/.test(document.getElementById("username").value)) {
            error.text("用户名输入有误");
        } else {
            error.text("");
        }
    }

    function checkPwd() {
        if (document.getElementById("pwd").value == "" || document.getElementById("pwd").value.length < 6) {
            error.text("密码输入有误");
        } else {
            error.text("");
        }
    }

    function yanzheng() {
        if (!success) {
            error.text("请拖动滑块验证！");
        } else {
            if ((document.getElementById("pwd").value != "" && document.getElementById("pwd").value.length >= 6) && (document.getElementById("username").value != "" && /^1[3|4|5|7|8]\d{9}$/.test(document.getElementById("username").value))) {
                window.location.href = "/Desk_login?username=" + document.getElementById("username").value + "&pwd=" + document.getElementById("pwd").value;
            } else {
                error.text("输入信息有误！");
            }
        }
        return success;
    }


    //一、定义一个获取DOM元素的方法
    var $ = function (selector) {
            return document.querySelector(selector);
        },
        box = $(".drag"),//容器
        bg = $(".bg"),//背景
        text = $(".text"),//文字
        btn = $(".btn"),//滑块
        success = false,//是否通过验证的标志
        distance = box.offsetWidth - btn.offsetWidth;//滑动成功的宽度（距离）

    //二、给滑块注册鼠标按下事件
    btn.onmousedown = function (e) {

//1.鼠标按下之前必须清除掉后面设置的过渡属性
        btn.style.transition = "";
        bg.style.transition = "";

//说明：clientX 事件属性会返回当事件被触发时，鼠标指针向对于浏览器页面(或客户区)的水平坐标。

//2.当滑块位于初始位置时，得到鼠标按下时的水平位置
        var e = e || window.event;
        var downX = e.clientX;

//三、给文档注册鼠标移动事件
        document.onmousemove = function (e) {

            var e = e || window.event;
//1.获取鼠标移动后的水平位置
            var moveX = e.clientX;

//2.得到鼠标水平位置的偏移量（鼠标移动时的位置 - 鼠标按下时的位置）
            var offsetX = moveX - downX;

//3.在这里判断一下：鼠标水平移动的距离 与 滑动成功的距离 之间的关系
            if (offsetX > distance) {
                offsetX = distance;//如果滑过了终点，就将它停留在终点位置
            } else if (offsetX < 0) {
                offsetX = 0;//如果滑到了起点的左侧，就将它重置为起点位置
            }

//4.根据鼠标移动的距离来动态设置滑块的偏移量和背景颜色的宽度
            btn.style.left = offsetX + "px";
            bg.style.width = offsetX + "px";

//如果鼠标的水平移动距离 = 滑动成功的宽度
            if (offsetX == distance) {

//1.设置滑动成功后的样式
                text.innerHTML = "验证通过";
                text.style.color = "#fff";
                btn.innerHTML = "&radic;";
                btn.style.color = "green";
                bg.style.backgroundColor = "lightgreen";

//2.设置滑动成功后的状态
                success = true;
//成功后，清除掉鼠标按下事件和移动事件（因为移动时并不会涉及到鼠标松开事件）
                btn.onmousedown = null;
                document.onmousemove = null;

//3.成功解锁后的回调函数
                /* setTimeout(function(){
                alert('解锁成功！');
                },100); */
            }
        }

//四、给文档注册鼠标松开事件
        document.onmouseup = function (e) {

//如果鼠标松开时，滑到了终点，则验证通过
            if (success) {
                return;
            } else {
//反之，则将滑块复位（设置了1s的属性过渡效果）
                btn.style.left = 0;
                bg.style.width = 0;
                btn.style.transition = "left 1s ease";
                bg.style.transition = "width 1s ease";
            }
//只要鼠标松开了，说明此时不需要拖动滑块了，那么就清除鼠标移动和松开事件。
            document.onmousemove = null;
            document.onmouseup = null;
        }
    }


</script>
</body>
</html>