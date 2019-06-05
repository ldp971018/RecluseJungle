<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.10 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>丛林闲居网</title>
    <link rel="stylesheet" href="${path}/static/style/cy.css">
    <link rel="stylesheet" href="${path}/static/style/style.css">
    <script src="${path}/static/js/laydate.js"></script>
    <link rel="stylesheet" href="${path}/static/style/laydate.css">
    <link rel="stylesheet" href="${path}/static/js/skins/molv/laydate.css">
    <script src="${path}/static/js/jquery.min.js"></script>
    <script type='text/javascript' src='${path}/static/js/citylist.js'></script>
    <script type='text/javascript' src='${path}/static/js/querycity.js'></script>
    <link href='${path}/static/style/cityquery.css' rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${path}/static/js/alertPopShow.js"></script>
    <style type="text/css">
        .web_toast{
            position: fixed;
            margin: 0 10px;
            z-index: 9999;
            display: none;
            display: block;
            padding: 10px;
            color: red;
            background: rgba(0, 0, 0, 0.7);
            font-size: 1.4rem;
            text-align: center;
            border-radius: 4px;
        }
    </style>
</head>

<body>
<!--首页TOP-->

<!--首页banner-->
<jsp:include page="/WEB-INF/qiantai/head.jsp"/>
<script type="text/javascript">
    function Alllogin() {
        window.location.href = "/login";
    }

    function loginOut() {
        window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/clxjmain!Homepage.action";
    }
