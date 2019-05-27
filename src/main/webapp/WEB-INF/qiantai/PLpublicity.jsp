<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>丛林闲居-公示列表-款物发放公示</title>
    <link rel="stylesheet" href="style/cy.css">
    <link rel="stylesheet" href="style/style.css">
    <script src="js/laydate.js"></script>
    <link rel="stylesheet" href="style/laydate.css">
    <link rel="stylesheet" href="js/molv/laydate.css">
    
<style rel="stylesheet">  
.pagination {font-family: Tahoma;font-size: 12px;height: 22px;margin: 0px 100px;text-align: center;}  
.pagination a,.page-cur,.page-start,.page-end,.page-disabled,.page-skip {  
height:22px;line-height:22px;margin:0 3px 0 0;text-align:center;vertical-align:middle;white-space:nowrap;}  
.pagination input {border-width: 1px;}  
.page-start, .pagination a, .page-end, .page-disabled {border: 1px solid #CCCCCC;padding: 0 5px;}  
.pagination a {text-decoration: none;}  
.page-cur {background-color: #FFEDE1;border: 1px solid #FD6D01;color: #FD6D01;font-weight: 700;padding: 0 5px;}  
.page-disabled {color: #CCCCCC;}  
.page-skip {color: #666666;padding: 0 3px;}  
</style> 
</head>

<body>
<div>
    <!--首页TOP-->
    <div class="yc-txdd1">
         
        <!--首页banner-->
         <jsp:include  page="head.jsp" />
                      <script type="text/javascript">
function Alllogin(){
	window.location.href = "login.jsp?returnurl=/PLpublicity.jsp";
}
function loginOut(){
	window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/PLpublicity.jsp";
}
 </script>
        <!--首页轮播图-->


        <!--用车-填写订单-->
        <div class="yc-txdd">
            <div class="yc-mbx">
                <p>当前位置：<a href="index.jsp" class="ll">丛林闲居网</a> > <a href="FoundIndex.jsp" class="ll">基金会</a> > <a href="#"
                                                                                               class="xz">款物发放公示</a></p>
            </div>
            <div><img src="images/jjh_03.jpg"></div>
            <div class="jjh-index">
                <div class="jjh-index-left">
                    <div class="kwff-p1">
                        <p class="kwff-p11">公示列表</p>
                        <p class="kwff-p12"><span class="qzfze">款物发放公示</span><a href="PLlist.jsp" ><span>月底支出查询</span></a> <a href="DonationLove.jsp"><span>爱心捐赠明细</span></a></p></p>
                    </div>
  
                    <div class="jjh-jzfz">
                        <p><span>捐款人：<input type="text" class="esg78" id="donationname" name="grant.donationname"></span><span>受助人：<input type="text" id="recipients" class="esg" name="grant.recipients"></span></p>
                        <p><span>捐款时间：<input name="startTime" class="laydate-icon ts" id="demo1" value="" style="width:95px;">&nbsp;&nbsp;到&nbsp;<input name="endTime" class="laydate-icon" id="demo2" value="" style="width:95px;"> </span><span><input type="button" value="开始查询"  class="esg2"  id="cx"></span></p>
                    </div>
                    <p class="zg">总计<span id="c4"></span>条数据10/页</p>
                    <div class="jzfj-gslb">
						<table border="1px solid #cccccc" style="border-bottom:none">
							 <thead>
                                <td>序号</td>
                                <td>捐款人</td>
                                <td>物品</td>
                                <td>数量</td>
                                <td>价值</td>
                                <td>使用指向</td>
                                <td>受助人	</td>
                                <td>捐赠时间</td>
                            </thead>                         
						</table>
						
						 <table  border="1px solid #cccccc" id="commentAll">   

                          </table>  
						
                    </div>
                    <div class="fenye">
						<div id="pageNav"></div> 
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


</div>
<script src="js/jquery.min.js"></script>
<script src="js/index.js"></script>
<script type="text/javascript">
!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#demo1'});//绑定元素
	laydate({elem: '#demo2'});//绑定元素
	}();
getCount();
$("#cx").mousedown(function(){
	getCount();
  });
var countAll;
function getCount(){
	$.ajax({  
        type : "post",  
         url : "<%=path%>/grant!selGrantCount.action",  
         data: {"grant.donationname":$("#donationname").val(),"grant.recipients":$("#recipients").val(),"startTime":$("#demo1").val(),"endTime":$("#demo2").val()},
         dataType: "json",
         async : false,   
         success : function(results){  
        	 countAll = results.countAll;   
			 document.getElementById("c4").innerHTML = countAll; 
			 testPage(1); 
         }  
    });
}        
function InitTable(pageIndex) {  
	document.getElementById("commentAll").innerHTML="";
	$.ajax({  
        type : "post",  
         url : "<%=path%>/grant!selGrant.action",   
         data : {"grant.donationname":$("#donationname").val(),"grant.recipients":$("#recipients").val(),"pageIndexAll":+pageIndex,"startTime":$("#demo1").val(),"endTime":$("#demo2").val()},
         dataType: "json",   
         async : false,   
         success : function(results){ 
               for(var i=0;i<results.grants.length;i++){
            	   var a=results.grants[i];
            	   document.getElementById("commentAll").innerHTML += "<tr><td width='79'>"+((pageIndex-1)*10+(i+1))+"</td><td width='117'>"+a.donationname+"</td><td width='79'>"+a.goods+"</td><td width='79'>"+a.num+"</td><td width='79'>"+a.worthless+"</td><td width='155'>"+a.useto+"</td><td width='117'>"+a.recipients+"</td><td width='157'>"+a.donationTime+"</td></tr>";
               }   
         }      
    });     
} 

function testPage(curPage){ 
        supage('pageNav','testPage','',curPage,countAll,10);   
        InitTable(curPage); 
}

function deleteRows(tabid){
	var tb = document.getElementById(tabid);
    var rowNum=tb.rows.length;
    for (i=0;i<rowNum;i++) 
    {
        tb.deleteRow(i);
        rowNum=rowNum-1;
        i=i-1;
    }
}
/**  
  
 * @param {String} divName 分页导航渲染到的dom对象ID 
 * @param {String} funName 点击页码需要执行后台查询数据的JS函数 
 * @param {Object} params 后台查询数据函数的参数，参数顺序就是该对象的顺序，当前页面一定要设置在里面的 
 * @param {String} total 后台返回的总记录数 
 * @param {Boolean} pageSize 每页显示的记录数，默认是10 
 */  
 function supage(divId, funName, params, curPage, total, pageSize){  
	    var output = '<div class="pagination" style="margin-top:0px;margin-left:-60px;width:320px;">';    
	    var pageSize = parseInt(pageSize)>0 ? parseInt(pageSize) : 10;  
	    if(parseInt(total) == 0 || parseInt(total) == 'NaN'){
	    	$('#pageNav').hide();
	    	  return ;
		  }
	    var totalPage = Math.ceil(total/pageSize);  
	    var curPage = parseInt(curPage)>0 ? parseInt(curPage) : 1;  
	    //如果页数小于1，则隐藏页数  
	    if(total-pageSize<=0){
			$('#pageNav').hide();
		}else{
			$('#pageNav').show();
		}
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
function subForm(){
	var content = document.getElementById("content");
	if(content.value.length<15){
		content.style.border = "red solid 1px";
		}else{ 
			content.style.border = "";
		document.getElementById("commentForm").submit(); 
		}
}
</script>
</body>
</html>