<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>丛林闲居-用户中心-求助进度查询</title>
    <link rel="stylesheet" href="/static/style/cy.css">
    <link rel="stylesheet" href="/static/style/style.css">
</head>
<body style="background-color:#f6f6f6;">
<c:if test="${regUser==null}">
    <script type="text/javascript">
        window.location.href = "<%=path%>/login";
    </script>
</c:if>
<c:if test="${saveHelp ==true}">
    <script type="text/javascript">
        alert("求助成功");
    </script>
</c:if>
<div>
    <!--首页TOP-->

    <!--首页banner-->
    <jsp:include page="head.jsp"/>
    <script type="text/javascript">
        function loginOut() {
            window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/clxjmain!Homepage.action";
        }
    </script>
    <!--首页轮播图-->
    <!--用车-填写订单-->
    <div class="personal-content">
        <div><img src="images/ayw_03.gif"></div>
        <div class="per-cont-left">
            <ul class="left-top">
                <li class="top-one">
                    <ul class="lf one-i">
                        <li><c:if test="${sessionUser.sex ==true}"><img src="images/touxiagn.png"/></c:if>
                            <c:if test="${sessionUser.sex ==false}"><img src="images/touxiagnv.jpg"/></c:if>
                        </li>
                    </ul>
                    <ul class="lf one-ii">
                        <li></li>
                        <li>尊敬的会员！<input type="hidden" id="uid" value="${sessionUser.id }"/></li>
                        <li class="quit"><em onclick="loginOut()">[退出]</em></li>
                    </ul>
                </li>
                <li class="top-two cf">手机：${sessionUser.mobile }</li>
                <li class="top-two">邮箱：${sessionUser.email }</li>
            </ul>
            <ul class="grzl-banner">
                <li><a href="UserPersonal.jsp"><p class="grzl"></p>个人资料</a></li>
                <li><a href="UserCPassword.jsp"><p class="xgmm"></p>密码修改</a></li>
                <li><a href="UserJAOrder.jsp"><p class="clxjdd"></p>丛林闲居订单</a></li>
                <li><a href="UserCarOrder.jsp"><p class="ycdd"></p>我的用车订单</a></li>
                <li class="yhzxsp yhzxs4"><a href="javascript:void(0)"><p class="qzjd"></p>求助进度查询</a></li>
                <li><a href="UserJPquery.jsp"><p class="jmcx"></p>加盟进度查询</a></li>
            </ul>
        </div>

        <div class="per-cont-right">
            <div class="yhzx-jmjdcx">
                <div class="jmjdcx-top">
                    <span class="dywr" onclick="initTab(4)">所有求助(<em id="all"></em>)</span> |<span onclick="initTab(3)">未通过(<em
                        id="no"></em>)</span> |<span onclick="initTab(1)">初审通过(<em id="ok"></em>)</span>|<span
                        onclick="initTab(2)">终审通过(<em id="ok2"></em>)</span>
                </div>
                <div class="jmjdcx-nr">
                    <div class="jmjdx-one">
                        <table border="1px solid #cccccc" id="tab">
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="bottom.jsp" %>

</div>
<script src="js/jquery.min.js"></script>
<script src="../../js"></script>
<script type="text/javascript">
    getCount();
    var all;
    var ok;
    var ok2;
    var no;

    function getCount() {
        $.ajax({
            type: "post",
            url: "<%=path%>/helpinfo!selHelpOfUidCount.action",
            data: {"uid": $("#uid").val()},
            dataType: "json",
            async: false,
            success: function (results) {
                all = results.helpinfoCount.count;
                ok = results.helpinfoCount.ok;
                no = results.helpinfoCount.no;
                ok2 = results.helpinfoCount.ok2;
                document.getElementById("all").innerHTML = all;
                document.getElementById("no").innerHTML = no;
                document.getElementById("ok").innerHTML = ok;
                document.getElementById("ok2").innerHTML = ok2;
                initTab(4);
            }
        });
    }

    function initTab(applystatus) {
        var t1 = document.getElementById("tab");
        var rowNum = t1.rows.length;
        if (rowNum > 0) {
            for (i = 0; i < rowNum; i++) {
                t1.deleteRow(i);
                rowNum = rowNum - 1;
                i = i - 1;
            }
        }
        var innerTD1 = "<tr><td>序号</td><td>申请人名字</td><td>申请状态</td><td>申请时间</td></tr>";
        $(innerTD1).appendTo("#tab");
        $.ajax({
            type: "post",
            url: "<%=path%>/helpinfo!selHelpOfUid.action",
            data: {"uid": $("#uid").val(), "applystatus": applystatus},
            dataType: "json",
            async: false,
            success: function (results) {
                if (results.helpinfos.length > 0) {
                    for (var i = 0; i < results.helpinfos.length; i++) {
                        var id = i + 1;//序号
                        var name = results.helpinfos[i].name;//申请人名字
                        var applystatus;//状态
                        switch (results.helpinfos[i].applystatus) {
                            case 0:
                                applystatus = "申请处理中";
                                break;
                            case 1:
                                applystatus = "初审通过";
                                break;
                            case 2:
                                applystatus = "申请成功";
                                break;
                            case 3:
                                applystatus = "申请驳回";
                                break;
                        }
                        var time = results.helpinfos[i].time; //申请时间
                        var innerTD = "<tr><td>" + id + "</td><td>" + name + "</td><td>" + applystatus + "</td><td>" + time + "</td></tr>";
                        $(innerTD).appendTo("#tab");
                    }
                } else {
                    var innerTD = "<tr><td  colspan='4'>暂时无申请哦</td></tr>";
                    $(innerTD).appendTo("#tab");
                }
            }
        });
    }
</script>
</body>
</html>