</script>
<!--首页轮播图-->
<div class="index-lbt">
    <div id="scrollPics">
        <ul class="slider">
            <li><img src="${path}/static/roll/home/lbt1.png" class="lower" width="100%" height="380px"/></li>
            <li><img src="${path}/static/roll/home/lbt2.png" width="100%" height="380px"/></li>
            <li><img src="${path}/static/roll/home/lbt3.png" width="100%" height="380px"/></li>
            <li><img src="${path}/static/roll/home/lbt4.png" width="100%" height="380px"/></li>
            <li><img src="${path}/static/roll/home/lbt5.png" width="100%" height="380px"/></li>
        </ul>
        <ul class="num">
            <li class="on"></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>

    </div>
    <div class="nested">
        <div class="nTab">
            <div class="TabTitle">
                <ul id="myTab">
                    <li id="leftCL" class="active normal" onclick="leftCL()"><p class="selected1"></p>丛林</li>
                    <li id="leftXJ" class=" normal" onclick="leftXJ()"><p class="selected0"></p>闲居</li>

                </ul>
            </div>
            <div class="TabContent">
                <div id="rightCL" class="myTab_Content">
                    <div class="lbttj">
                        <div class="tj-top">
                            <span id="gncl"  class="gnxjac" onclick="gncl()">国内丛林</span><span id="gjcl"  onclick="gjcl()">国际丛林</span>
                        </div>
                        <div class="tj-bottom tj-bottom2">
                            <div class="xj">
                                <!-- 国内丛林 -->
                                <form action="selectCL" method="post"
                                      onsubmit="getCity('11',yyqx)">
                                    <table>
                                        <tr>
                                            <td>目的地</td>
                                            <td class="sec"><input type="text" name="belongCity" placeholder="请输入城市名" id="yyqx"
                                                                   data-wholename=""></td>
                                            <input type="hidden" name="clxjmain.belong_city" id="city11"/>
                                            <input type="hidden" id="CLtype1" name="type1" value="true"/>
                                            <input type="hidden" id="CLtype2" name="type2" value="true"/>
                                        </tr>
                                        <tr>
                                            <td>入住</td>
                                            <td><p><input name="createtime" placeholder="年/月/日" class="laydate-icon ts" id="demo5"
                                                          value=""></p>

                                                <p>退房：<input name="endTime" placeholder="年/月/日" class="laydate-icon" id="demo6"
                                                             value=""></p></td>
                                        </tr>
                                        <tr>
                                            <td>关键词</td>
                                            <td class="sec"><input type="text" name="name"
                                                                   placeholder="请输入地标/商圈/景点" id="gnclkey"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td class="ses sec"><input type="submit" value="搜索"></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="rightXJ" class="myTab_Content none">
                    <div class="lbttj">
                        <div class="tj-top">
                            <span id="gnxj"  class="gnxjac" onclick="gnxj()">国内闲居</span><span  id="gjxj" onclick="gjxj()">国际闲居</span>
                        </div>
                        <div class="tj-bottom tj-bottom1">
                            <div class="xj">
                                <!-- 国内闲居 -->
                                <form action="selectJungle" method="post"
                                      onsubmit="getCity('10',zmx)">
                                    <table>
                                        <tr>
                                            <td>目的地</td>
                                            <td class="sec ">
                                                <input type="text" name="belongCity" placeholder="请输入城市名" id="zmx" data-wholename="">
                                                <input type="hidden" name="clxjmain.belong_city" id="city10"/>
                                                <input type="hidden" id="XJtype1" name="type1" value="true"/>
                                                <input type="hidden" id="XJtype2" name="type2" value="false"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>入住</td>
                                            <td><p><input placeholder="年/月/日" name="createtime" class="laydate-icon ts" id="demo1"
                                                          value=""></p>

                                                <p>退房：<input placeholder="年/月/日" name="endTime" class="laydate-icon" id="demo2"
                                                             value=""></p></td>
                                        </tr>
                                        <tr>
                                            <td>关键词</td>
                                            <td class="sec"><input type="text" name="name"
                                                                   placeholder="请输入地标/商圈/景点" id="gnxjkey"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td class="ses sec"><input type="submit" value="搜索"> <!-- <a
                                                href="#"><img src="images/06.png">所有闲居</a> --></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="index-content">
    <div id="a1" class="index-recommended">
        <p class="rmtj">热门推荐<i>明月松间照，清泉石上流</i></p>

        <div class="taq1">
            <div>
                <a href="JungleDetails?id=${indexInfo[0].id}"><img width="466" height="320"
                                                                                           src="${clxjBackurl }${indexInfo[0].firstImgBig }"></a>
            </div>
            <span></span><span class="mfcy"><a
                href="JungleDetails?id=${indexInfo[0].id}">${indexInfo[0].name }</a> </span>
        </div>
        <div class="taq1 spec">
            <div>
                <a href="JungleDetails?id=${indexInfo[1].id}"> <img width="467" height="320"
                                                                                            src="${clxjBackurl }${indexInfo[1].firstImgBig  }"></a>
            </div>
            <span></span><span class="mfcy"><a
                href="JungleDetails?id=${indexInfo[1].id}">${indexInfo[1].name  }</a> </span>
        </div>
        <div class="taq2 spec">
            <div>
                <div>
                    <a href="JungleDetails?id=${indexInfo[2].id}"><img width="224" height="141"
                                                                                               src="${clxjBackurl }${indexInfo[2].firstImgBig }"></a>
                    <span></span><span class="mfcy"><a
                        href="JungleDetails?id=${indexInfo[2].id}">${indexInfo[2].name }</a> </span>
                </div>
                <div class="spec2">
                    <a href="JungleDetails?id=${indexInfo[3].id}"><img width="224" height="141"
                                                                                               src="${clxjBackurl }${indexInfo[3].firstImgBig }"></a>
                    <span></span><span class="mfcy"><a
                        href="JungleDetails?id=${indexInfo[3].id}">${indexInfo[3].name  }</a> </span>
                </div>
            </div>
        </div>
    </div>
    <div id="a2" class="index-domestic">
        <div class="rmtj">
            <div class="rmtj1">国内<i>明月松间照，清泉石上流</i></div>
            <div class="rmtj2"><span id="TabGNCL" class="forest" onclick="TabGNCL()">丛林</span><span id="TabGNXJ" onclick="TabGNXJ()">闲居</span></div><!--
            <div class="rmtj3"><a href="javascript:void(0)">更多国内游></a> </div>
        --></div>
        <div class="im-main">
            <div id="infoGNCL" class="one">
                <div class="one-left">
                    <p class="rm">热门目的地</p>
                    <ul class="city">
                            <li><a href="javascript:void(0)"
                                   onclick="goOther(1,1,'${listGNCL[0].belongCity }')">${listGNCL[0].address }</a></li>
                    </ul>
                </div>
                <div class="one-con">
                    <a href="JungleDetails?id=${listGNCL[0].id}"><img width="467"
                                                                                                  height="320"
                                                                                                  src="${clxjBackurl }${listGNCL[0].firstImgBig }"></a>
                    <a href="JungleDetails?id=${listGNCL[0].id}"><span>${listGNCL[0].name }</span></a>
                </div>
                <div class="one-right">
                    <div class="or-one">
                        <div>
                            <a href="JungleDetails?id=${listGNCL[1].id}"> <img width="223"
                                                                                                           height="142"
                                                                                                           src="${clxjBackurl }${listGNCL[1].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGNCL[1].id}"><span>${listGNCL[1].name }</span></a>
                        </div>
                        <div>
                            <a href="JungleDetails?id=${listGNCL[2].id}"><img width="223"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${listGNCL[2].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGNCL[2].id}"><span>${listGNCL[2].name }</span></a>
                        </div>
                    </div>
                    <div class="or-two">
                        <div>
                            <a href="JungleDetails?id=${listGNCL[3].id}"><img width="224"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${listGNCL[3].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGNCL[3].id}"><span>${listGNCL[3].name }</span></a>
                        </div>
                        <div>
                            <a href="JungleDetails?id=${listGNCL[4].id}"><img width="224"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${listGNCL[4].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGNCL[4].id}"><span>${listGNCL[4].name }</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="infoGNXJ" class="one none">
                <div class="one-left">
                    <p class="rm">热门目的地</p>
                    <ul class="city">
                            <li><a href="javascript:void(0)"
                                   onclick="goOther(1,0,'${listGNXJ[0].belongCity }')">${listGNXJ[0].address }</a></li>
                    </ul>
                </div>
                <div class="one-con">
                    <a href="JungleDetails?id=${listGNXJ[0].id}"><img width="467"
                                                                                                  height="320"
                                                                                                  src="${clxjBackurl }${listGNXJ[0].firstImgBig }"></a>
                    <a href="JungleDetails?id=${listGNXJ[0].id}"><span>${listGNXJ[0].name }</span></a>
                </div>
                <div class="one-right">
                    <div class="or-one">
                        <div>
                            <a href="JungleDetails?id=${listGNXJ[1].id}"><img width="223"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${listGNXJ[1].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGNXJ[1].id}"><span>${listGNXJ[1].name }</span></a>
                        </div>
                        <div>
                            <a href="JungleDetails?id=${listGNXJ[2].id}"><img width="223"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${listGNXJ[2].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGNXJ[2].id}"><span>${listGNXJ[2].name }</span></a>
                        </div>
                    </div>
                    <div class="or-two">
                        <div>
                            <a href="JungleDetails?id=${listGNXJ[3].id}"><img width="224"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${listGNXJ[3].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGNXJ[3].id}"><span>${listGNXJ[3].name }</span></a>
                        </div>
                        <div>
                            <a href="JungleDetails?id=${listGNXJ[4].id}"><img width="224"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${listGNXJ[4].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGNXJ[4].id}"><span>${listGNXJ[4].name }</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="a3" class="index-abroad">
        <div class="rmtj">
            <div class="rmtj1">境外<i>明月松间照，清泉石上流</i></div>
            <div class="rmtj2"><span id="TabGWCL" class="forest1" onclick="TabGWCL()">丛林</span><span id="TabGWXJ" onclick="TabGWXJ()">闲居</span></div><!--
            <div class="rmtj3"><a href="javascript:void(0)">更多国内游></a> </div>
        --></div>
        <div class="ia-main">
            <div id="infoGWCL" class="one">
                <div class="one-left">
                    <p class="rm">热门目的地</p>
                    <ul class="city">
                            <li><a href="javascript:void(0)"
                                   onclick="goOther(0,1,'${listGWCL[0].belongCity }')">${listGWCL[0].address }</a></li>
                    </ul>
                </div>
                <div class="one-con">
                    <a href="JungleDetails?id=${listGWCL[0].id}"><img width="465"
                                                                                                  height="320"
                                                                                                  src="${clxjBackurl }${listGWCL[0].firstImgBig }"></a>
                    <a href="JungleDetails?id=${listGWCL[0].id}"><span>${listGWCL[0].name }</span></a>
                </div>
                <div class="one-right">
                    <div class="or-one">
                        <div>
                            <a href="JungleDetails?id=${listGWCL[1].id}"><img width="223"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${listGWCL[1].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGWCL[1].id}"><span>${listGWCL[1].name }</span></a>
                        </div>
                        <div>
                            <a href="JungleDetails?id=${listGWCL[2].id}"> <img width="225"
                                                                                                           height="141"
                                                                                                           src="${clxjBackurl }${listGWCL[2].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGWCL[2].id}"><span>${listGWCL[2].name }</span></a>
                        </div>
                    </div>
                    <div class="or-two">
                        <div>
                            <a href="JungleDetails?id=${listGWCL[3].id}"> <img width="224"
                                                                                                           height="142"
                                                                                                           src="${clxjBackurl }${listGWCL[3].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGWCL[3].id}"><span>${listGWCL[3].name }</span></a>
                        </div>
                        <div>
                            <a href="JungleDetails?id=${listGWCL[4].id}"> <img width="224"
                                                                                                           height="141"
                                                                                                           src="${clxjBackurl }${listGWCL[4].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGWCL[4].id}"><span>${listGWCL[4].name }</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="infoGWXJ" class="one none">
                <div class="one-left">
                    <p class="rm">热门目的地</p>
                    <ul class="city">
                            <li><a href="javascript:void(0)"
                                   onclick="goOther(0,0,'${listGWXJ[0].belongCity }')">${listGWXJ[0].address }</a></li>
                    </ul>
                </div>
                <div class="one-con">
                    <a href="JungleDetails?id=${listGWXJ[0].id}"><img width="465"
                                                                                                  height="320"
                                                                                                  src="${clxjBackurl }${listGWXJ[0].firstImgBig }"></a>
                    <a href="JungleDetails?id=${listGWXJ[0].id}"><span>${listGWXJ[0].name }</span></a>
                </div>
                <div class="one-right">
                    <div class="or-one">
                        <div>
                            <a href="JungleDetails?id=${listGWXJ[1].id}"><img width="223"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${listGWXJ[1].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGWXJ[1].id}"><span>${listGWXJ[1].name }</span></a>
                        </div>
                        <div>
                            <a href="JungleDetails?id=${listGWXJ[2].id}"><img width="225"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${listGWXJ[2].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGWXJ[2].id}"><span>${listGWXJ[2].name }</span></a>
                        </div>
                    </div>
                    <div class="or-two">
                        <div>
                            <a href="JungleDetails?id=${listGWXJ[3].id}"><img width="224"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${listGWXJ[3].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGWXJ[3].id}"><span>${listGWXJ[3].name }</span></a>
                        </div>
                        <div>
                            <a href="JungleDetails?id=${listGWXJ[4].id}"> <img width="224"
                                                                                                           height="141"
                                                                                                           src="${clxjBackurl }${listGWXJ[4].firstImgBig }"></a>
                            <a href="JungleDetails?id=${listGWXJ[4].id}"><span>${listGWXJ[4].name }</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="a4" class="index-charity">
        <div class="rmtj">
            <div class="rmtj1">慈善<i>明月松间照，清泉石上流</i></div><!--
            <div class="rmtj3"><a href="javascript:void(0)">更多景点></a> </div>
        --></div>
        <div class="ic-left">
                <div class="il-one">
                    <p class="title">爱心捐赠</p>
                    <p><input type="text" id="donationname" name="donationname" placeholder="请输入捐款人姓名"></p>
                    <p><input type="text" id="money" name="money" placeholder="请输入捐款金额"></p>
                    <p><a onclick="addDonation()"><input type="submit" value="在线捐赠"></a></p>
                </div>
            <form action="/donationLove" method="post">
                <div class="il-two">
                    <p class="title">善款查询</p>
                    <p><input type="text" name="donationname" placeholder="要查找人姓名"></p>
                    <p><input type="text" name="donationtime" class="laydate-icon" id="demo9"
                              style="margin-left:0px;width:185px;"></p>
                    <p><input type="submit" value="在线查询"></p>
                </div>
            </form>
        </div>
        <div class="ic-con">
            <p class="ckax"><img src="${path}/static/images/07.png">实时查看基金会总爱心金额</p>
            <p class="money">${moneyCountStr }</p>
            <p><img src="${path}/static/images/jk_03.jpg"></p>
            <p class="xz"><span class="one"><a href="/pLlist">捐款支出细则</a> </span><span
                    class="two"><a href="/foundIndex">基金会简介</a> </span></p>
        </div>
        <div class="ic-right">
            <p>捐款方式 / pattern</p>
            <ul>
                <li>单位名称： 江西济缘慈善基金会（筹）</li>
                <li>地 址： 江西省南昌高新开发区高新一路海外大厦北楼4层</li>
                <li>捐款热线： 400-688-6798</li>
                <li>邮箱地址：1415917674@qq.com</li>
                <li>银行户名：江西丛林闲居投资有限公司</li>
                <li>银行账号： 3605-0153-0150-0950-1617</li>
                <li>开 户 行： 建行南昌洪都支行</li>
            </ul>
        </div>
    </div>
