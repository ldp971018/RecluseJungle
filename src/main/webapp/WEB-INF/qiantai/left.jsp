<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>ZRCMS Control Panel</title>
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="js/menu_min.js"></script>
<script type="text/javascript">
$(document).ready(function (){ 
  
  $(".menu ul li").menu();
  
}); 
</script> 
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/menu-css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/static/css/styleleft.css">
</head><body> 
<div id="content">
<div class="menu">
<ul>
	<li><a>【系 统 设 置】</a>
		<ul>
			<li><a href="./model/fbgonggao.php" target="frmright">发布公告</a></li>
            <li><a href="./model/gonggao.php" target="frmright">公告管理</a></li>
			<li><a href="profile.php?uid=<?php echo $user;?>" target="frmright">资料修改</a></li> 
	        <li><a href="./model/adminlist.php" target="frmright">帐号管理</a></li> 
		   	<li><a href="./model/chushihua.php" target="frmright">默认设置</a></li>
		</ul>				
	</li>
	<li><a>【会 员 管 理】</a>
		<ul>
			<li><a href="./model/user.php?type=0" target="frmright">全 部</a></li>
			<li><a href="./model/user.php?type=1" target="frmright">学 生</a></li>
			<li><a href="./model/user.php?type=2" target="frmright">家 长</a></li>
           		<li><a href="./model/user.php?type=3" target="frmright">其 他</a></li>
		</ul>				
	</li>
	<li><a>【资 讯 管 理】</a>
		<ul>
			<li><a href="./model/fbzixun.php?menuid=11" target="frmright">发布资讯</a></li>
			<li><a href="./model/zixun.php" target="frmright">资讯管理</a></li>
		</ul>				
	</li>
	<li><a>【题 库 管 理】</a>
		<ul>
		   <li><a href="./model/zjtimu.php" target="frmright">增加题目</a></li>
           	   <li><a href="./model/timu.php?type=1" target="frmright">单选题管理</a></li>
		   <li><a href="./model/timu.php?type=2" target="frmright">多选题管理</a></li>
		   <li><a href="./model/timu.php?type=3" target="frmright">判断题管理</a></li>
		   <li><a href="./model/timu.php?type=4" target="frmright">问答题管理</a></li>
		</ul>				
	</li>
	<li><a>【问 卷 管 理】</a>
		<ul>
		<li><a href="./model/cjwenjuan.php" target="frmright">创建问卷</a></li>
 		<li><a href="./model/wenjuan.php" target="frmright">问卷管理</a></li>
 		</ul>				
	</li>
	<li><a>【推 送 管 理】</a>
		<ul>
			<li><a href="./model/fltuisong.php" target="frmright">分类管理</a></li>
			<!--<li><a href="./model/gexingyuqing.php" target="frmright">推送查询</a></li>-->
			<li><a href="./model/gxtuisong.php" target="frmright">添加推送</a></li>
			<li><a href="./model/mbtuisong.php" target="frmright">个人推送</a></li>
		</ul>				
	</li>
    <li><a>【投 诉 管 理】</a>
		<ul>
			<li><a href="./model/newtousu.php" target="frmright">新投诉</a></li>
			<li><a href="./model/tousu.php" target="frmright">投诉管理</a></li>
			<!--<li><a href="./model/tjtousu.php" target="frmright">投诉统计</a></li>-->
			<li><a href="./model/inform.php" target="frmright">举报管理</a></li>
		</ul>			
	</li>

	<li><a>【广 告 管 理】</a>
		      <ul>
			      <li><a href="./model/picadtop.php" target="frmright">焦点广告</a></li>
		     </ul>				
	   </li>
	<li><a>【技 术 支 持】</a>
		<ul>			
                        <li><a href="                       " target="_blank">官方网站</a></li>
			<li><a href="                        " target="_blank">系统升级</a></li>
		</ul>
    </li>
</ul>
</div>
</div>
</body></html>