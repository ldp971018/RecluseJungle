<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>丛林闲居-丛林加盟</title>
    <link rel="stylesheet" href="<%=path%>/static/style/cy.css">
    <link rel="stylesheet" href="<%=path%>/static/style/style.css">
<!-- 表单验证start -->
<script src="<%=path%>/static/js/jquery.js"></script>
<script src="<%=path%>/static/js/jquery.validate.js"></script>
<script src="<%=path%>/static/js/jquery.metadata.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/messagesx_cn.js"></script>
<!-- 表单验证stop -->
<!-- 下载中文文件start -->
<script src="<%=path%>/static/sheet/js/download.js"></script>
<!-- 下载中文文件stop -->
</head>
<body>
<div>
<script type="text/javascript">
$(function(){
	if(!placeholderSupport()){   // 判断浏览器是否支持 placeholder
	    $('[placeholder]').focus(function() {
	        var input = $(this);
	        if (input.val() == input.attr('placeholder')) {
	            input.val('');
	            input.removeClass('placeholder');
	        }
	    }).blur(function() {
	        var input = $(this);
	        if (input.val() == '' || input.val() == input.attr('placeholder')) {
	            input.addClass('placeholder');
	            input.val(input.attr('placeholder'));
	        }
	    }).blur();
	};
	})
	function placeholderSupport() {
	    return 'placeholder' in document.createElement('input');
	} 
</script>
<script language="JavaScript">
       // javascript:window.history.forward(1); //我目前先用着这个
</script>
<!--首页TOP-->
    <div class="yc-txdd1">
         
        <!--首页banner-->
       <jsp:include  page="head.jsp" />
        <script type="text/javascript">
function Alllogin(){
	window.location.href = "login.jsp?returnurl=/joincl.jsp";
} 
function loginOut(){
	window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/joincl.jsp";
}
 </script>
            <!--首页轮播图-->
<!--用车-填写订单-->
<div class="yc-txdd">
    <div class="yc-mbx">
        <p>当前位置：<a href="index.jsp" class="ll">丛林闲居网</a> > <a href="#" class="xz">加盟</a></p>
    </div>
    <div><img src="<%=path%>/static/images/jm_03.jpg"></div>
    <div class="jm">
    <div class="kwff-p1">
          <p class="kwff-p11">加盟列表</p>
           <p class="kwff-p12"><span  class="qzfze">丛林加盟</span><a href="/joinxj"><span>闲居加盟</span></a> <a href="/joincar"><span>车辆加盟</span></a> </p>
     </div>
     <div class="qzsqb">
     <div class="qzsqb-one">
               <ul>
                  <li><a href="javascript:void(0)" onclick="goDownload('闲居加盟丛林闲居的合同.docx')">闲居加盟丛林闲居的合同.docx</a> </li>
                </ul>
      </div>
      </div>
        <div class="jm-left">
            <p class="xx">
            	<c:if test="${regUser ==null }"><em style="font-size: 10px;color: red">加盟首先要登录哦，点击<a href="Desk_login">登录</a><br/></em></c:if>
            	<img src="<%=path%>/static/images/09.png">请填写加盟信息：
            	</p>
             <span class="rxxx">如果您是丛林，想加盟丛林闲居网，请填写如下信息（<i>* 为必填项</i>）</span>

             <form method="post"  action="<%=path%>/addJoincl" id="joinclForm" onsubmit="return checkSubmit()"  enctype="multipart/form-data">
             <div class="tab">
            	<!-- 用户id -->
            	<input type="hidden" name="uid" id="uid" value="${regUser.id }"/>
               <p><input type="text" value="${joincl.clname }"       name="clname" id="name"  placeholder="寺院名称" class="lxr" ><i>*</i><span class="status" style="color: red" id="td1"></span><span class="status" style="color: red" id="td1"></span></p>
               <p><input type="text" value="${joincl.permitno }"     name="permitno" id = "permitno"  placeholder="宗教场所许可证号" class="lxr " ><i>*</i><span class="status" style="color: red" id="td1"></span><span class="status" style="color: red" id="td2"></span></p>
               <p><input type="text" value="${joincl.address }"      name="address"  id="address" placeholder="地 址" class="lxr" ><i>*</i><span class="status" style="color: red" id="td1"></span><span class="status" style="color: red" id="td3"></span></p>
               <p><input type="text" value="${joincl.legalname }"    name="legalname" id="legalname" placeholder="法人代表名字" class="lxr "><i>*</i><span class="status" style="color: red" id="td4"></span></p>
               <p><input type="text" value="${joincl.legalphone }"   name="legalphone" id="legalphone" placeholder="法人代表手机号" class="lxr "><i>*</i><span class="status" style="color: red" id="td5"></span></p>
               <p><input type="text" value="${joincl.legalidcard }"  name="legalidcard" id="legalidcard"  placeholder="法人代表身份证号" class="lxr "><i>*</i><span class="status" style="color: red" id="td6"></span></p>
               <p><input type="text" value="${joincl.contactsname }" name="contactsname" id="contactsname"  placeholder="联系人名字" class="lxr "><i>*</i><span class="status" style="color: red" id="td7"></span></p>
               <p><input type="text" value="${joincl.contactsmobile }"name="contactsmobile" id="contactsmobile"  placeholder="联系人固定电话（xxxx-xxxxxxx）" class="lxr "><i>*</i><span class="status" style="color: red" id="td8"></span></p>
               <c:if test="${joincl==null }">
               <p><input type="text" maxlength="11" name="contactsphone" value="${regUser.username}" id="contactsphone"  placeholder="联系人手机（11位手机号码，作为后台管理员登录帐号）" class="lxr " onblur="checkContactsphone()"><i>*</i><span class="status" style="color: red" id="td9"></span></p>
               <p><input type="text"  id="email"  placeholder="输入正确邮箱,获取验证码" class="lxr " onblur="checkContactsphone()"><i>*</i><span class="status" style="color: red" ></span></p>
               <p><input type="text"  id="code"   placeholder="验证码" maxlength="6"  onblur="checkCode()" class="yzm">
                   <button type="button" id="random" onclick="getCodeGen()">获取验证码</button><i>*</i>
               		<span class="status" style="color: red" id="td10"></span></p>
               		<input type="hidden" name="update" value=""  id="update"/>
                </c:if>
                <c:if test="${joincl!=null }">
                	<input type="hidden" name="contactsphone" value="${joincl.contactsphone }"/>
                	<input type="hidden" name="id" value="${joincl.id }"/>
                	<input type="hidden" name="jointime" value="${joincl.jointime}" id="jointime"/>
               		<input type="hidden" name="update" value="1" id="update"/>
                </c:if>
               <p><input value="${joincl.postcode }" type="text" name="postcode" id="postcode"  placeholder="邮编" class="lxr "><i>*</i><span class="status" style="color: red" id="td11"></span></p>
               <p id="more"><input type="file" name="hetongUpload"><i>合同上传&nbsp;&nbsp;&nbsp;*</i></p>
               <p><textarea  name="message" placeholder="寺院的简要介绍（500字以内）：">${joincl.message }</textarea></p>
               <p style="margin-top:20px;">
                   <input type="button" id="sub" value="提交信息"></p>
            </div>
            </form>
            <p class="xx"><img src="<%=path%>/static/images/09.png">要求及流程说明</p>
            <p class="ln">本着双赢的理念，丛林闲居已建立了一个遍及全国的完善代理商网络。无论是个人还是企业，只要符合丛林闲居的要求，都可
                以成为丛林闲居的代理商，代理丛林闲居的国内、国外闲居预订的业务。 代理商将获得强大的品牌支持，良好的售后服务体系
                同时获得丰厚的利润回报。</p>
            <div class="liucheng">
                <img src="<%=path%>/static/images/one_03.jpg">
            </div>
        </div>
