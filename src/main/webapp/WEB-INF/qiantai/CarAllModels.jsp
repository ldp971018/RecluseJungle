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
  <title>丛林闲居</title>
    <link rel="stylesheet" href="/static/style/slider.css">
    <link rel="stylesheet" href="/static/style/cy.css">
    <link rel="stylesheet" href="/static/style/style.css">
</head>
<body>
<%--<c:if test="${regUser==null }">
<script type="text/javascript">
window.location.href = "/login";
</script>
</c:if>--%>
<!--首页TOP-->
    <div class="yc-txdd1">
         
        <!--首页banner-->
        <jsp:include  page="head.jsp" />   
<!--首页轮播图-->
 <script type="text/javascript">
 function loginOut(){
		window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/clxjmain!Homepage.action";
	}
 </script>
<input type="hidden" id="uid" value="${regUser.id }"/>
<input type="hidden" id="clxjmainid" value="${clxjmainid }"/>
<!--用车-填写订单-->
<div class="yc-txdd">
    <div class="yc-mbx">
        <p>当前位置：<a href="index.jsp" class="ll">丛林闲居网</a> > <a href="#" class="xz">所有车型</a></p>
    </div>
    <div class="yc-sycx">   
    <c:forEach items="${carinfoJsons}" var="car" varStatus="status">  
        <div class="che">
            <br/><br/>
            <div class="che-left">   
                <div class="slider" >  
                    <div class="slider_box" id="slider_name${status.index + 1}" >
                        <ul class="silder_con"> 
                        <c:forEach items="${car.carouselImg}" var="img">
                            <li class="silder_panel clearfix">  
                                <a href="javascript:void(0)" class="f_l"><img  src="${clxjBackurl }${img }"/></a>
                            </li>
                            </c:forEach>  
                        </ul>
                    </div>
            </div>

        </div>
            <div class="che-right">
                <p class="qclx">${car.cartitle }</p>
                <p class="hplg">好评率：${car.commentOk } %</p>
                <p class="hours"><span><i>￥</i>${car.price }</span>/小时</p>
                <p><a href="javascript:void(0)" onclick="getCarcomment(${car.id })" class="a1">查看评价</a> <a href="CarOrderById?id=${car.id }&commentOk=${car.commentOk }" class="a2">点击预订</a> </p>
            </div>
    </div>
    </c:forEach>
    <c:if test="${carinfoJsons ==null}"> 
    	<div class="che">
            <br/><br/>
            	抱歉，当前入住并没有加盟车辆
    </div>
    </c:if>
    <br/><br/>
        <!--<div class="che-bot">
                <p >点击查看更多</p> 
        </div>
--></div>
</div>    
 <%@ include  file="bottom.jsp"%>
    </div>
<div id="tcc" class="tcc none">
    <div class="cgxd5">
        <div class="cgxd-main">
            <p class="xdcg"><i>共有评论<em id="count"></em>条</i> <img src="/static/images/14_01.png" class="close" onclick="closeIndex()"></p>
            <div class="nb">
                <div class="cam-list" id="carcomment1">
                
                </div>
                <div class="txpj" id="carComment" style="display: block;">
                	<input type="hidden" id="cid"/>  
                   <span>评价</span> &nbsp;&nbsp;&nbsp;<input type="radio" name="pl" value="0" checked="checked">&nbsp; 好评&nbsp;&nbsp;&nbsp;<input type="radio" name="pl" value="1">&nbsp; 中评&nbsp;&nbsp;&nbsp; <input type="radio" name="pl" value="2">&nbsp; 差评
                    <textarea id="content" placeholder="填写你的评价吧！长度不能超过30哦" onpropertychange="checkLength(this,30);" oninput="checkLength(this,30);"></textarea>
                    <p><input type="submit" value="提交" onclick="saveComment()"> </p> 
                </div>
            </div>  
        </div>
    </div>
</div>

</div>
<script src="/static/js/jquery.min.js"></script>
<%--<script src="../../js"></script>--%>
<script src="/static/js/jquery.slides.js" type="text/javascript"></script>
<script>
//限制textarea输入长度
function checkLength(obj,maxlength){
    if(obj.value.length > maxlength){
        obj.value = obj.value.substring(0,maxlength);
    }
}
</script>
<script>
   var len=$(".slider").length;
    for(var i=0;i< len;i++){
        var id="#slider_name"+(i+1);
        sliderlbt(id);
    }
</script>
<script type="text/javascript">
    function closeIndex() {
        var arr=document.getElementById("tcc");
        arr.classList.add("none");
    }
    //时间戳转换方法    date:时间戳数字
    function formatDate(date) {
        var date = new Date(date);
        var YY = date.getFullYear() + '-';
        var MM = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var DD = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate());
        var hh = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
        var mm = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
        var ss = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds());
        return YY + MM + DD +" "+hh + mm + ss;
    }
//点击查看评论获取评论
	function getCarcomment(carId){
		showCarComment(carId);
		document.getElementById('cid').value=carId; 
		var count = document.getElementById("count");
		var carcomment = document.getElementById("carcomment1");
		count.innerHTML = ""; 
		carcomment.innerHTML = ""; 
		$.ajax({  
	        type : "post",   
	         url : "carComment",
	         data: {"cid":carId},
	         dataType: "json",
	         async : false,   
	         success : function(results){
	            console.log(results);
                 console.log(results.count);
	        	 count.innerHTML = results.count; 
	        	 for(var i=0;i<results.count;i++){
		        	 var uRealname = results.carcommentJsons[i].username;//评论人名字
		        	 var content = results.carcommentJsons[i].content;//评论内容
		        	 var commenttime = results.carcommentJsons[i].commenttime;//评论时间
	        		 carcomment.innerHTML += "<p><span class='one'>"+uRealname+"</span><span class='two'>"+content+"</span><span class='three'>"+formatDate(commenttime)+"</span></p>";
		        	 }
	         }  
	    });
            var arr=document.getElementById("tcc");
            arr.classList.remove("none");
		}
	//增加评论
	function saveComment(){
		var content = $('#content').val(); //评论内容
		if(content.length<1){
			alert('请输入评论内容'); 
			}else{
			var chkObjs = document.getElementsByName('pl'); 
			var cflag;//评论等级
			for(var i=0;i<chkObjs.length;i++){
                if(chkObjs[i].checked){ 
                	cflag = chkObjs[i].value;
                    break; 
                }
            } 
			var cid = $('#cid').val(); //车辆id
			var uid = $('#uid').val();//评论人id
            //执行增加评论
			$.ajax({  
		        type : "post",   
		         url : "addCarcoment",
		         data: {"cid":cid,"uid":uid,"cflag":cflag,"content":content},
		         dataType: "json",
		         async : false,   
		         success : function(results){ 
		        	if(results.isOk==true||results.isOk=="true"){
			        	alert("评论成功！");
			        	document.getElementById("content").value="";
		        		getCarcomment(cid);
			        	}else{ 
			        		alert("评论失败，请重试！");
				        	}
		         }  
		    }); 
		}
	}
	function showCarComment(carId){
		var uid = $('#uid').val();//评论人id
		$.ajax({  
	        type : "post",  
	         url : "carComment",
	         data: {"cid":carId},
	         dataType: "json", 
	         async : false,    
	         success : function(results){
	        	 if(results){
	        		document.getElementById("carComment").style.display = "block"; 
	            }else{ 
	            	document.getElementById("carComment").style.display = "none";  
	             }
	         }  
	    });
	}
</script>
</body>
</html>