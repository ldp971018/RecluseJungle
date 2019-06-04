<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>丛林闲居-基金会-救助扶助公示列表</title>
    <script src="/static/layui/jquery.min.js"></script>
    <script src="/static/layui/layui.all.js" charset="utf-8"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>

<body>
<!--首页TOP-->
<div class="yc-txdd1">

    <!--首页banner-->
    <jsp:include page="head.jsp"/>


    <!--用车-填写订单-->
    <div class="yc-txdd">
        <div class="yc-mbx">
            <p>当前位置：<a href="/index" class="ll">丛林闲居网</a> > <a href="/foundIndex" class="ll">基金会</a> > <a href="#"
                                                                                                          class="xz">救助/扶助公示列表</a>
            </p>
        </div>
        <div><img src="/static/images/jjh_03.jpg"></div>
        <div class="jjh-index">
            <div class="jjh-index-left">
                <p class="fzym-p">救助/扶助公示列表</p>
                <!--<div class="jjh-jzfz">-->
                <!--<p><span>公示列表：<select class="esg"><option>救助公示列表</option><option>救助公示列表</option><option>救助公示列表</option></select></span><span>申请人姓名：<input type="text" class="esg"></span></p>-->
                <!--<p><span>申请金额：<input type="text"class="esg1"> &nbsp;&nbsp; 到 &nbsp;&nbsp;  <input type="text"class="esg1"> </span><span><input type="submit" value="开始查询" class="esg2"></span></p>-->
                <!--</div>-->
                <div class="jjh-jzfz">
                    <p><span style="float:left;">公示类型：<select class="esg" id="applystatus">
                        <option value="" selected="selected">全部</option>
                         <option value="0">审核中</option>
                        <option value="1">初审</option>
                        <option value="2">终审</option>
                        <option value="3">审核不通过</option>
                    </select></span>
                        <span style="float:left;">申请人姓名：</span><input id="name" type="text" style="margin-top: 12px"
                                                                      class="esg"></p>
                    <p><span style="float:left;">申请金额：<input id="applymoney1" type="text" class="esg1">
                        &nbsp;到 &nbsp;<input id="applymoney2" type="text" class="esg1"> </span>
                        <span style="float:left;">&emsp;
                            <input type="submit" class="layui-btn layui-btn-normal layui-btn-xm" value="开始查询"
                                   lass="esg2" style="border-radius: 6px" onclick="getFoundJzfzlist()">
                        </span>
                    </p>
                </div>
                <div class="jzfj-gslb" style="width: 885px;text-align: center">
                    <table class="layui-hide" id="tables" lay-filter="tables"></table>
                </div>


            </div>
            <div class="jjh-index-right">
                <a href="/foundRescue">
                    <div>
                        <img src="<%=path%>/static/images/brower_03.jpg" class="enheng">
                        <p>我要求助</p>
                        <img src="<%=path%>/static/images/brower_07.jpg">
                    </div>
                </a>
                <a href="/donationLove">
                    <div>
                        <img src="<%=path%>/static/images/brower_11.jpg" class="enheng">
                        <p>我要查询</p>
                        <img src="<%=path%>/static/images/brower_07.jpg">
                    </div>
                </a>
                <a href="/foundDonations">
                    <div>
                        <img src="<%=path%>/static/images/brower_15.jpg" class="enheng" style="margin-top: 15px;">
                        <p>我要捐款</p>
                        <img src="<%=path%>/static/images/brower_07.jpg">
                    </div>
                </a>
                <a href="showAllHelpinfo">
                    <div>
                        <img src="<%=path%>/static/images/brower_19.jpg" class="enheng" style="margin-top: 23px;">
                        <p>求助进度</p>
                        <img src="<%=path%>/static/images/brower_07.jpg">
                    </div>
                </a>
                <a href="/foundJzfzlist">
                    <div>
                        <img src="<%=path%>/static/images/brower_23.jpg" style="margin-top: 16px;">
                        <p>公示列表</p>
                    </div>
                </a>
            </div>


        </div>


    </div>
    <%@ include file="bottom.jsp" %>
</div>

<script type="text/html" id="bar"><%-- href="/foundJzfzDetailed?id=52"--%>
<a class="layui-btn layui-btn-xs" lay-event="detail">查看详情</a>
</script>

<script type="text/javascript">
    var tableIns;
    layui.use('table', function () {
        var table = layui.table;
        tableIns = table.render({
            elem: '#tables'
            , url: '/selFoundJzfzlist'
            , cols: [[
                {field: 'id', title: 'ID', hide: true}
                , {field: 'name', title: '申请人姓名'}
                , {field: 'applytype', align: 'center', title: '申请类型'}
                , {field: 'idcard', align: 'center', title: '身份证号'}
                , {field: 'basicliving', align: 'center', title: '是否享受低保'}
                , {field: 'applymoney', align: 'center', title: '拟申请救助金额'}
                , {field: 'applycontent', align: 'center', title: '主要困难概述'}
                , {field: 'applystatus', align: 'center', title: '审核状态'}
                , {fixed: 'right', align: 'center', title: "查看详情", toolbar: '#bar'}
            ]]
            , method: "post"
            , page: true
            , limits: [5, 10, 20, 30, 50, 80, 100]
            , limit: 10
            , done: function () {
                $("[data-field='applytype']").children().each(function () {
                    if ($(this).text() == 'true') {
                        $(this).text("救助")
                    } else if ($(this).text() == 'false') {
                        $(this).text("扶助")
                    }
                });
                $("[data-field='basicliving']").children().each(function () {
                    if ($(this).text() == 'true') {
                        $(this).text("是")
                    } else if ($(this).text() == 'false') {
                        $(this).text("否")
                    }
                });
                $("[data-field='applystatus']").children().each(function () {
                    if ($(this).text() == '0') {
                        $(this).text("审核中")
                    } else if ($(this).text() == '1') {
                        $(this).text("初审通过")
                    } else if ($(this).text() == '2') {
                        $(this).text("终审通过")
                    } else if ($(this).text() == '3') {
                        $(this).text("审核不通过")
                    }
                });
            }
        });

        //监听行工具事件
        table.on('tool(tables)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                window.location.href = "/foundJzfzDetailed?id=" + data.id;
            }
        });
    });

    function getFoundJzfzlist() {
        var applystatus = $("#applystatus");
        var name = $("#name");
        var applymoney1 = $("#applymoney1");
        var applymoney2 = $("#applymoney2");
        //执行重载
        tableIns.reload({
            page: {
                curr: 1,
                limit: 10
            }
            , where: {
                applystatus: applystatus.val(),
                name: name.val(),
                applymoney1: applymoney1.val(),
                applymoney2: applymoney2.val(),
            }

        });
    }
</script>

</body>
</html>