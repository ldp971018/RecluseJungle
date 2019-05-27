<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>丛林闲居-基金会-救助扶助公示列表</title>
    <link rel="stylesheet" href="style/cy.css">
    <link rel="stylesheet" href="style/style.css">
    <script src="js/laydate.js"></script>
    <link rel="stylesheet" href="style/laydate.css">
    <link rel="stylesheet" href="js/molv/laydate.css">
</head>
<body>
    <!--首页TOP-->
    <div class="yc-txdd1">
        
        <!--首页banner--> 
         <jsp:include  page="head.jsp" />   
	<script type="text/javascript">
	function Alllogin(){
		window.location.href = "login.jsp?returnurl=/FoundJzfzlist.jsp"; 
	} 
	function loginOut(){
		window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/FoundJzfzlist.jsp";
	}
	 </script>
	
        <!--用车-填写订单-->
        <div class="yc-txdd">
            <div class="yc-mbx">
                <p>当前位置：<a href="index.jsp" class="ll">丛林闲居网</a> > <a href="FoundIndex.jsp" class="ll">基金会</a> > <a href="#"
                                                                                               class="xz">救助/扶助公示列表</a></p>
            </div>
            <div><img src="images/jjh_03.jpg"></div>
            <div class="jjh-index">
                <div class="jjh-index-left">
                    <p class="fzym-p">救助/扶助公示列表</p>
                    <!--<div class="jjh-jzfz">-->
                        <!--<p><span>公示列表：<select class="esg"><option>救助公示列表</option><option>救助公示列表</option><option>救助公示列表</option></select></span><span>申请人姓名：<input type="text" class="esg"></span></p>-->
                        <!--<p><span>申请金额：<input type="text"class="esg1"> &nbsp;&nbsp; 到 &nbsp;&nbsp;  <input type="text"class="esg1"> </span><span><input type="submit" value="开始查询" class="esg2"></span></p>-->
                    <!--</div>--> 
                    <div class="jjh-jzfz"> 
                        <p><span>公示类型：<select class="esg" id="applystatus"><option value="4" selected="selected">全部</option><option value="1">初审</option><option value="2">终审</option></select></span><span>申请人姓名：<input id="name" type="text" class="esg"></span></p>
                        <p><span>申请金额：<input id="applymoney1" type="text"class="esg1"> &nbsp;到 &nbsp;<input id="applymoney2" type="text"class="esg1"> </span><span><input type="submit" value="开始查询" class="esg2" onclick="getCount()"></span></p>
                    </div>
                    <p class="zg">总计<i><em id="count"></em></i>条数据，10/页</p> 
                    <div class="jzfj-gslb">
                        <table border="1px solid #cccccc" id="tab">
                        </table>
                    </div>
                    <div class="fenye">
                        <div id="pageNav" align="center"></div>   
                    </div> 


                </div>
                <div class="jjh-index-right">
                    <a href="FoundRescue.jsp"><div>
                        <img src="images/brower_03.jpg" class="enheng">
                        <p>我要求助</p>
                        <img src="images/brower_07.jpg" >
                    </div></a>
                    <a href="DonationLove.jsp"><div>
                        <img src="images/brower_11.jpg" class="enheng">
                        <p>我要查询</p>
                        <img src="images/brower_07.jpg">
                    </div></a>
                    <a href="FoundDonations.jsp"><div>
                        <img src="images/brower_15.jpg" class="enheng" style="margin-top: 15px;">
                        <p>我要捐款</p>
                        <img src="images/brower_07.jpg">
                    </div></a>
                    <a href="UserPquery.jsp"><div>
                        <img src="images/brower_19.jpg" class="enheng" style="margin-top: 23px;">
                        <p>求助进度</p>
                        <img src="images/brower_07.jpg">
                    </div></a>
                    <a href="FoundJzfzlist.jsp"><div>
                        <img src="images/brower_23.jpg" style="margin-top: 16px;">
                        <p>公示列表</p>
                    </div></a>
                </div>



            </div>


        </div>
        <%@ include  file="bottom.jsp"%>
    </div>


