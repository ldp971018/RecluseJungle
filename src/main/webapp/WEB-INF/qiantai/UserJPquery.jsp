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
      <title>丛林闲居-用户中心-加盟进度查询</title>
    <link rel="stylesheet" href="<%=path %>/static/style/cy.css">
    <link rel="stylesheet" href="<%=path %>/static/style/style.css">
</head>
<body style="background-color:#f6f6f6;">
<c:if test="${regUser==null }">
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
                        <li>尊敬的会员！<input type="hidden" id="uid" value="${regUser.id }"/></li>
                        <li class="quit"><em onclick="loginOut()">[退出]</em></li>
                    </ul>
                </li>
                <li class="top-two cf">手机：${regUser.mobile }</li>
                 <li class="top-two">邮箱：${regUser.email }</li>
            </ul>
            <ul class="grzl-banner">
                <li> <a href="userPersonal"><p class="grzl"></p>个人资料</a></li>
                <li> <a href="userCPassword"><p class="xgmm"></p>密码修改</a></li>
                <li > <a href="showAllClxjorderByUserid"> <p class="clxjdd"></p>丛林闲居订单</a></li>
                <li> <a href="showAllCarorderByUserid"><p class="ycdd"></p>我的用车订单</a></li>
                <li> <a href="showAllHelpinfo"><p class="qzjd"></p>求助进度查询</a></li>
                <li  class="yhzxsp yhzxs3"> <a href="javascript:void(0)"><p class="jmcx"></p>加盟进度查询</a></li>
            </ul>
        </div>

        <div class="per-cont-right">
            <div class="yhzx-jmjdcx">
                <div class="jmjdcx-top">
                    <span><a href="<%=path%>/showAllJoinclByUserid">丛林</a></span> |<span><a href="<%=path%>/showAllJoinxjByUserid">闲居</a></span> |<span><a href="<%=path%>/showAllJoincarByUserid">用车</a></span>
                    <table border="1">
                        <tr align="center" height="50">
                            <td width="150" >序号</td>
                            <td width="150" >加盟名字</td>
                            <td width="150" >加盟进度</td>
                            <td width="250" >申请时间</td>
                        </tr>
                        <c:forEach items="${list}" var="s" varStatus="n">
                            <tr align="center" height="50">
                                <td>${n.index+1}</td>
                                <td>${s.address}</td>
                                <td>
                                <c:if test="${s.joinstatus==0}">
                                    审核中
                                </c:if>
                                <c:if test="${s.joinstatus==1}">
                                    审核通过
                                </c:if>
                                </td>
                                <td>${s.jointime}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="jmjdcx-nr">
                    <div class="jmjdx-one">
                        <table border="1px solid #ccc" id="tab">
                        </table>
                    </div> 
                </div>
            </div>
        </div>
    </div>
     <%@ include  file="bottom.jsp"%>

</div>
</body>
</html>