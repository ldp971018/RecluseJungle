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
    <script src="/static/layui/jquery.min.js"></script>
    <script src="/static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="/static/layui/css/layui.css">

    <style rel="stylesheet">
        .layui-table-cell {
            height: auto;
            overflow: visible;
            text-overflow: inherit;
            white-space: normal;
        }

        .pagination {
            font-family: Tahoma;
            font-size: 12px;
            height: 22px;
            margin: 5px 10px;
            text-align: right;
        }

        .pagination a, .page-cur, .page-start, .page-end, .page-disabled, .page-skip {
            height: 22px;
            line-height: 22px;
            margin: 0 3px 0 0;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
        }

        .pagination input {
            border-width: 1px;
        }

        .page-start, .pagination a, .page-end, .page-disabled {
            border: 1px solid #CCCCCC;
            padding: 0 5px;
        }

        .pagination a {
            text-decoration: none;
        }

        .page-cur {
            background-color: #FFEDE1;
            border: 1px solid #FD6D01;
            color: #FD6D01;
            font-weight: 700;
            padding: 0 5px;
        }

        .page-disabled {
            color: #CCCCCC;
        }

        .page-skip {
            color: #666666;
            padding: 0 3px;
        }
    </style>
</head>
<body onload="loData()">
<div>
    <script type="text/javascript">
        //获取地址栏
        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = (strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }

        function Alllogin() {
            var Request = new Object();
            Request = GetRequest();
            var returnUrl;
            returnUrl = Request['id'];
            window.location.href = "/login?returnurl=/foundjzfzDetailed&id=" + returnUrl;
        }
    </script>
    <!--首页TOP-->
    <div class="yc-txdd1">
        <jsp:include page="head.jsp"/>
        <!--首页banner-->

        <!--首页轮播图-->


        <!--用车-填写订单-->
        <div class="yc-txdd">
            <div class="yc-mbx">
                <p>当前位置：<a href="index.jsp" class="ll">丛林闲居网</a> > <a href="FoundIndex.jsp" class="ll">基金会</a> > <a
                        href="#"
                        class="xz">我要求助</a></p>
            </div>
            <input type="hidden" id="helpid" value="${id}"/>
            <input type="hidden" id="uid" value="${regUser.id }"/>
            <div><img src="/static/images/jjh_03.jpg"></div>
            <div class="jjh-index">
                <div class="jjh-index-left">
                    <div class="jjh-p2">
                        <p class="jjh-p21">救助/扶助公示详细</p>
                    </div>
                    <div class="jjh-table">
                        <div class="fzymt-one">
                            <div class="fyt-top"><p></p><i>个人基本信息</i><span></span></div>
                            <div class="jzfz-top">
                                <table>
                                    <tr>
                                        <td>申请人姓名：<i id="name"></i></td>
                                        <td>年龄：<i id="age"></i></td>
                                        <td>性别：<i id="sex"></i></td>
                                        <td>身份证号：<i id="idcard"></i></td>
                                    </tr>
                                    <tr>
                                        <td>联系电话：<i id="phonenum"></i></td>
                                        <td colspan="2">联系邮箱：<i id="email"></i></td>
                                        <td>住址或单位：<i id="address"></i></td>
                                    </tr>
                                    <tr>
                                        <td>是否享受低保：<i id="basicliving"></i></td>
                                        <td colspan="2">家庭年收入：<i id="income"></i></td>
                                        <td>拟申请救助金额：<i id="applymoney"></i></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="zykn"><span>主要困难概述：</span><i
                                                id="applycontent"></i></td>
                                    </tr>
                                </table>
                            </div>
                            <div id="vouch" style="display: none">
                                <div class="fyt-top"><p></p><i>担保人信息</i><span></span></div>
                                <div class="jzfz-top">
                                    <table>
                                        <tr>
                                            <td>担保人姓名：<i id="vouchname"></i></td>
                                            <td>身份证号：<i id="vouchidcard"></i></td>
                                            <td>单位固定电话：<i id="vouchphonenum"></i></td>
                                        </tr>
                                        <tr>
                                            <td>个人联系电话：<i id="vouchmobile"></i></td>
                                            <td>住址：<i id="vouchaddress"></i></td>
                                            <td>工作单位：<i id="vouchcompany"></i></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="wypl">
                                <div class="wypl-top">
                                    <p class="wy"><span class="left">我要评论</span></p>
                                    <div class="wypltop-con">
                                        <div class="left"><c:if
                                                test="${regUser==null}">请<a href="javascript:void(0)" onclick="Alllogin()">登录</a>先</c:if><c:if
                                                test="${regUser!=null}">${regUser.username}</c:if></div>
                                        <div class="right"><p class="text"><img
                                                src="/static/images/jzfz_10.jpg"><textarea
                                                id="commentContent" placeholder="请输入评论"></textarea></p>
                                            <p><span></span><c:if test="${regUser !=null}"><span><input
                                                    type="submit" value="发布" onclick="insComment()"></span></c:if><c:if
                                                    test="${regUser ==null}"><span><input type="submit" value="登录"
                                                                                          onclick="Alllogin()"></span></c:if>
                                            </p></div>
                                    </div>
                                </div>
                                <div class="wypl-con">
                                    <p class="zxpl">最新评论 <span onclick="flush()"
                                                               style="margin-top:-38px;margin-left: 80px">
                                        <img src="/static/images/jzfz_23.jpg">刷新</span></p>
                                    <div class="zxpl-con one-back" id="helpcommentJson" style="text-align: center">
                                        <table class="layui-hide" id="tables"></table>
                                    </div>
                                </div>

                            </div>
                        </div>

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

            <div class="tcc" id="okok" style="display: none">
                <div class="cgxd4">
                    <div class="cgxd4-top"><p class="one"><img src="<%=path%>/static/images/zhmm4_03.jpg">提示</p>
                        <p class="two"><img src="<%=path%>/static/images/14_01.png" class="close3" onclick="closeMsg()">
                        </p></div>
                    <div class="cgxd4-main" id="msg">

                    </div>
                    <div class="cgxd4-buttom">
                        <a onclick="closeMsg()">确&nbsp;认</a>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="bottom.jsp" %>
    </div>
