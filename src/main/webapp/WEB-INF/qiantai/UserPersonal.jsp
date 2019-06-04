<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>丛林闲居-用户中心-个人资料</title>
    <link rel="stylesheet" href="<%=path %>/static/style/cy.css">
    <link rel="stylesheet" href="<%=path %>/static/style/style.css">
<!-- 表单验证start -->
<script src="<%=path %>/static/js/jquery.js"></script>
<script src="<%=path %>/static/js/jquery.validate.js"></script>
<script src="<%=path %>/static/js/jquery.metadata.js"></script>
<script src="<%=path %>/static/js/messages_cn.js"></script>
<!-- 表单验证stop -->
</head>
<body style="background-color:#f6f6f6;">
<c:if test="${sessionScope.regUser==null }">
    <script type="text/javascript">
        window.location.href = "<%=path%>/login";
    </script>
</c:if>

<div>
<!--首页TOP-->
        
        <!--首页banner-->
         <jsp:include  page="head.jsp" />
       <script type="text/javascript">
   function loginOut(){
		window.location.href = "<%=path%>/logout";
	}
   </script>
        <!--首页轮播图-->
<!--用车-填写订单-->
        <div class="personal-content">
            <div><img src="<%=path %>/static/images/ayw_03.gif"></div>
            <div class="per-cont-left">
                <ul class="left-top">
                    <li class="top-one">
                        <ul class="lf one-i">
                            <li><c:if test="${regUser.sex ==true}"><img src="<%=path %>/static/images/touxiagn.png"/></c:if>
                            	<c:if test="${regUser.sex ==false}"><img src="<%=path %>/static/images/touxiagnv.jpg"/></c:if>
                            </li>
                        </ul>
                        <ul class="lf one-ii">
                            <li> </li>
                            <li>尊敬的会员！</li>
                            <li class="quit"><em onclick="loginOut()">[退出]</em></li>
                        </ul>
                    </li>
                    <li class="top-two cf">用户名：${regUser.username }</li>
                    <li class="top-two">邮&nbsp;&nbsp;箱：${regUser.email }</li>
                </ul>
                <ul class="grzl-banner">
                    <li  class="yhzxsp yhzxs1"> <a href="javascript:void(0)"><p class="grzl"></p>个人资料</a></li>
                    <li> <a href="userCPassword"><p class="xgmm"></p>密码修改</a></li>
                    <li> <a href="showAllClxjorderByUserid"> <p class="clxjdd"></p>丛林闲居订单</a></li>
                    <li> <a href="showAllCarorderByUserid"><p class="ycdd"></p>我的用车订单</a></li>
                    <li> <a href="showAllHelpinfo"><p class="qzjd"></p>求助进度查询</a></li>
                    <li> <a href="showAllJoinclByUserid"><p class="jmcx"></p>加盟进度查询</a></li>
                </ul>
            </div>
            <form action="modifyUser" method="post" id="reguserForm">
             <div class="per-cont-right">
                <div class="jbxx"> 
                    <img src="<%=path %>/static/images/xxxx_03.jpg">基本信息
                    <p></p>
                </div>
                <div>
                    <table class="sg">
                        <tr>
                            <td>邮箱：</td>
                            <td><input type="text" id="email" class="required email"  name="reguser.email" value="${regUser.email }"><label id="email-error" style="color: red" class="error" for="email"></label></td>
                        </tr>
                        <tr>
                            <td>手机：</td>
                            <td><input type="text" id="phone" class="required isMobile" name="reguser.mobile" value="${regUser.mobile }"><label id="phone-error" style="color: red" class="error" for="phone"></label></td>
                        </tr>
                        <tr>
                            <td>性别：</td>
                            <td>
                            	<input type="radio" value="true" <c:if test="${regUser.sex ==true}">checked="checked" </c:if> name="sex">&nbsp;&nbsp;男&nbsp;&nbsp;
                            	<input type="radio" value="false" <c:if test="${regUser.sex ==false}">checked="checked" </c:if> name="sex">&nbsp;&nbsp;女
                            </td>
                        </tr>
                    </table> 
                </div>
                <div class="jbxx">
                    <img src="<%=path %>/static/images/xxxx_06.jpg">详细信息
                    <p></p>
                </div>
                <div> 
                    <table class="sg">
                        <tr> 
                            <td>真实姓名：</td>
                            <td><input id="name" class="isChinese"  name="realname" type="text"  value="${regUser.realname }"><label id="name-error" style="color: red" class="error" for="name"></label></td>
                        </tr> 
                        <tr>
                            <td>身份证明：</td>
                            <td><input id="idcard" name="idcard" type="text"  class="idCard"  value="${regUser.idcard }"><label id="idcard-error" style="color: red" class="error" for="idcard"></label></td>
                        </tr>
                        <!--<tr>
                            <td>所在城市：</td>
                            <td><select><option>江西省</option><option>江西省</option></select><select><option>南昌市</option><option>江西省</option></select></td>
                        </tr>-->
                        <tr>  
                            <td></td>
                            <td><i>*完善详细信息可加强您账号真实性</i></td>
                        </tr>
                    </table>
                </div>
                <input type="hidden" name="username" value="${regUser.username }"/>
                <input type="hidden" name="id" value="${regUser.id }"/>
                <input type="hidden"  name="city" value="${regUser.city }"/>
                 <input type="hidden"  name="mobile" value="${regUser.mobile }"/>
                 <input type="hidden"  name="email" value="${regUser.email }"/>
                <div class="anniu"><input  type="submit" value="保存"><input type="reset" value="取消"></div>
            </div>
			</form>
        </div>
 <%@ include  file="bottom.jsp"%>
</div>
<script src="<%=path %>/static/js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#reguserForm").validate({
		errorPlacement: function(error,element) {
        if ( element.is(":radio") )
            error.appendTo( element.parent().next().next() );
        else if ( element.is(":checkbox") )
            error.appendTo ( element.next() );
        else
            error.appendTo( element.parent());
    	}
	});
});

</script>
</body>
</html>