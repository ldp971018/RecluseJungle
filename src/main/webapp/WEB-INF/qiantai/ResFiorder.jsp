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
  <title>丛林闲居-订房-填写订单</title>
    <link rel="stylesheet" href="/static/style/cy.css">
    <link rel="stylesheet" href="/static/style/style.css">
    <script src="${path}/static/js/laydate.js"></script>
    <link rel="stylesheet" href="${path}/static/style/laydate.css">
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script src="<%=path %>/static/js/jquery.js"></script>
</head> 
<body style="background-color: #e7f2ff;">
<script language="JavaScript">
        javascript:window.history.forward(1); //我目前先用着这个
</script>
<!--登录页TOP-->
<div class="index-top1">
<c:if test="${regUser==null }">
<script type="text/javascript">
window.location.href = "/login.jsp";
</script>
</c:if>
    <div class="left">
        <span class="one"><a href="                   "><img src="/static/images/logo1.png"></a></span>
    </div>
    <div class="right1">
        <div class="three1">
            <span><img src="/static/images/index_03.png"></span>
            <ul>
                <li class="rx">客户服务热线:</li>
                <li class="phone">400-688-6798</li>
            </ul>
        </div>
    </div>
</div>
<div class="df-txdd">
    <div class="dt-main">
    <form action="addOrder" method="post" id="orderForm">
        <div class="dtm-left">
            <div class="top">
            	<input type ="hidden" name="cid" id="cid" value="${clxjmainJson.id }"/>
            	<input type ="hidden" name="uid"  value="${regUser.id }"/>
            	<input type ="hidden" name="total" id="total" value="${clxjmainJson.price }"/>
            	<input type ="hidden" name="state"   value="1"/>
            	<input type ="hidden" name="type2"   value="${clxjmainJson.type2 }"/>
                <p class="one"><img src="/static/images/txdd_03.jpg">${clxjmainJson.name }</p>
                <p class="two">地址:${clxjmainJson.address }</p>
            </div>
            <div class="second">
                <div class="df-title">
                    填写订单
                </div>
                <div class="df-td">
                    <!-- <p class="kfsl">
                        客房数量：
                        <select>
                            <option value="0">1间</option>
                            <option value="1">2间</option>
                            <option value="2">3间</option>
                        </select>      
                    </p> -->
                    <!-- <p class="kf1">客房1：豪华中庭房</p> -->
                    <p class="time kfsl">入住时间：
       				 <input id="d5221" name="checkstartdate"  placeholder="年/月/日" class="Wdate laydate-icon" type="text" onFocus="var d5222=$dp.$('d5222');WdatePicker({onpicked:function(){d5222.focus();},maxDate:'#F{$dp.$D(\'d5222\')}',minDate:'%y-%M-{%d}'})" />
						至
					<input id="d5222" name="checkenddate"  placeholder="年/月/日" class="Wdate laydate-icon" type="text"  onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d5221\')}',onpicking:function(dp){checkDate(dp.cal.getNewDateStr(),${clxjmainJson.price })}})" /><em id="em" style="color: red;"></em>
       				 </p> 
                    <p class="kfs2 txxm">入住人姓名：<input name="checkperson" id="checkperson" onblur="check('checkperson')" type="text" placeholder="如：张三" style="height:28px;"><i>(请填写实际一名入住人姓名)</i></p>
                    <!-- <p class="kfs3 ">房型：200*200cm大床/120*200cm双床</p> --><br/>  
                    <p class="zyts"><span class="one"><img src="/static/images/icon-important.png"></span><span class="two">重要提示：每位在丛林或闲居居住过的人，在离开时必须以入住信息中“联系人”的名字或登录账号为名字，向江西济缘慈善基金会捐款人民币30元（多捐不限）。否则，系统将会自动将您列入不受欢迎的人。</span> </p>
                </div>
                <div class="df-rzxx">
                    <p>入住信息：</p>
                    <table>
                        <tr>  
                            <td>联系人:</td>
                            <td><input type="text" name="relperson" id="relperson" onblur="check('relperson')"></td>
                            <td>请填写真实姓名</td>
                        </tr>
                        <tr>
                            <td>电话号码:</td>
                            <td><input type="text" name="relphone" maxlength="11" id="relphone" onblur="check('relphone')"></td>
                            <td>用于接收确认信息</td>
                        </tr>
                        <tr>
                            <td>邮箱:</td>
                            <td><input type="text" name="relemail" id="relemail" onblur="check('relemail')"></td>
                            <td>用于接受确认邮件</td>
                        </tr>
                    </table>
                </div>  
                <div class="sj">  
                    <p>提示：<br/>
                    	<i  style="margin-left: 0px;">1、丛林及非营运性闲居无发票可开，营运性闲居可在交费时直接向闲居索取。</i><br/>
                    <c:if test="${clxjmainJson.price ==0}"><i  style="margin-left: 0px;">2、订房者有了解佛教的，也有对佛教从未接触的。丛林的任何人不得强求客人对僧侣给予供养、捐款。</i><br/>
                    	<i style="margin-left: 18px;">丛林的僧侣不得向客人宣扬迷信。客人与法师结缘或拜师都是客人自愿的事，丛林任何人员不得以种种理</i><br/>
                    	<i style="margin-left: 18px;">由要求，更不得强求。如有上述情况发生，请拨打免费投诉电话：400-688-6798或：0791-88193562，</i><br/>
                    	<i style="margin-left: 18px;">也可在评价中给予反馈。</i></c:if>  
                    <c:if test="${clxjmainJson.price !=0}"><i  style="margin-left: 0px;">2、投诉请拨打免费热线：400-688-6798或：0791-88193562，也可在评价中给予反馈。</i></c:if>	
                    </p> 
                </div>   
            </div>  
            <div class="last"> 
                <p class="tte">政策说明</p>
                <ul> 
                    <li>政策和预定说明：</li>   
                    <li> <div style="color: red;margin-top: 10px; "><br/>          
                    	<i  style="margin-left: 25px;">1、预订了的房子要退，必须提前36小时，不足36小时者不能退订。退订者要及时“登录”取消预订，<br/></i><i style="margin-left: 43px;">否则系统会记录您的不良记录。</i><br/>
                    	<i  style="margin-left: 25px;">2、丛林闲居为非盈利的公益平台，不向丛林或者闲居收取任何费用。客人与丛林或闲居的结算均为<br/></i><i style="margin-left: 43px;">线下自行完成，与平台无关。 </i>      
                    	</div> </li>      
                </ul>   
            </div>
            <div class="tjdd">
                <input id="sub" type="button" value="提交订单" onclick="subForm()">
            </div>
        </div> 
        </form>
        <div class="dtm-right">
            <div class="dr-main">
                <div class="top">
                    <div><span class="one">1 </span><img src="/static/images/xj_03.jpg"> <span class="two">2</span></div>
                    <p class="special">填写订单</p><p>订单完成</p>
                </div>
                <div class="bottom">
                    <div class="df-sl">您预定了<i>1</i>间客房</div>
                    <div class="df-main">
                        <img width="245" height="111" src="${clxjBackurl }${clxjmainJson.firstImgMin }">
                        <!-- <ul>
                            <li>房   型：特惠大床房</li>
                            <li>床   型：大床1.5米</li>
                            <li>早   餐：无早</li>
                            <li>宽   带：无线/宽带[免费]</li>
                            <li>面   积：50平米</li>
                        </ul> -->
                        <hr>
                        <div>
                        <p class="jc">房费总计：</p>    
                        <input type="hidden" id="price" value="${clxjmainJson.price }"/>  
                        <p><i><em id="priceem"><c:if test="${clxjmainJson.price ==0}"><i style="font-size: 30px;">¥随缘</i></c:if><c:if test="${clxjmainJson.price !=0}"><i style="font-size: 30px;">¥${clxjmainJson.price}</i></c:if></em></i></p>
                        <div style="display: none;"><p>所有住客，已含税和服务费</p>   
                         <p>联系电话:&nbsp;&nbsp;${clxjmainJson.mobile}</p>   
                         </div>
                        </div> 
                        <hr style="margin-top: 20px;"> 
                        <c:if test="${clxjmainJson.price ==0}">
               	 <div style="margin-top: 40px;color: black;">                      
                <i style="color: red;">*</i> &nbsp;&nbsp;&nbsp;<i style="font-size: 15px;color: red;">“随缘”</i>是指订房者在丛林居住一天<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需向丛林交纳的食宿费共计20元。食与<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;僧侣一样，有的丛林每天食两餐，有的<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三餐，不食不退款。用餐时间：早餐<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：6:30；中餐：11:30；晚餐：17:00。 <br/>      
                </div>     
                </c:if>             
                    	<div style="margin-bottom: 20px;"></div>
                    </div>   
                </div>  
            </div> 
        </div> 
    </div>
