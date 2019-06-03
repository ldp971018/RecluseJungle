<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>丛林闲居-用车-填写订单</title>
<link rel="stylesheet" href="/static/style/cy.css">
<link rel="stylesheet" href="/static/style/style.css">
<script src="/static/js/laydate.js"></script>
<link rel="stylesheet" href="/static/style/laydate.css">
<link rel="stylesheet" href="/static/js/molv/laydate.css">
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<!-- 表单验证start -->
<script src="<%=path %>/static/js/jquery.js"></script>
<script src="<%=path %>/static/js/jquery.validate.js"></script>
<script src="<%=path%>/static/js/jquery.metadata.js"></script>
<script src="<%=path%>/static/js/messages_cn.js"></script>
<link rel="stylesheet" href="<%=path%>/static/css/validation.css">
<!-- 表单验证stop -->
</head>
<body>
<c:if test="${regUser==null }">
<script type="text/javascript">
window.location.href = "<%=path%>/login.jsp";
</script>
</c:if>
<div><!--首页TOP-->
<div class="yc-txdd1"><!--首页banner--> 
<jsp:include  page="head.jsp" />   
<script type="text/javascript">
function loginOut(){
	window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/clxjmain!Homepage.action";
}
</script>
<!--首页轮播图--> <!--用车-填写订单-->
<div class="yc-txdd">
<div class="yc-mbx">
<p>当前位置：<a href="JungleList.jsp" class="ll">国内丛林</a> > <a
	href="CarAllModels.jsp" class="ll">用车</a> > <a href="#" class="xz">填写乘车人信息</a></p>
</div>
<div><img src="/static/images/yc_03.jpg"></div>
<div class="yc-mbx1">
<p><span>用车</span><img src="/static/images/tj_03.jpg"><span>选择车型</span><img
	src="/static/images/tj_03.jpg"><span>订单填写</span><img
	src="/static/images/tj_05.jpg"><i>完成订单</i></p>
</div>
<div class="yc-title">填写订单</div>
<form action="<%=path %>/carorder!saveCarorder.action" method="post"
	id="carorderForm"><input type="hidden" name="uid"
	value="${regUser.id }" /> <input type="hidden" name="cid"
	value="${carinfoJson.id }" /> <input type="hidden"
	name="total" value="${carinfoJson.price }" />
<div class="yc-main">
<div class="ym-left">
<p class="tics">选择用车方式</p>
<table class="one-tab">
	<tr>
		<td>用车日期&nbsp;&nbsp;&nbsp;</td>
		<td class="ycrq"><input name="usetime" type="text"
			id="d241" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
			class="Wdate" style="width: 300px" /></td>
		<td a></td>
	</tr>
	<tr>
		<td>出发地点&nbsp;&nbsp;&nbsp;</td>
		<td class="ycrq1"><input name="startplace" type="text" /></td>
		<td></td>
	</tr>
	<tr>
		<td>目的地点&nbsp;&nbsp;&nbsp;</td>
		<td class="ycrq1"><input name="endplace" type="text" /></td>
		<td></td>
	</tr>
	<tr>
		<td>用车程向&nbsp;&nbsp;&nbsp;</td>
		<td class="ycrq2"><input name="useroption" type="radio"
			checked="checked" value="true">&nbsp;&nbsp;单程&nbsp;&nbsp;<input
			type="radio" name="useroption" value="false">&nbsp;&nbsp;往返&nbsp;&nbsp;
		</td>
	</tr>
</table>
<p class="tics">填写乘车人信息</p>
<table class="two-tab">
	<tr>
		<td>乘车人&nbsp;&nbsp;&nbsp;</td>
		<td class="ycrq3"><input name="checkperson" type="text" maxlength="4"
			placeholder="请输入乘车人姓名"></td>
		<!--<input type="checkbox">保存至常用联系人</td>-->
		<td></td>
	</tr>
	<tr height="20">
		<td></td>
		<td>
		<!--<p class="ccr">请输入乘车人姓名</p>
		--></td>
	</tr>
	<tr>
		<td>手机号码&nbsp;&nbsp;&nbsp;</td>
		<td class="ycrq3"><input name="checkphone" type="text" maxlength="11"
			placeholder="请输入乘车人手机号码"></td> 
		<!--<input type="checkbox">乘车人免费接收提醒短信</td>-->
		<td></td>
	</tr>
	<tr height="20">
		<td></td>
		<td>
		<!--<p class="ccr">请输入乘车人手机号</p>
		--></td>
		<td></td>
	</tr>
	<tr>
		<td>
		<p class="fwly">服务留言&nbsp;&nbsp;&nbsp;</p>
		</td>
		<td class="ycrq3"><textarea name="message"
			placeholder="例：有小孩一同乘坐，请开慢点"></textarea></td>
	</tr>
	<!--
                <tr>
                    <td></td>
                    <td><input type="checkbox">&nbsp;&nbsp;同意易到用车《服务协议》</td>
                </tr>
                -->
	<tr>
		<td></td>
		<td><input id="sub" type="button" value="提交订单" class="tjdd1" onclick="subForm()"></td>
	</tr>