</div>
<div id="nav">
    <ul>
        <li class="c"><a id="a11" href="#a1">推荐</a></li>
        <li><a id="a22" href="#a2">国内</a></li>
        <li><a id="a33" href="#a3">境外</a></li>
        <li><a id="a44" href="#a4">慈善</a></li>
    </ul>
</div>


<%--<%@ include  file="/qiantai/bottom.jsp"%>--%>
<%--<script src="${path}/static/js"></script>--%>
<script src="${path}/static/js/scorll.js"></script>
<script type="text/javascript">
    function addDonation() {
        var re = /^[0-9]+.?[0-9](2)*$/; //判断字符串是否为合法金额
        var nubmer = document.getElementById("money").value;
        if (!re.test(nubmer)) {
            webToast("对不起！请输入合法金额！","middle",2000);
            document.getElementById("money").value = "";
            document.getElementById("money").focus();
        }else{
            var donationname=$("#donationname").val();
            var money=$("#money").val();
            $.ajax({
                type : "post",
                url : "/insDonation",
                data: {"donationname":donationname,"money":money},
                dataType: "json",
                async : false,
                success : function(result){
                    console.log(result);
                    webToast(result.msg,"middle",2000);
                    document.getElementById("money").value="";
                    document.getElementById("donationname").value="";
                }
            });
        }
    }
    function TabGNCL() {
        var arr=document.getElementById("TabGNCL");
        var arr1=document.getElementById("TabGNXJ");
        var rightCL=document.getElementById("infoGNCL");
        var rightXJ=document.getElementById("infoGNXJ");
        arr.classList.add("forest");
        arr1.classList.remove("forest");
        rightXJ.classList.add("none");
        rightCL.classList.remove("none");
    }
    function TabGNXJ() {
        var arr=document.getElementById("TabGNCL");
        var arr1=document.getElementById("TabGNXJ");
        var rightCL=document.getElementById("infoGNCL");
        var rightXJ=document.getElementById("infoGNXJ");
        arr1.classList.add("forest");
        arr.classList.remove("forest");
        rightCL.classList.add("none");
        rightXJ.classList.remove("none");
    }
    function TabGWCL() {
        var arr=document.getElementById("TabGWCL");
        var arr1=document.getElementById("TabGWXJ");
        var rightCL=document.getElementById("infoGWCL");
        var rightXJ=document.getElementById("infoGWXJ");
        arr.classList.add("forest1");
        arr1.classList.remove("forest1");
        rightXJ.classList.add("none");
        rightCL.classList.remove("none");
    }
    function TabGWXJ() {
        var arr=document.getElementById("TabGWCL");
        var arr1=document.getElementById("TabGWXJ");
        var rightCL=document.getElementById("infoGWCL");
        var rightXJ=document.getElementById("infoGWXJ");
        arr1.classList.add("forest1");
        arr.classList.remove("forest1");
        rightCL.classList.add("none");
        rightXJ.classList.remove("none");
    }
    function leftCL() {
        var arr=document.getElementById("leftCL");
        var arr1=document.getElementById("leftXJ");
        var rightCL=document.getElementById("rightCL");
        var rightXJ=document.getElementById("rightXJ");
        rightCL.classList.remove("none");
        rightXJ.classList.add("none");
        arr.classList.add("active");
        arr1.classList.remove("active");
    }
    function leftXJ() {
        var arr=document.getElementById("leftCL");
        var arr1=document.getElementById("leftXJ");
        var rightCL=document.getElementById("rightCL");
        var rightXJ=document.getElementById("rightXJ");
        rightXJ.classList.remove("none");
        rightCL.classList.add("none");
        arr1.classList.add("active");
        arr.classList.remove("active");
    }
    function gncl() {
        var arr=document.getElementById("gncl");
        var arr1=document.getElementById("gjcl");
        document.getElementById("CLtype1").value='true';
        arr.classList.add("gnxjac");
        arr1.classList.remove("gnxjac");
    }
    function gjcl() {
        var arr=document.getElementById("gncl");
        var arr1=document.getElementById("gjcl");
        document.getElementById("CLtype1").value='false';
        arr.classList.remove("gnxjac");
        arr1.classList.add("gnxjac");
    }
    function gnxj() {
        var arr=document.getElementById("gnxj");
        var arr1=document.getElementById("gjxj");
        document.getElementById("XJtype1").value='true';
        arr.classList.add("gnxjac");
        arr1.classList.remove("gnxjac");
    }
    function gjxj() {
        var arr=document.getElementById("gnxj");
        var arr1=document.getElementById("gjxj");
        document.getElementById("XJtype1").value='false';
        arr.classList.remove("gnxjac");
        arr1.classList.add("gnxjac");
    }
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo1'});//绑定元素
        laydate({elem: '#demo2'});//绑定元素
        laydate({elem: '#demo3'});//绑定元素
        laydate({elem: '#demo4'});//绑定元素
        laydate({elem: '#demo5'});//绑定元素
        laydate({elem: '#demo6'});//绑定元素
        laydate({elem: '#demo7'});//绑定元素
        laydate({elem: '#demo8'});//绑定元素
        laydate({elem: '#demo9'});//绑定元素
    }();
    //新方法，从数据库获得每种类型的城市的id
    var labelFromcity = new Array();
    labelFromcity['热门城市'] = new Array();
    labelFromcity ['A-F'] = new Array();
    labelFromcity ['G-J'] = new Array();
    labelFromcity ['K-N'] = new Array();
    labelFromcity ['O-W'] = new Array();
    labelFromcity ['X-Z'] = new Array();
    var interlabelFromcity = new Array();
    interlabelFromcity ['国际城市'] = new Array();
    var hotList = new Array(14, 15, 16, 17, 18, 19);
    $.ajax({
        type : "post",
        url : "selectCityType",
        data: {},
        dataType: "json",
        async : false,
        success : function(results){
            console.log(results);
            for(var i =0;i<results.rm.length;i++){
                labelFromcity['热门城市'][i]=results.rm[i].cid;
            }
            for(var i =0;i<results.a_f.length;i++){
                labelFromcity[['A-F']][i]=results.a_f[i].cid;
            }
            for(var i =0;i<results.g_j.length;i++){
                labelFromcity[['G-J']][i]=results.g_j[i].cid;
            }
            for(var i =0;i<results.k_n.length;i++){
                labelFromcity[['K-N']][i]=results.k_n[i].cid;
            }
            for(var i =0;i<results.o_w.length;i++){
                labelFromcity[['O-W']][i]=results.o_w[i].cid;
            }
            for(var i =0;i<results.x_z.length;i++){
                labelFromcity[['X-Z']][i]=results.x_z[i].cid;
            }
            for(var i =0;i<results.gjcs.length;i++){
                interlabelFromcity ['国际城市'][i]=results.gjcs[i].cid;
            }
        }
    });
    var citysFlight = new Array();
    //新方法，加载页面的时候把所有的城市的数据加载出来
    $.ajax({
        type: "post",
        url: "selectCityTypeAll",
        data: {},
        dataType: "json",
        async: false,
        success: function (results) {
            for (var i = 0; i < results.citys.length; i++) {
                citysFlight[results.citys[i].id] = new Array('', results.citys[i].chinese, results.citys[i].pinyin, results.citys[i].abbreviations);
            }
        }
    });
    //国内闲居
    $('#zmx').querycity({'data': citysFlight, 'tabs': labelFromcity, 'hotList': hotList});
    //国际闲居
    $('#fromcity').querycity({'data': citysFlight, 'tabs': interlabelFromcity, 'hotList': hotList});
    //国内丛林
    $('#yyqx').querycity({'data': citysFlight, 'tabs': labelFromcity, 'hotList': hotList});
    //国际丛林
    $('#jackson').querycity({'data': citysFlight, 'tabs': interlabelFromcity, 'hotList': hotList});
    //以前的方法，js写死城市数据
    //labelFromcity['热门城市'] = new Array();
    //labelFromcity ['A-F'] = new Array(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,38,39);
    //labelFromcity ['G-J'] = new Array(40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85);
    //labelFromcity ['K-N'] = new Array(86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124);
    //labelFromcity ['O-W'] = new Array(125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184);
    //labelFromcity ['X-Z'] = new Array(185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231);

    //var interlabelFromcity = new Array();
    //interlabelFromcity ['国际城市'] = new Array(1001,1002,1003,1004,1005,1006,1007,1008,1009);
    //var hotList = new Array(14,15,16,17,18,19);

    $(document).ready(function () {

    });

    //des     目的地
    //sttime  入住时间
    //entime  退房时间
    //keyword 关键词
    function xj(des, sttime, entime, keyword) {
        alert(des + sttime + entime + keyword);
    }

    //将城市转换为拼音+城市名字
    function getCity(type, id) {
        var citypy;
        var cityzw;
        switch (id) {
            case zmx:
                citypy = $('#zmx').attr('data-wholename');
                cityzw = $('#zmx').val();
                break;
            case fromcity:
                citypy = $('#fromcity').attr('data-wholename');
                cityzw = $('#fromcity').val();
                break;
            case yyqx:
                citypy = $('#yyqx').attr('data-wholename');
                cityzw = $('#yyqx').val();
                break;
            case jackson:
                citypy = $('#jackson').attr('data-wholename');
                cityzw = $('#jackson').val();
                break;
        }
        var city = document.getElementById("city" + type);
        city.value = citypy + "|" + cityzw;
    }

    function goOther(type11, type2, city1) {
        var city = city1;
        city = encodeURI(city);
        city = encodeURI(city);//注意要两次
        var type1 = false;
        if (type11 == 1) {
            type1 = true;
        } else {
            type1 = false;
        }
        if (type2 == 1) {
            window.location.href = "selectCLByIndex?type2=true&type1=" + type1 + "&city=" + city;
        } else {
            window.location.href = "selectJungleByIndex?type2=false&type1=" + type1 + "&city=" + city;
        }
    }
</script>
</body>
</html>