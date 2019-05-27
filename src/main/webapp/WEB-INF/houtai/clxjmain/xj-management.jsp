<%@page language="java" pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>基本表格模板</title>
<!--框架必需start-->
<script type="text/javascript" src="<%=path%>/libs/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/libs/js/framework.js"></script>
<link href="<%=path%>/libs/css/import_basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" id="skin" prePath="<%=path%>/" scrollerY="false"/>
<link rel="stylesheet" type="text/css" id="customSkin"/>
<!--框架必需end-->


<!--数据表格start-->
<script src="<%=path%>/libs/js/table/quiGrid.js" type="text/javascript"></script>
<!--数据表格end-->

<!-- 表单start -->
<script src="<%=path%>/libs/js/form/form.js" type="text/javascript"></script>
<!-- 表单end -->

</head>
<body>
	<table width="100%" >
	<tr>
		<!--右侧区域start-->
		<td width="100%" class="ver01" >
			<div class="box2" panelTitle="查询" showStatus="false">
				<form action="<%=path%>/clxjmain!getclxjmainOfPager.action" id="queryForm" method="post">
				<table>
					<tr>
						<td>名称：</td>
						<td>
							<input type="text" id="name" name="clxjmain.name"/>
							<input type="text" style="width:2px;display:none;"/>
						</td>
						<td>地址类型：</td>
						<td>
							<select name="clxjmainJson.type1" id="type1">
							<option value="2">选择所有</option>
								<option value="1">国内</option>
								<option value="0">国外</option>
							</select>
							<input type="text" style="width:2px;display:none;"/>
						</td>
						<!-- <td>住房类型：</td>
						<td>
							<select name="clxjmainJson.type2" id="type2">
							<option value="2">选择所有</option>
								<option value="1">丛林</option>
								<option value="0">闲居</option>
							</select>
							<input type="text" style="width:2px;display:none;"/>
						</td> -->
						<td>审核状态：</td>
						<td>
							<select name="clxjmain.checkStatus" id="checktatus">
								<option value="3">选择所有</option>
								<option value="2">审核通过</option>
								<option value="0">正在审核</option>
								<option value="1">审核不通过</option>
							</select>
							<input type="text" style="width:2px;display:none;"/>
						</td>
						<td><button type="button" onclick="searchHandler()"><span class="icon_find">查询</span></button></td>
						<td><button type="button" onclick="resetSearch()"><span class="icon_reload">重置查询</span></button></td>
					</tr>
				</table>
				</form>  
				</div>
				<div class="padding_right5">
					<div id="dataBasic"></div>
				</div>
		</td>
		<!--右侧区域end-->
	</tr>
	</table>