</div>
<footer>
    <ul>
        <li>江西省丛林闲居投资有限公司，工业和信息化部网站备案许可证编号：赣ICP备15010915号</li>
        <li>Copyright © 2015 <a href="#">丛林闲居</a>  版权所有 3wcl.com | 客服中心：400-688-6798</li>
    </ul>
    <p><a href="#"><img src="/static/images/index_48.jpg"></a><a href="#"><img src="/static/images/index_50.jpg"></a><a href="#"><img src="/static/images/index_52.jpg"></a> <a href="#"><img src="/static/images/index_54.jpg"></a><a href="#"><img src="/static/images/index_56.jpg"></a> <a href="#"><img src="/static/images/index_58.jpg"></a>    </p>
</footer>
<script type="text/javascript" src="<%=path %>/static/js"></script>
<script type="text/javascript">
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#d5221'});//绑定元素
        laydate({elem: '#d5222'});//绑定元素
    }();
	var checks = false;
		function checkDate(time,price){ 
			var d5221 = document.getElementById("d5221").value;
			var cid = document.getElementById("cid").value;
			var em = document.getElementById("em");
			var priceem = document.getElementById("priceem");
			var total = document.getElementById("total");
			$.post("<%=path %>/clxjorder!checkOrder.action",
					   {"checkstartdate":d5221,"checkenddate":time,"cid":cid},
					  function(result){
						  if(result == null){
							  em.innerHTML = "&nbsp;&nbsp;该时段已经被人预定，请更改";
							  checks = false;
						  }
						  if(result.status=="true"||result.status==true){
							  em.innerHTML = result.message; 
							  var sum  = price*DateDiff(time,d5221);
							  if(sum==0){
								  priceem.innerHTML = "随缘";
								  total.value = 0;
								  }else{  
							  priceem.innerHTML = sum;
							  total.value = sum;}
							  
							  checks = true;
						  }else{
							  em.innerHTML = result.message;
							  checks = false;
						  }
					  },"json");
		}
		//计算天数差的函数，通用  
		   function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式  
		       var  aDate,  oDate1,  oDate2,  iDays  
		       aDate  =  sDate1.split("-")  
		       oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2006格式  
		       aDate  =  sDate2.split("-")  
		       oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
		       iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
		       if(iDays==0){
		    	   iDays=1;
		       } 
		       return  iDays  
		   }    
	function check(id){
		var isChinese = /^[\u0391-\uFFE5]+$/;
		var isMobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		var isEmail = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
		var ids = document.getElementById(id);
		switch(id)
		{
		case "checkperson":
			if(!isChinese.test(ids.value)){ 
				ids.style.border = "1px red solid";
				checks = false;
			}else{
				ids.style.border = "";
				checks = true;
			}
		  break;
		case "relperson":
			if(!isChinese.test(ids.value)){ 
				ids.style.border = "1px red solid";
				checks = false;
			}else{
				ids.style.border = "";
				checks = true;
			}
		  break;
		case "relphone":
			if(!isMobile.test(ids.value)){ 
				ids.style.border = "1px red solid";
				checks = false;
			}else{
				ids.style.border = "";
				checks = true;
			}
			  break;
		case "relemail":
			if(!isEmail.test(ids.value)){ 
				ids.style.border = "1px red solid";
				checks = false;
			}else{
				ids.style.border = "";
				checks = true;
			}
			  break;
		}
	}
	function subForm(){
		var price = document.getElementById("price").value;
		var d5221 = document.getElementById("d5221").value;
		var d5222 = document.getElementById("d5222").value;
		var sub = document.getElementById("sub");
		if(d5221==""||d5221==null||d5222==""||d5222==null){
			alert("请选择预约时间");
			checks = false;
		}else{
		checkDate(d5221,price);
		}
		if(checks){
			check("checkperson");
			if(checks){
				check("relperson");
				if(checks){ 
					check("relphone");
					if(checks){
						check("relemail");
						if(checks){
							sub.disabled = true;
							document.getElementById("orderForm").submit();
						}
					}
				}
			}
		}
	}
	</script>
</body>
</html>