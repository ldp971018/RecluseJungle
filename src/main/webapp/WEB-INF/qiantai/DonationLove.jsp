<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/layui/layui.js" charset="utf-8"></script>
<link rel="stylesheet" href="/static/layui/css/layui.css">
<style>
    .money {
        border-radius: 3px;
        background-color: rgb(74, 184, 245);
        display: inline-block;
        height: 24px;
        width: 24px;
    }
</style>

<body onload="nowTime();flush();">
<div>
    <!--首页TOP-->
    <div class="yc-txdd1">

        <!--首页banner-->
        <jsp:include page="head.jsp"/>

        <!--首页轮播图-->

        <!--用车-填写订单-->
        <div class="yc-txdd">
            <div class="yc-mbx">
                <p>当前位置：<a href="index.jsp" class="ll">丛林闲居网</a> > <a href="/foundIndex" class="ll">基金会</a> > <a
                        href="#"
                        class="xz">爱心捐赠明细</a></p>
            </div>
            <div><img src="/static/images/jjh_03.jpg"></div>
            <div class="jjh-index">
                <div class="jjh-index-left">
                    <div class="kwff-p1">
                        <p class="kwff-p11">公示列表</p>
                        <p class="kwff-p12"><a href="/pLpublicity"><span>款物发放公示</span></a> <a
                                href="/pLlist"><span>月底支出查询</span></a> <a href="donationLove"><span
                                class="qzfze">爱心捐赠明细</span></a></p>
                    </div>
                    <div class="jjh-jzfz1">
                        <div><p><span>捐款姓名：&nbsp; <input id="donationname" type="text" class="esg21"
                                                         name="donationname" size=""></span></p>
                            <p style="text-align:left"><span style="float: left">捐款时间：&nbsp;&nbsp;</span>
                                <input type="text" class="layui-input" id="donationtime" placeholder="yyyy-MM-dd"
                                       name="donationtime" style="width:228px;border-radius: 5px;">
                                <%--<input name="donationtime" class="laydate-icon" id="donationtime" style="width:210px;"/>--%>
                            </p>
                        </div>
                        <div><input type="submit" value="开始查询" class="esg31" onclick="getDonations()"/></div>
                    </div>
                    <div class="qxqz">
                        <p>截止 <span id="nowTime"></span>&nbsp;捐款总额为（￥）:&emsp;下次刷新倒计时:<span
                                id="flushTime"></span>&nbsp;<input
                                type="button" value="刷新" class="layui-btn layui-btn-normal layui-btn-xs"
                                onclick="flush()"></p>
                        <br>
                        <div id="mon" style="text-align: center"></div>

                    </div>
                    <div class="jzfj-gslb" style="text-align: center;width: 885px">
                        <table class="layui-hide" id="table"></table>
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
                    <a href="/userPquery">
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
    <div class="tcc none">
        <div class="cgxd1">
            <div class="cgxd-main">
                <p class="xdcg"><img src="/static/images/xdcg.png"> <img src="/static/images/14_01.png" class="close">
                </p>

                <p class="ddbh">订单编号：<i>WO20121015141125</i> [请牢记您的订单编号]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单总价：<i>9800元</i>
                    （该订单属于线下支付类型）</p>

                <p class="fhdd">您可以：<a href="#" class="fh">返回我的订单</a><a href="#" class="jx">继续预定用车</a>（如有疑问请联系丛林闲居客服QQ:88888888）
                </p>

                <p class="wxts"><i>*温馨提示：</i>IE6.0及更低版本浏览器用户请检查您的浏览器是否支持128位密钥长度，如果不支持，请升级您的浏览器（<span>查看如何检查和升级方案</span>）
                </p>
            </div>
        </div>
    </div>
    <div class="tcc1 none">
        <div class="cgxd2">
            <div class="cgxd-main">
                <p class="yzsj">
                    验证手机
                </p>

                <div>
                    <p class="sjh"><input type="text" placeholder="手机号"></p>

                    <p class="tpyxm"><input type="text" placeholder="图片验证码"><img src="/static/images/yzm_03.png"></p>

                    <p class="tpyxm"><input type="text" placeholder="手机验证码"><a href="#">获取验证码</a></p>

                    <p><i><a href="#">收不到验证码？重新再发一次</a> </i></p>

                    <p><input type="submit" value="确&nbsp;&nbsp;定"></p>

                    <p class="dlc"><i><a href="#">使用本站帐号登录</a></i></p>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var flushTime = 60;
    var flush = function flush() {
        flushTime = 60;
        $.ajax({
            url: "/selDonationLoveCount",
            async: false,
            success: function (result) {
                var money = "";
                var countMoney = result.msg;
                for (var i = 0; i < countMoney.length; i++)
                    money += "<span class=\"money\"><font color=\"white\" size=4>&nbsp;" + countMoney[i] + "&nbsp;</font></span>&nbsp;";
                $("#mon").empty();
                $("#mon").html(money);
            }
        })
    }

    function nowTime() {
        var date = new Date();
        var time = "" + date.getFullYear() + "-" + date.getMonth() + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        $("#nowTime").html("<font color='red'>&nbsp;" + time + "&nbsp;</font>");
        if (flushTime <= 0) {
            flushTime = 60;
            flush();
        }
        $("#flushTime").html("&nbsp;<font color='red'>" + flushTime + "</font>&nbsp;")
        flushTime--;

        setTimeout(nowTime, 1000);
    }


</script>

<script>
    var tableIns;
    layui.use(['table', 'laydate'], function () {
        var table = layui.table;
        var laydate = layui.laydate;
        //常规用法
        laydate.render({
            elem: '#donationtime'
        });
        tableIns = table.render({
            elem: '#table'
            , url: '/selDonation'
            , cols: [[
                {field: 'id', title: 'ID', hide: true, sort: true}
                , {field: 'donationname', align: 'center', title: '捐款人/单位'}
                , {field: 'money', align: 'center', title: '金额', sort: true}
                , {
                    field: 'donationtime',
                    align: 'center',
                    title: '时间',
                    templet: "<div>{{layui.util.toDateString(d.donationtime, 'yyyy-MM-dd HH:mm:ss')}}</div>"

                }
            ]]
            , method: "post"
            , page: true
            , limits: [5, 10, 20, 30, 50, 80, 100]
            , limit: 10
        });
    });

    function getDonations() {
        var donationname = $("#donationname");
        var donationtime = $("#donationtime");
        //执行重载
        tableIns.reload({
            page: {
                curr: 1,
                limit: 10
            }
            , where: {
                donationname: donationname.val(),
                donationtime: donationtime.val()
            }

        });
    }
</script>

</body>
</html>