</table>
</div>
<div class="ym-right">
<div class="ym-r1">
<p class="fhxg"><a href="#"> 返回修改</a></p>
<p class="sxcx">所选车型</p>
<ul>
	<!--<li>车型：经济车型  东风日产天籁 银色</li>
                    -->
	<li>牌照：${carinfoJson.licence }</li>
	<!--<li>设施：车载充电，纸巾，矿泉水</li>
                -->
</ul>
<ul>
	<li>价格：<span><i>￥</i>${carinfoJson.price }</span></li>
	<li>好评率：${carinfoJson.commentOk }%</li>
	<li>其他说明：</li>
</ul>
</div>
<div class="ym-r2">
<p><img src="/static/images/11.png"></p>
<p><span>如需帮组请咨询</span></p>
<p><i>400-688-6798</i></p>
</div>
</div>
</div>
</form>
</div>
 <%@ include  file="bottom.jsp"%>
</div>
<c:if test="${carorderOk==1}">  
<div class="tcc">
<div class="cgxd1">
<div class="cgxd-main">
<p class="xdcg"><img src="/static/images/xdcg.png"></p>
<p class="ddbh">订单编号：<i>${oid }</i>
[请牢记您的订单编号]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单总价：<i>${total }</i>
（该订单属于线下支付类型）</p>
<p class="fhdd">您可以：<a href="UserCarOrder.jsp" class="fh">返回我的订单</a>（如有疑问请联系丛林闲居客服QQ:2897968708）</p>
<p class="wxts"><i>*温馨提示：</i>IE6.0及更低版本浏览器用户请检查您的浏览器是否支持128位密钥长度，如果不支持，请升级您的浏览器（<span>查看如何检查和升级方案</span>）</p>
</div>
</div>
</div>
</c:if>
<div class="tcc1 none">
<div class="cgxd2">
<div class="cgxd-main">
<p class="yzsj">验证手机</p>
<div>
<p class="sjh"><input type="text" placeholder="手机号"></p>
<p class="tpyxm"><input type="text" placeholder="图片验证码"><img
	src="/static/images/yzm_03.png"></p>
<p class="tpyxm"><input type="text" placeholder="手机验证码"><a
	href="#">获取验证码</a></p>
<p><i><a href="#">收不到验证码？重新再发一次</a> </i></p>
<p><input type="submit" value="确&nbsp;&nbsp;定"></p>
<p class="dlc"><i><a href="#">使用本站帐号登录</a></i></p>
</div>
</div>
</div>
</div>
</div>
<script src="../../js"></script>
<script type="text/javascript">
function subForm(){
	var sub = document.getElementById("sub");
	var check = $("#carorderForm").valid();  
	if(check){
		sub.disabled = true;
		document.getElementById("carorderForm").submit();
	} 
}
$(document).ready(function(){
	$("#carorderForm").validate({
		rules: {
			"usetime": {
				required: true
				},
		    "startplace": {
		    	required: true
		   		},
		   	"endplace": {
				required: true
				},
			"checkperson": {
				required: true,
				isChinese:true
				},
			"checkphone": {
				required: true,
				isMobile:true
				}
		  	},  
		messages: {
		  	"usetime": {
		  		 required: "用车日期不能为空" 
				},
		   "startplace": {
		    	required: "出发点不能为空"
		  		},
		  "endplace": {
				required: "目的地点不能为空"
				},
		  "checkperson": {
				required: "乘车人名字不能为空",
				isChinese:"请输入正确的中文名字"
				},
		  "checkphone": {
				required: "乘车人手机号码不能为空", 
				isMobile: "请输入正确的手机号码"
				}
		  }
			  
	});
}); 
    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo3'});//绑定元素
    }();
</script>
</body>
</html>