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
    <title>丛林闲居-忏悔-阅读脱解文</title>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="style/cy.css">
    <link rel="stylesheet" href="style/style.css">
</head>
<body style="background-color: #f6f6f6;">

<!--首页TOP-->
<div class="yc-txdd1">
    
    <!--首页banner-->
    <jsp:include  page="head.jsp" />   
<script type="text/javascript">     
function Alllogin(){
	window.location.href = "login.jsp?returnurl=/ConRead.jsp";
} 
function loginOut(){
	window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/ConRead.jsp";
}
 </script>
    <!--忏悔-忏悔室-->
    <div class="yc-txdd">
        <img src="images/ydtjw03.jpg" style="margin-top:10px;">
        <div class="ch-chs1">
            <div class="ch">
                <p>忏悔:</p>
                <p>
                	<c:if test="${confession.type ==true}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${confession.content }</c:if>
                	<c:if test="${confession.type ==false}">
                	<div id="chxx"></div>
                	</c:if>
                </p>
            </div>
            <p class="xuxian"></p>
            <div class="tjw">
                <p>解脱文：</p>
                <p class="tjw1">
                	<c:if test="${free.type ==true}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${free.content }</c:if>
                    	<c:if test="${free.type ==false}">
                    	<div id="jtxx" style="margin-left:20px;"></div>
                        </c:if>
                </p>
            </div> 
            <div class="tjw-bottom">
                <p class="yyd">已阅读：<i>${free.readnum }</i>次</p><p class="fhsy"><a href="ConEntryPage.jsp">返回首页</a> </p>
            </div>
        </div>
    </div>

<!--忏悔-进入页-->

 <%@ include  file="bottom.jsp"%>
</div>
<div class="tcc none">
    <div class="cgxd3">
        <div class="cgxd-main">
            <p class="xdcg"><img src="images/chw.png">  <img src="images/14_01.png" class="close"></p>
            <p class="ddbh">您的“忏悔”内容已提交，阅读解脱文密码为 <i>WO2012</i> ！</p>
            <p class="fhdd"><a href="index,jsp" class="fh">返回首页</a>（牢记上6位数字码，方便您阅读解脱文）</p>
        </div>
    </div>
</div>
<script src="js/index.js"></script>
</body>
<script type="text/javascript">
function playSound1()
{
	
  var borswer = window.navigator.userAgent.toLowerCase();
  if ( borswer.indexOf( "ie" ) >= 0 )
  {
    //IE内核浏览器
    var strEmbed = '<embed src="<%=path %>${confession.content }" style="margin-left:130px;" width="480" height="100" autostart="false"> </embed>';
    //if ($("#ssss").find("embed").length <= 0)
    //{
      $("#chxx").append(strEmbed);
    //}
    //var embed = document.embedPlay;
    //浏览器不支持 audion，则使用 embed 播放
    //embed.volume = 100;
    //embed.play();
  } else
  {
    //非IE内核浏览器
    var strAudio = "<audio id='audioPlay' src='<%=path %>${confession.content }' controls='controls'></audio>";
    //if ( $("#ssss").find("audio").length <= 0 ){
    $("#chxx").append(strAudio);
     //}
    //var audio = document.getElementById("audioPlay");
    //浏览器支持 audion
    //audio.play();
  }
}

function playSound2()
{
	
  var borswer = window.navigator.userAgent.toLowerCase();
  if ( borswer.indexOf( "ie" ) >= 0 )
  {
    //IE内核浏览器
    var strEmbed = '<embed src="${clxjBackfreeURI }${free.content }" style="margin-left:130px;" width="480" height="100" autostart="false"></embed>';
    //if ($("#ssss").find("embed").length <= 0)
    //{
      $("#jtxx").append(strEmbed);
    //}
    //var embed = document.embedPlay;
    //浏览器不支持 audion，则使用 embed 播放
    //embed.volume = 100;
    //embed.play();
  } else
  {
    //非IE内核浏览器
    var strAudio = "<audio id='audioPlay' src='${clxjBackfreeURI }${free.content }' controls='controls'></audio>";
    //if ( $("#ssss").find("audio").length <= 0 ){
    $("#jtxx").append(strAudio);
     //}
    //var audio = document.getElementById("audioPlay");
    //浏览器支持 audion
    //audio.play();
  }
}

playSound1();
playSound2();
</script>
</html>