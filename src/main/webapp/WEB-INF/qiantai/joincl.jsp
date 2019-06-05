<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>丛林闲居-丛林加盟</title>
    <link rel="stylesheet" href="style/cy.css">
    <link rel="stylesheet" href="style/style.css">
    <!-- 表单验证start -->
    <script src="<%=path %>/static/js/jquery.js"></script>
    <script src="<%=path %>/static/js/jquery.validate.js"></script>
    <script src="<%=path%>/static/js/jquery.metadata.js"></script>
    <script type="text/javascript" src="<%=path%>/js/messagesx_cn.js"></script>
    <!-- 表单验证stop -->
    <!-- 下载中文文件start -->
    <script src="<%=path %>/static/sheet/js/download.js"></script>
    <!-- 下载中文文件stop -->
</head>

<body>
<div>
    <script type="text/javascript">
        $(function () {
            if (!placeholderSupport()) {   // 判断浏览器是否支持 placeholder
                $('[placeholder]').focus(function () {
                    var input = $(this);
                    if (input.val() == input.attr('placeholder')) {
                        input.val('');
                        input.removeClass('placeholder');
                    }
                }).blur(function () {
                    var input = $(this);
                    if (input.val() == '' || input.val() == input.attr('placeholder')) {
                        input.addClass('placeholder');
                        input.val(input.attr('placeholder'));
                    }
                }).blur();
            }
            ;
        })

        function placeholderSupport() {
            return 'placeholder' in document.createElement('input');
        }
    </script>
    <script language="JavaScript">
        // javascript:window.history.forward(1); //我目前先用着这个
    </script>
    <!--首页TOP-->
    <div class="yc-txdd1">

        <!--首页banner-->
        <jsp:include page="head.jsp"/>
        <script type="text/javascript">
            function Alllogin() {
                window.location.href = "login.jsp?returnurl=/joincl.jsp";
            }

            function loginOut() {
                window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/joincl.jsp";
            }
        </script>
        <!--首页轮播图-->


        <!--用车-填写订单-->
        <div class="yc-txdd">
            <div class="yc-mbx">
                <p>当前位置：<a href="index.jsp" class="ll">丛林闲居网</a> > <a href="#" class="xz">加盟</a></p>
            </div>
            <div><img src="images/jm_03.jpg"></div>
            <div class="jm">
                <div class="kwff-p1">
                    <p class="kwff-p11">加盟列表</p>
                    <p class="kwff-p12"><span class="qzfze">丛林加盟</span><a href="joinxj.jsp"><span>闲居加盟</span></a> <a
                            href="joincar.jsp"><span>车辆加盟</span></a></p>
                </div>
                <div class="qzsqb">
                    <div class="qzsqb-one">
                        <ul>
                            <li>
                                <a href="javascript:void(0)" onclick="goDownload('丛林加盟丛林闲居的合同.docx')">丛林加盟丛林闲居的合同</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="jm-left">
                    <p class="xx">
                        <c:if test="${sessionUser ==null }"><em style="font-size: 10px;color: red">加盟首先要登录哦，点击<a
                                href="login.jsp?returnurl=/joincl.jsp">登录</a><br/></em></c:if>
                        <img src="images/09.png">请填写加盟信息：
                    </p>
                    <span class="rxxx">如果您是丛林，想加盟丛林闲居网，请填写如下信息（<i>* 为必填项</i>）</span>
                    <form method="post" action="<%=path %>/joincl!addJoincl.action" id="joinclForm"
                          enctype="multipart/form-data">
                        <div class="tab">
                            <!-- 用户id -->
                            <input type="hidden" name="joincl.uid" id="uid" value="${sessionUser.id }"/>
                            <p><input type="text" value="${joincl.clname }" name="joincl.clname" id="name"
                                      placeholder="寺院名称" class="lxr"><i>*</i><span class="status" style="color: red"
                                                                                   id="td1"></span><span class="status"
                                                                                                         style="color: red"
                                                                                                         id="td1"></span>
                            </p>
                            <p><input type="text" value="${joincl.permitno }" name="joincl.permitno" id="permitno"
                                      placeholder="宗教场所许可证号" class="lxr "><i>*</i><span class="status"
                                                                                        style="color: red"
                                                                                        id="td1"></span><span
                                    class="status" style="color: red" id="td2"></span></p>
                            <p><input type="text" value="${joincl.address }" name="joincl.address" id="address"
                                      placeholder="地 址" class="lxr"><i>*</i><span class="status" style="color: red"
                                                                                  id="td1"></span><span class="status"
                                                                                                        style="color: red"
                                                                                                        id="td3"></span>
                            </p>
                            <p><input type="text" value="${joincl.legalname }" name="joincl.legalname" id="legalname"
                                      placeholder="法人代表名字" class="lxr "><i>*</i><span class="status" style="color: red"
                                                                                      id="td4"></span></p>
                            <p><input type="text" value="${joincl.legalphone }" name="joincl.legalphone" id="legalphone"
                                      placeholder="法人代表手机号" class="lxr "><i>*</i><span class="status" style="color: red"
                                                                                       id="td5"></span></p>
                            <p><input type="text" value="${joincl.legalidcard }" name="joincl.legalidcard"
                                      id="legalidcard" placeholder="法人代表身份证号" class="lxr "><i>*</i><span class="status"
                                                                                                         style="color: red"
                                                                                                         id="td6"></span>
                            </p>
                            <p><input type="text" value="${joincl.contactsname }" name="joincl.contactsname"
                                      id="contactsname" placeholder="联系人名字" class="lxr "><i>*</i><span class="status"
                                                                                                       style="color: red"
                                                                                                       id="td7"></span>
                            </p>
                            <p><input type="text" value="${joincl.contactsmobile }" name="joincl.contactsmobile"
                                      id="contactsmobile" placeholder="联系人固定电话（xxxx-xxxxxxx）" class="lxr "><i>*</i><span
                                    class="status" style="color: red" id="td8"></span></p>
                            <c:if test="${joincl==null }">
                                <p><input type="text" maxlength="11" name="joincl.contactsphone" id="contactsphone"
                                          placeholder="联系人手机（11位手机号码，作为后台管理员登录帐号）" class="lxr "
                                          onblur="checkContactsphone()"><i>*</i><span class="status" style="color: red"
                                                                                      id="td9"></span></p>
                                <p><input type="text" id="mobileYZM" placeholder="验证码" maxlength="6" onblur="checkYZM()"
                                          class="yzm">
                                    <button type="button" id="hqyzmbutton" onclick="getNumRandom()">获取验证码</button>
                                    <i>*</i>
                                    <span class="status" style="color: red" id="td10"></span></p>
                                <input type="hidden" name="update" value="" id="update"/>
                            </c:if>
                            <c:if test="${joincl!=null }">
                                <input type="hidden" name="joincl.contactsphone" value="${joincl.contactsphone }"/>
                                <input type="hidden" name="joincl.id" value="${joincl.id }"/>
                                <input type="hidden" name="joincl.jointime" value="${joincl.jointime}" id="jointime"/>
                                <input type="hidden" name="update" value="1" id="update"/>
                            </c:if>
                            <p><input value="${joincl.postcode }" type="text" name="joincl.postcode" id="postcode"
                                      placeholder="邮编" class="lxr "><i>*</i><span class="status" style="color: red"
                                                                                  id="td11"></span></p>
                            <p id="more"><input type="file" name="fileUrl.file0"><i>合同上传&nbsp;&nbsp;&nbsp;*</i></p>
                            <p><textarea name="joincl.message"
                                         placeholder="寺院的简要介绍（500字以内）：">${joincl.message }</textarea></p>
                            <p style="margin-top:20px;"><input type="button" id="sub" value="提交信息"></p>
                        </div>
                    </form>
                    <p class="xx"><img src="images/09.png">要求及流程说明</p>
                    <p class="ln">本着双赢的理念，丛林闲居已建立了一个遍及全国的完善代理商网络。无论是个人还是企业，只要符合丛林闲居的要求，都可
                        以成为丛林闲居的代理商，代理丛林闲居的国内、国外闲居预订的业务。 代理商将获得强大的品牌支持，良好的售后服务体系
                        同时获得丰厚的利润回报。</p>
                    <div class="liucheng">
                        <img src="images/one_03.jpg">
                    </div>
                </div>
            </div>


        </div>
        <%@ include file="bottom.jsp" %>
    </div>