</div>
 
</div>
 <%@ include  file="bottom.jsp"%>
    </div>
</div>
<c:if test="${show !=null}"> 
<div class="tcc2">     
    <div class="tx-ydm" style="margin-top: 300px;">  
            <p class="tx-sm"><span class="one"><img src="<%=path%>/static/images/tx.png">提示</span><span class="two"><img src="<%=path%>/static/images/14_01.png" class="close5"></span></p><br/><br/><br/>
            <p align="center">
            	<c:if test="${isOk ==true}">加盟成功，你的临时密码为${pwd }</c:if>
            	<c:if test="${isOk ==false }">加盟失败</c:if></p><br/><br/><br/>
            <p align="center">
            	<c:if test="${isOk ==true }">点击<a href="<%=path %>/showAllJoinclByUserid">查看</a>加盟进度</c:if>
            	<c:if test="${isOk ==false }">点击<a href="<%=path %>/joincl">加盟</a>重新加盟</c:if> <br/><br/><br/>
            </p>
    </div>
</div>     
</c:if>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript">
var wait=120;//倒计时获取验证码时间
var checks = false;
 var status2 = false; //一个全局变量，用来最终判断表单是否可以提交

    //获取验证码
    function getCodeGen() {
        var random = document.getElementById("random"); //发送按钮
        time(random);
        var email = jQuery("#email").val();
        var phone = jQuery("#contactsphone").val();
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

    //邮箱验证码验证
    function checkCode() {
        var ss = jQuery("#email").val();
        var code1 = jQuery("#code").val();
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

$("#sub").click(function() {
	var uid = document.getElementById("uid").value;
	var update = document.getElementById("update").value;
	//先判断是否登录
	if(uid==null||uid==""){
		alert("请先登录");
	}else{
		if(update==1){
			 	document.getElementById("joinclForm").submit();
		}else{
            checkCode();
            if(status2){
                document.getElementById("joinclForm").submit();
	 		}else {
                alert("验证码错误");
            }
		}
	}
});


</script>
</body>
</html>