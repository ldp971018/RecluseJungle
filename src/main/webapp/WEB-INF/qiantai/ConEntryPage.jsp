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
    <script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=path%>/static/style/cy.css">
    <link rel="stylesheet" href="<%=path%>/static/style/style.css">
</head>
<body style="background-color: #f6f6f6;">
<!--首页TOP-->
    <div class="yc-txdd1">
<!--首页banner-->
<jsp:include  page="head.jsp" />
<script type="text/javascript">
function Alllogin(){
	window.location.href = "login.jsp?returnurl=/ConEntryPage.jsp";
} 
function loginOut(){
	window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/ConEntryPage.jsp";
}
</script>
<!--用车-填写订单-->
    <div class="yc-mbx">
        <div class="yc-mbx2">
        <p>当前位置：<a href="index.jsp" class="ll">丛林闲居网</a> <a href="#" class="xz">忏悔</a></p>
        </div>
    </div>
        <div class="yc-txdd">
    <div class="ch-jry">
    <div><img src="<%=path%>/static/images/ch_03.jpg"></div>
    <div class="ch-jry1">
        <p><a href="ConRoom">进入忏悔室</a><a href="#" class="ydtjw">阅读解脱文</a></p>
    </div>
    </div>
</div>
 <!--忏悔-进入页-->
        <%@ include  file="bottom.jsp"%>
</div>
<div class="tcc none" id="jd_pass">
    <div class="tx-ydm">
    		<form action="<%=path %>/free/selFreeOfPwd" method="post" id="myForm">
            <p class="tx-sm">
                <span class="one"><img src="<%=path%>/static/images/tx.png">提示信息</span>
                <span class="two"><img src="<%=path%>/static/images/14_01.png"class="close2"></span>
            </p><br/><br/><br/>
            <p>
                <div style="text-align: center;color: red;" id="message">
                  <input type="hidden" name="id" id="confessionid"/>
                </div>
            </p>
            <p class="ydm">
                请输入阅读码：
                <input type="text" name="pwd" id="pwd">
            </p>
            <p><input  type="button" value="确&nbsp;&nbsp;认" onclick="checkPwd()" id="button" class="safe" ></p>
            </form>
    </div>
</div>
<script type="text/javascript">
	function checkPwd(){

		//判断表单的客户端验证是否通过
		var pwd = document.getElementById("pwd").value;
		var button = document.getElementById("button");

		var valid = false;
		if(pwd==""||pwd==null){
			valid = false;
		}else{
			valid=true;
		}

		if (valid) {
			$.post("<%=path %>/confession/checkPwd",
				  {"pwd":pwd},
				  function(result){
                      /*解脱码不存在*/
					  if(result.code ==200){
						  $("#message").html(result.extend.message);
						  return false;
					  }
                      /*解脱码存在但是的没有回复*/
					  if(result.code==100&&result.extend.status==true){
						  /* button.disabled=false; */
					  	  $("#message").html(result.extend.message);
                              $("#confessionid").val(result.extend.id);
					  	  document.getElementById( "myForm").submit();
					  }else{
					      //没有进行回复
                          button.disabled=false;
						  $("#message").html(result.extend.message);
					  }
				  },"json");
		}else{
			 $("#message").html("请输入正确的密码格式");
		}
	}

	function resetPwd(){
		if(document.getElementById("hidden").value!=1){
		    $("#message").html("");
		}
	}

	function subForm(){
		/* document.getElementById("myForm").submit(); */
	}

    $(".ydtjw").click(function () {
        var jd_pass = document.getElementById("jd_pass");
        jd_pass.style.display = "block";
    });

    $(".close2").click(function () {
        var jd_pass = document.getElementById("jd_pass");
        jd_pass.style.display = "none";
    });

</script>
<script src="../../js"></script>

</body>
</html>