</div>
<c:if test="${show !=null}">
    <div class="tcc2">
        <div class="tx-ydm" style="margin-top: 300px;">
            <p class="tx-sm"><span class="one"><img src="images/tx.png">提示</span><span class="two"><img
                    src="images/14_01.png" class="close5"></span></p><br/><br/><br/>
            <p align="center">
                <c:if test="${isOk ==true}">加盟成功，你的临时密码为${pwd }</c:if>
                <c:if test="${isOk ==false }">加盟失败</c:if></p><br/><br/><br/>
            <p align="center">
                <c:if test="${isOk ==true }">点击<a href="<%=path %>/UserJPquery.jsp">查看</a>加盟进度</c:if>
                <c:if test="${isOk ==false }">点击<a href="<%=path %>/joincl.jsp">加盟</a>重新加盟</c:if> <br/><br/><br/>
            </p>
        </div>
    </div>
</c:if>
<script src="../../js"></script>
<script type="text/javascript">
    var wait = 120;//倒计时获取验证码时间
    var checks = false; //一个全局变量，用来最终判断表单是否可以提交
    $("#sub").click(function () {
        var uid = document.getElementById("uid").value;
        var update = document.getElementById("update").value;
        //先判断是否登录
        if (uid == null || uid == "") {
            alert("请先登录");
        } else {
            var check = $("#joinclForm").valid();
            //判断是否是更新，如果是更新那就不需要填写手机号码
            if (update == 1) {
                if (check) {
                    document.getElementById("joinclForm").submit();
                }
            } else {
                //是新增的要判断验证码
                checkYZM();
                if (checks) {
                    if (check) {
                        document.getElementById("joinclForm").submit();
                    }
                }
            }
        }
    });
    $(document).ready(function () {
        $("#joinclForm").validate({
            onfocusout: function (element) {
                $(element).valid();
            },
            rules: {
                'joincl.clname': {
                    required: true,
                    isChinese: true
                },
                'joincl.permitno': {
                    required: true,
                    isPermitno: true
                },
                'joincl.address': {
                    required: true
                },
                'joincl.legalname': {
                    required: true,
                    isChinese: true
                },
                'joincl.legalphone': {
                    required: true,
                    isMobile: true
                },
                'joincl.legalidcard': {
                    required: true,
                    idCard: true
                },
                'joincl.contactsname': {
                    required: true,
                    isChinese: true
                },
                'joincl.contactsmobile': {
                    required: true,
                    isPhone: true
                },
                'joincl.postcode': {
                    required: true,
                    isZipCode: true
                },
                'fileUrl.file0': {
                    required: true
                }
            },
            messages: {
                'joincl.clname': {
                    required: "&nbsp;&nbsp;寺院名称不能为空",
                    isChinese: "&nbsp;&nbsp;寺院名称必须为中文"
                },
                'joincl.permitno': {
                    required: "&nbsp;&nbsp;宗教场所许可证号不能为空",
                    isPermitno: "&nbsp;&nbsp;宗教场所许可证号格式不对"
                },
                'joincl.address': {
                    required: "&nbsp;&nbsp;地址不能为空"
                },
                'joincl.legalname': {
                    required: "&nbsp;&nbsp;法人代表名字不能为空",
                    isChinese: "&nbsp;&nbsp;法人代表名字必须为中文"
                },
                'joincl.legalphone': {
                    required: "&nbsp;&nbsp;法人代表手机号不能为空",
                    isMobile: "&nbsp;&nbsp;法人代表手机号格式不正确"
                },
                'joincl.legalidcard': {
                    required: "&nbsp;&nbsp;法人代表身份证不能为空",
                    idCard: "&nbsp;&nbsp;法人代表身份证格式不正确(如有X请大写)"
                },
                'joincl.contactsname': {
                    required: "&nbsp;&nbsp;联系人名字不能为空",
                    isChinese: "&nbsp;&nbsp;联系人名字必须为中文"
                },
                'joincl.contactsmobile': {
                    required: "&nbsp;&nbsp;联系人固定电话不能为空",
                    isPhone: "&nbsp;&nbsp;联系人固定电话格式不对"
                },
                'joincl.postcode': {
                    required: "&nbsp;&nbsp;邮编不能为空",
                    isZipCode: "&nbsp;&nbsp;邮编格式不对"
                },
                'fileUrl.file0': {
                    required: "&nbsp;&nbsp;合同不能为空哦"
                }
            },
            //更改错误信息显示位置
            errorPlacement: function (error, element) {
                if (element.is(":radio"))
                    error.appendTo(element.parent().next().next());
                else if (element.is(":checkbox"))
                    error.appendTo(element.next());
                else
                    error.appendTo(element.next());
            }
        });

    });

    //验证联系人手机
    function checkContactsphone() {
        var contactsphone = document.getElementById("contactsphone").value;
        var check = !!contactsphone.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
        var td9 = document.getElementById("td9");
        if (contactsphone == "") {
            td9.innerHTML = "&nbsp;&nbsp;请输入手机号";
        } else if (check == false) {
            td9.innerHTML = "&nbsp;&nbsp;请正确填写您的手机号码";
        } else {
            $.ajax({
                type: "post",
                url: "<%=path %>/joincl!checkContactsphone.action",
                data: {"joincl.contactsphone": contactsphone},
                dataType: "json",
                async: false,
                success: function (status) {
                    if (status.message == null || status.status == null) {
                        td9.innerHTML = "&nbsp;&nbsp;发生了一点异常，抱歉，请你刷新页面重试";
                        checks = false;
                    }
                    if (status.status == "true" || status.status == true) {
                        td9.innerHTML = status.message;
                        checks = true;
                    } else {
                        td9.innerHTML = status.message;
                        checks = false;
                    }
                }
            });
        }
    }

    //获取验证码
    function getNumRandom() {
        checkContactsphone();
        if (checks) {
            var td10 = document.getElementById("td10");
            var contactsphone = document.getElementById("contactsphone").value;
            var button = document.getElementById("hqyzmbutton");
            time(button);
            $.ajax({
                type: "post",
                url: "<%=path %>/joincl!getNumRandom.action",
                data: {"joincl.contactsphone": contactsphone},
                dataType: "json",
                async: false,
                success: function (status) {
                    if (status.message == null || status.status == null) {
                        td10.innerHTML = "&nbsp;&nbsp;发生了一点异常，抱歉，请你刷新页面重试";
                        checks = false;
                    }
                    if (status.status == "true" || status.status == true) {
                        td10.innerHTML = status.message;
                        checks = true;
                    } else {
                        td10.innerHTML = status.message;
                        checks = false;
                    }
                }
            });
        }
    }

    //按钮倒计时
    function time(o) {
        if (wait == 0) {
            o.removeAttribute("disabled");
            o.innerHTML = "免费获取验证码";
            wait = 120;
        } else {
            o.setAttribute("disabled", true);
            o.innerHTML = "重新发送(" + wait + ")";
            wait--;
            setTimeout(function () {
                    time(o)
                },
                1000)
        }
    }

    //判断验证码
    function checkYZM() {
        checkContactsphone();
        if (checks) {
            var mobileYZM = $('#mobileYZM').val();
            var contactsphone = document.getElementById("contactsphone").value;
            var check = !!mobileYZM.match(/^\d{6}$/);
            var td10 = document.getElementById("td10");
            if (check) {
                $.ajax({
                    type: "post",
                    url: "<%=path %>/joincl!checkYZM.action",
                    data: {"joincl.contactsphone": contactsphone, 'mobileYZM': mobileYZM},
                    dataType: "json",
                    async: false,
                    success: function (status) {
                        if (status.message == null || status.status == null) {
                            td10.innerHTML = "&nbsp;&nbsp;发生了一点异常，抱歉，请你刷新页面重试";
                            checks = false;
                        }
                        if (status.status == "true" || status.status == true) {
                            td10.innerHTML = status.message;
                            checks = true;
                        } else {
                            td10.innerHTML = status.message;
                            checks = false;
                        }
                    }
                });
            } else {
                td10.innerHTML = "请正确输入6位纯数字验证码";
                checks = false;
            }
        }
    }
</script>
</body>
</html>