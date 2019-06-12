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
</head>
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
<body>
<!--首页TOP-->
<div class="yc-txdd1">

    <!--首页banner-->
    <jsp:include page="head.jsp"/>
    <!--首页轮播图-->


    <div class="passwrod-seek-i seek-top" id="div1">
        <ul class="seek">
            <li class="sk-i">找回登录密码：</li>
            <li class="sk-ii sk-b">第一步：填写账号</li>
            <li class="sk-ii sk-c">第二步：验证</li>
            <li class="sk-ii sk-c">第三步：设置新密码</li>
            <li class="sk-ii sk-c">第四步：设置成功</li>
        </ul>
        <ul class="seek-i">
            <li class="seek-i-one">请输入您的账号</li>
            <li class="seek-i-two">手机号<input onblur="checkPhone()" maxlength="11" type="text" id="phone"/><span
                    id="span1" class="pwa-pro">提示：用于绑定的手机号</span><span style="color: red" id="span2"></span></li>
            <li class="seek-i-three">
                <div class="drag" style="border-radius: 10px; float: left;margin-left: 60px">
                    <div class="bg" style="border-radius: 10px"></div>
                    <div class="text" onselectstart="return false;" style="border-radius: 10px">请拖动滑块验证</div>
                    <div class="btn" style="border-radius: 10px">&gt;&gt;</div>
                </div>
            </li>
            <li class="seek-i-four"><input type="button" value="下一步" onclick="checkdiv1()"/></li>
        </ul>
    </div>

    <div class="passwrod-seek-ii seek-top" style="display:none" id="div2">
        <ul class="seek">
            <li class="sk-i">找回登录密码：</li>
            <li class="sk-ii sk-a">第一步：填写账号</li>
            <li class="sk-ii sk-b">第二步：验证</li>
            <li class="sk-ii sk-c">第三步：设置新密码</li>
            <li class="sk-ii sk-c">第四步：设置成功</li>
        </ul>
        <ul class="seek-ii">
            <li class="seek-ii-one"><em id="em1"></em></li>
            <li class="seek-ii-two">绑定邮箱<span class="dness" id="div2phone"></span></li>
            <li class="seek-ii-three">验证码<input onblur="checkCode()" id="code" maxlength="6" type="text" placeholder="请输入6位数的验证码"/>
                <input type="button" id="random" value="免费获取验证码" onclick="getCodeGen()"/><em id="em2" style="margin-left:20px;color:red;"></em>
            </li>
            <li class="seek-ii-four"><input type="button" value="下一步" onclick="checkdiv2()"/></li>
        </ul>
    </div>


    <div class="passwrod-seek-iii seek-top" style="display:none" id="div3">
        <ul class="seek">
            <li class="sk-i">找回登录密码：</li>
            <li class="sk-ii sk-a">第一步：填写账号</li>
            <li class="sk-ii sk-a">第二步：验证</li>
            <li class="sk-ii sk-b">第三步：设置新密码</li>
            <li class="sk-ii sk-c">第四步：设置成功</li>
        </ul>
        <ul class="seek-iii-two">
            <li class="skthree-newpwa">设置新密码<input maxlength="16" id="pwd" type="password" onblur="checkpwd()"
                                                   placeholder="请输入6-16位数的密码"/><span class="pwa-pro" id="span4"
                                                                                     style="color: red;"></span></li>
            <li class="skthree-conpwa">确认密码<input maxlength="16" id="repwd" type="password" placeholder="请再次输入密码"
                                                  onblur="checkrepwd()"/><span class="pwa-pro" id="span5"
                                                                               style="color: red;"></span></li>
            <li class="skthree-but"><input type="button" value="确认" onclick="czpwd()"/></li>
        </ul>
    </div>
    <%@ include file="bottom.jsp" %>
</div>


<div class="tcc none" id="okok">
    <div class="cgxd4">
        <div class="cgxd4-top"><p class="one"><img src="<%=path%>/static/images/zhmm4_03.jpg">提示</p>
            <p class="two"><img src="<%=path%>/static/images/14_01.png" class="close3"></p></div>
        <div class="cgxd4-main">
            您的登录密码设置成功！
        </div>
        <div class="cgxd4-buttom">
            <a href="javascript:void(0)" onclick="goLogin()">确&nbsp;认</a>
        </div>
    </div>