<script type="text/javascript">
	
	//定义grid
	var grid = null;
	//初始化函数
	function initComplete(){
		//当提交表单刷新本页面时关闭弹窗
		top.Dialog.close();
		
		//初始化grid组件
		initGrid();
		
		//监听查询框的回车事件
		 $("#searchInput").keydown(function(event){
		 	if(event.keyCode==13){
				searchHandler();
			}
		 })
	}
	
	//初始化Grid处理
	function initGrid() {
		grid = $("#dataBasic").quiGrid({
			columns:[
				{ display: '名称', name: 'name',     align: 'left', width: "20%"},
			    { display: '地址类型', name: 'type1', 	 align: 'left', width: "10%"},
			    { display: '住址类型', name: 'type2', align: 'left', width: "10%"},
			    { display: '地址', name: 'belongCity', 	 align: 'left',  wdith:"20%"} ,
			    { display: '价格', name: 'price', 	 align: 'left',  wdith:"10%"} ,
			    { display: '申请状态', name: 'checkStatus', 	 align: 'left',  wdith:"20%"} ,
			    { display: '操作', isAllowHide: false, align: 'left', width:"10%",
						 render: function (rowdata, rowindex, value, column){
			    	if(rowdata.toDelete||rowdata.toDelete=="true"){   
						 	return '<div class="padding_top4 padding_left5">'
                       			 + '<span class="img_list hand" title="查看" onclick="onView(' + rowdata.id + ')"></span>'
                        		 + '<span class="img_edit hand" title="修改" onclick="onEdit(' + rowdata.id + ')"></span>' 
                       			 + '<span class="img_delete hand" title="删除" onclick="onDelete(' + rowdata.id+','+rowindex + ')"></span>'
                   	 			 + '</div>';
						 }else{
							 return '<div class="padding_top4 padding_left5">'
	                         	 + '<span class="img_list hand" title="查看" onclick="onView(' + rowdata.id + ')"></span>'
	                     	 	 + '</div>'; 
							 }
		                 }
		            }
			  ],
		 url: '<%=path%>/clxjmain!getclxjmainOfPager.action?clxjmainJson.type2='+'0'+'&joinid='+'${loginedUser.id}', sortName: 'id',rownumbers:true,checkbox:true,
         height: '100%', width:"100%",pageSize:10,
        
         toolbar:{
        	 items:[
        		  {text: '新增', click: addUnit,    iconClass: 'icon_add'},
        		  { line : true },
        		  {text: '批量删除', click: deleteUnit, iconClass: 'icon_delete'},
        		  { line : true }/* ,
        		  {text: '导入', click: showImportDialog, iconClass: 'icon_import'},
        		  { line : true },
        		  {text: '导出当前页', click: exportPageData, iconClass: 'icon_export'},
        		  { line : true },
        		  {text: '导出全部', click: exportTotalData, iconClass: 'icon_export'} */
        		]
         	}
		});
	}
	
	
	//新增
	function addUnit() {
		top.Dialog.open({
				URL:"<%=path%>/clxjmain/xj-management-content.jsp",
				Title:"添加",Width:800,Height:550}); 
	}
	//查看
	function onView(rowid){
		top.Dialog.open({
			URL:"<%=path%>/clxjmain!getclxjmainOfId.action?clxjmain.id=" + rowid,
			Title:"查看",Width:800,Height:550});
	}
	//修改	
	function onEdit(rowid){
		top.Dialog.open({
			URL:"<%=path%>/clxjmain!getclxjmainOfId.action?isupdate=1&clxjmain.id=" + rowid,
			Title:"修改",Width:850,Height:550}); 
	}
	//删除	
	function onDelete(rowid,rowidx){
		top.Dialog.confirm("确定要删除该记录吗？",function(){
		  	//删除记录
		  	$.post("<%=path%>/clxjmain!deleteClxjmain.action",
		  			{"ids":rowid},
		  			function(result){
		  				handleResult(result.status);
					},"json");
					//刷新表格数据 
					grid.loadData();
			});
	}
		
		
	//批量删除
	function deleteUnit() {
		var rows = grid.getSelectedRows();
		var rowsLength = rows.length;
		
		if(rowsLength == 0) {
			//top.Dialog.alert("请选中要删除的记录!");
			//return;
		}
		top.Dialog.confirm("确定要删除吗？",function(){
			$.post("<%=path%>/clxjmain!deleteClxjmain.action", 
					//获取所有选中行
					getSelectIds(grid),
					function(result){
						handleResult(result.status);
					},
					"json");
		});
	}
	
	
	//删除后的提示
	function handleResult(result){
		if(result == 1){
			top.Dialog.alert("删除成功！",null,null,null,1);
			grid.loadData();
		}else{
			top.Dialog.alert("删除失败！");
		}
	}
	
	//获取所有选中行获取选中行的id 格式为 ids=1&ids=2 
	function getSelectIds(grid) {
		var selectedRows = grid.getSelectedRows();
		var selectedRowsLength = selectedRows.length;
		var ids = "";
		for(var i = 0;i<selectedRowsLength;i++) {
			ids += selectedRows[i].id + ",";
		}
		return {"ids":ids}; 
	}
	
	//导入
	function showImportDialog(){
		top.Dialog.open({Title:"导入用户信息", 
						Message:"请上传excel文件", 
						URL:"<%=path%>/sample/unit/uploadFile.jsp?type=1",
						Width:350,Height:130});
	}
	
	//导出本页
	function exportPageData(){
		exportData(true);
	}
	
	//导出全部
	function exportTotalData(){
		exportData(false);
	}
	
	//导出处理
	function exportData(isPage){
		var pageNo = grid.options.page;
		var pagerSize = grid.options.pageSize;;
		var sort = grid.options.sortName;
		var direction = grid.options.sortOrder;
		var parentid = $("#parentId").val();
		var userName = $("#userName").val();
		var url = "<%=path%>/users!exportData.action";
		if(isPage){
			url += "?pager.pageSize=" + pagerSize;
			url += "&pager.pageNo=" + pageNo;
			url += "&sort=" + sort;
			url += "&direction=" + direction;
			url += "&isPage=1";
		}else{
			url += "?isPage=0";
		}
		url += "&parentId=" + parentid;
		url += "&userinfor.userName" + userName;
		
		window.location = url;
	}
	
	
	
    
    //查询
    function searchHandler(){
    	 var query = $("#queryForm").formToArray(); 
		 grid.setOptions({ params : query});
		 //页号重置为1
		 grid.setNewPage(1);
		//刷新表格数据 
		grid.loadData();
    }
    
    //重置查询
    function resetSearch(){
    	$("#queryForm")[0].reset();
		searchHandler();
    }
    
    //刷新表格数据并重置排序和页数
    function refresh(isUpdate){
    	if(!isUpdate){
    		//重置排序
        	grid.options.sortName='userId';
        	grid.options.sortOrder="desc";
        	//页号重置为1
    		grid.setNewPage(1);
    	}
    	
    	grid.loadData();
    }
	
	//处理高度自适应，每次浏览器尺寸变化时触发
	function customHeightSet(contentHeight){
		$(".cusBoxContent").height(contentHeight-55)
	}
</script>	
</body>
</html>