<script src="js/jquery.min.js"></script>
<script src="js/index.js"></script>
<script type="text/javascript">
getCount();
var count; 
function getCount(){
	$.ajax({  
        type : "post",  
         url : "<%=path%>/helpinfo!selHelpinfoCount.action",  
         data: {"helpinfo.applystatus":$("#applystatus").val(),"helpinfo.name":$("#name").val(),"applymoney1":$("#applymoney1").val(),"applymoney2":$("#applymoney2").val()},
         dataType: "json",
         async : false,   
         success : function(results){  
        	 count = results.helpinfoCount.count;
        	 document.getElementById("count").innerHTML = count; 
        	 if(count>10){  
        	 testPage(1);
        	 }else{
        		 document.getElementById("pageNav").innerHTML = "";   
        		 InitTable(1); 
            	 }
         }   
    });
}
function InitTable(curPage){
	var t1=document.getElementById("tab"); 
	var rowNum=t1.rows.length; 
	if(rowNum>0) 
	{ 
	for(i=0;i<rowNum;i++) 
	{ 
	t1.deleteRow(i); 
	rowNum=rowNum-1; 
	i=i-1; 
	}  
	} 
	var innerTD1 = "<tr style='font-weight: bold;font-size: 14px;background-color: #f8f6f4;'><td> 申请人姓名</td><td>申请类型</td><td>身份证号</td><td>是否享受低保</td><td>拟申请救助金额</td><td>主要困难概述</td><td>审核状态</td><td>查看详情</td></tr>";
	$(innerTD1).appendTo("#tab");     
	$.ajax({  
        type : "post",  
         url : "<%=path%>/helpinfo!selHelpinfo.action",  
         data: {"helpinfo.applystatus":$("#applystatus").val(),"helpinfo.name":$("#name").val(),"applymoney1":$("#applymoney1").val(),"applymoney2":$("#applymoney2").val(),"index":curPage},
         dataType: "json",
         async : false,   
         success : function(results){  
             if(results.helpinfos.length>0){
                 for(var i=0;i<results.helpinfos.length;i++){
						var name = results.helpinfos[i].name;//申请人名字
						var idcard = results.helpinfos[i].idcard;//身份证号码
						var basicliving = results.helpinfos[i].basicliving;//是否享受低保
						if(basicliving==1){
							basicliving="是";
						}else{
							basicliving="否";
						}
						var applymoney = results.helpinfos[i].applymoney;//拟申请救助金额
						var applycontent = results.helpinfos[i].applycontent;//主要困难概述
						var applyStatus = results.helpinfos[i].applystatus;//审核状态 
						var id = results.helpinfos[i].id;//求助/救助id
						if(applyStatus=='1'){ 
							applyStatus ="初审通过";
						}else{
							applyStatus ="终审通过";
						}
						var applytype = results.helpinfos[i].applytype==1?"求助":"救助";  
						var selAll =  "<a href='FoundjzfzDetailed.jsp?helpinfo.id="+id+"'>查看详情</a>";
						var innerTD = "<tr><td>"+name+"</td><td>"+applytype+"</td><td>"+idcard+"</td><td>"+basicliving+"</td><td>"+applymoney+"</td><td>"+applycontent+"</td><td>"+applyStatus+"</td><td>"+selAll+"</td></tr>"
						$(innerTD).appendTo("#tab"); 
	                 }
                }else{
                	 var innerTD = "<tr><td  colspan='7'>暂时无救助/求助哦</td></tr>";  
                	 $(innerTD).appendTo("#tab");
                }
         }   
    });
}
function testPage(curPage){ 
	InitTable(curPage); 
    supage('pageNav','testPage','',curPage,count,10);    
}
function supage(divId, funName, params, curPage, total, pageSize){  
    var output = '<div class="pagination" style="margin-top:0px;margin-left:-60px;width:320px;">';    
    var pageSize = parseInt(pageSize)>0 ? parseInt(pageSize) : 10;  
    if(parseInt(total) == 0 || parseInt(total) == 'NaN') return;  
    var totalPage = Math.ceil(total/pageSize);  
    var curPage = parseInt(curPage)>0 ? parseInt(curPage) : 1;  
      
    //从参数对象中解析出来各个参数   
    var param_str = '';  
    if(typeof params == 'object'){  
        for(o in params){  
            if(typeof params[o] == 'string'){  
               param_str += '\'' + params[o] + '\',';  
            }  
            else{  
               param_str += params[o] + ',';  
            }  
        }  
        //alert(111);  
    }  
    //设置起始页码  
    if (totalPage > 10) {  
        if ((curPage - 5) > 0 && curPage < totalPage - 5) {  
            var start = curPage - 5;  
            var end = curPage + 5;  
        }  
        else if (curPage >= (totalPage - 5)) {  
            var start = totalPage - 10;  
            var end = totalPage;  
        }  
        else {  
            var start = 1;  
            var end = 10;  
        }  
    }  
    else {  
        var start = 1;  
        var end = totalPage;  
    }  
      
    //首页控制  
    if(curPage>1){  
        output += '<a href="javascript:'+funName+'(' + param_str + '1);" title="第一页" class="page-first">«</a>';  
    }  
    else  
    {  
        output += '<span class="page-disabled">«</span> ';  
    }  
    //上一页菜单控制  
    if(curPage>1){  
        output += '<a href="javascript:'+funName+'(' + param_str + (curPage-1)+');" title="上一页" class="page-previous">‹</a>';  
    }  
    else{  
        output += '<span class="page-disabled">‹</span>';  
    }  
      
    //页码展示  
    for (i = start; i <= end; i++) {  
        if (i == curPage) {  
            output += '<a href="javascript:;" class="page-cur">' + curPage + '</a>';  
        }  
        else {  
            output += '<a href="javascript:'+funName+'(' + param_str + i + ');">' + i + '</a>';  
        }  
    }  
    //下一页菜单控制  
    if(totalPage>1 && curPage<totalPage){  
        output += '<a title="下一页" href="javascript:'+funName+'('+param_str + (curPage+1)+');" class="page-next">›</a>';  
    }  
    else{  
        output += '<span class="page-disabled">›</span>';  
    }  
    //最后页控制  
    if(curPage<totalPage){  
        output += '<a title="最后页" href="javascript:'+funName+'('+param_str + totalPage+');" class="page-end">»</a>';  
    }  
    else{  
        output += '<span class="page-disabled">»</span>';  
    }  
      
    output += '</div>';  
    //渲染到dom中  
    document.getElementById(divId).innerHTML = output;  
};  
</script>
</body>
</html>