</div>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<%--<script src="../../static/js"></script>--%>
<script type="text/javascript">
    var success = false;//全局变量，用于判断是否能下一步
    var email = "";
    var wait = 120;//倒计时获取验证码时间
    //验证手机号码是否存在
    function checkPhone() {
        var span1 = document.getElementById("span1");
        var span2 = document.getElementById("span2");

        var phone = jQuery('#phone').val();
        var phoneNumCheck = /^1[3|4|5|7|8]\d{9}$/.test(phone);
        if (!phoneNumCheck) {
            span1.innerHTML = "";
            span2.innerHTML = "手机号码格式有误";
            checks = false;
        } else {
            jQuery.ajax({
                type: "post",
                url: "<%=path%>/checkMobile",
                data: {"username": phone},
                dataType: "json",
                async: false,
                success: function (results) {
                    if (results.status != true && results.status != "true") {
                        checks = false;
                        span1.innerHTML = "";
                        span2.innerHTML = "该号码还未注册，请核对";
                    } else {
                        email = results.email;
                        checks = true;
                        span1.innerHTML = "";
                        span2.innerHTML = "";
                    }
                }
            });
        }
    }


    //检验第一步
    function checkdiv1() {
        var span1 = document.getElementById("span1");
        var span2 = document.getElementById("span2");
        checkPhone();
        if (checks) {
            if (success) {
                var phone = jQuery('#phone').val();
                document.getElementById("div1").style.display = "none";
                document.getElementById("div2phone").innerHTML = email;
                // getNumRandom();
                document.getElementById("div2").style.display = "block";
            } else {
                checks = false;
                span1.innerHTML = "";
                span2.innerHTML = "请拖动滑块！";
            }
        }
    }

    // var code = "";
    var status2 = false;

    //获取验证码
    function getCodeGen() {
        var random = document.getElementById("random"); //发送按钮
        time(random);
        var em1 = document.getElementById("em1");//显示框
        var phone = jQuery("#phone").val();
        em1.innerHTML = "&emsp;验证码发送中请稍后...";
        if (email != null && email != "")
            jQuery.ajax({
                url: "/sendEmail",
                data: {"username": phone, "email": email},
                success: function (result) {
                    em1.innerHTML = result.msg;
                }
            })
    }

    //倒计时按钮
    function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.value = "免费获取验证码";
            wait = 120;
        } else {
            o.setAttribute("disabled", true);
            o.value = "重新发送(" + wait + ")";
            wait--;
            setTimeout(function () {
                    time(o);
                },
                1000);
        }
    }


    function checkCode() {
        var ss = jQuery("#phone").val();
        var code1 = jQuery("#code").val();
        var em2 = jQuery("#em2");
        if (code1 == '') {
            em2.text("请输入验证码！");
        } else {
            jQuery.ajax({
                url: "/verification",
                data: {"username": ss, "code1": code1},
                async: false,
                success: function (result) {
                    if (result.code == 1) {
                        status2 = true;
                    } else
                        status2 = false;
                    em2.text(result.msg);
                }
            })
        }
    }

    function checkdiv2() {
        if (status2) {
            document.getElementById("div2").style.display = "none";
            document.getElementById("div3").style.display = "block";
        }
    }

    //检查密码
    function checkpwd() {
        var pwd = jQuery('#pwd').val();
        var span4 = document.getElementById("span4");
        if (!(pwd.length >= 6)) {
            span4.innerHTML = "密码格式不正确";
            checks = false;
        } else {
            span4.innerHTML = "";
            checks = true;
        }
    }

    //检查再次输入密码
    function checkrepwd() {
        var pwd = jQuery('#pwd').val();
        var repwd = jQuery('#repwd').val();
        var span5 = document.getElementById("span5");
        checkpwd();
        if (checks) {
            if (pwd == repwd) {
                checks = true;
                span5.innerHTML = "";
            } else {
                checks = false;
                span5.innerHTML = "两次密码必须输入一致";
            }
        }
    }

    //重置密码
    function czpwd() {
        checkrepwd();
        if (checks) {
            var repwd = jQuery('#repwd').val();
            var phone = jQuery('#phone').val();
            jQuery.ajax({
                url: "<%=path%>/updatePwd",
                data: {"pwd": repwd, "username": phone},
                async: false,
                success: function (result) {
                    if (result == null) {
                        alert(result.msg);
                        window.location.href = "<%=path%>/retrievePassword";
                    }
                    if (result.status == "true" || result.status == true) {
                        document.getElementById("okok").style.display = "block";
                    } else {
                        alert(result.msg);
                        window.location.href = "<%=path%>/retrievePassword";
                    }
                }
            }, "json");
        }
    }

    //跳到登录页面
    function goLogin() {
        window.location.href = "<%=path%>/login";
    }
</script>

<script type="text/javascript">

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