</div>

<script type="text/javascript">
    function loData() {
        $.ajax({
            url: "/selJzfzDetailed",
            data: {"id": ${id}},
            dataType: "json",
            success: function (result) {
                $("#name").text(result.data.name);
                $("#age").text(result.data.age);
                if (result.data.sex)
                    $("#sex").text("男");
                else
                    $("#sex").text("女");
                $("#idcard").text(result.data.idcard);
                $("#phonenum").text(result.data.phonenum);
                $("#email").text(result.data.email);
                $("#address").text(result.data.address);
                if (result.data.basicliving)
                    $("#basicliving").text("是");
                else
                    $("#basicliving").text("否");
                $("#income").text(result.data.income);
                $("#applymoney").text(result.data.applymoney);
                $("#applycontent").text(result.data.applycontent);
                $("#vouchname").text(result.data.vouchname);
                $("#vouchidcard").text(result.data.vouchidcard);
                $("#vouchphonenum").text(result.data.vouchphonenum);
                $("#vouchmobile").text(result.data.vouchmobile);
                $("#vouchaddress").text(result.data.vouchaddress);
                $("#vouchcompany").text(result.data.vouchcompany);

            }
        })
    }

    function closeMsg() {
        $("#msg").hide();
        window.location.href = "/foundJzfzDetailed?id=" + $("#helpid").val();
    }

    function insComment() {
        var helpid = $("#helpid").val();
        var uid = $("#uid").val();
        var commentContent = $("#commentContent").val();
        if (helpid == null || helpid == '') {
            layui.use('layer', function () {
                var layer = layui.layer;
                layer.alert("信息有误！")
            })
        } else {
            $.ajax({
                url: "/insHelpcomment",
                data: {"content": commentContent, "helpid": helpid, "uid": uid},
                dataType: "json",
                method: "post",
                success: function (result) {
                    $("#okok").show();
                    $("#msg").text(result.msg);
                }
            })
        }
    }
</script>
<script type="text/javascript">
    var tableIns;
    layui.use('table', function () {
        var table = layui.table;
        tableIns = table.render({
            elem: '#tables'
            , url: '/selHelpcomment'
            , cols: [[
                {field: 'id', title: 'ID', hide: true}
                , {field: 'content', title: '内容', align: "center", width: 650}
                , {
                    field: 'time',
                    align: 'center',
                    title: '时间'
                }
            ]]
            , method: "post"
            , page: true
            , limits: [5, 10, 20, 30, 50, 80, 100]
            , limit: 10
            , where: {
                id: "${id}"
            }
        });
    });

    function flush() {
        //执行重载
        tableIns.reload({
            page: {
                curr: 1,
                limit: 10
            }
            , where: {
                id: "${id}"
            }
        })
    }
</script>
</body>
</html>