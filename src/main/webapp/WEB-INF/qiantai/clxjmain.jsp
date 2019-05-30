<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ taglib prefix="s" uri="/struts-tags" %>--%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>丛林闲居-闲居-列表页</title>
    <link rel="stylesheet" href="/static/style/cy.css">
    <link rel="stylesheet" href="/static/style/style.css">
    <script src="/static/js/laydate.js"></script>
    <link rel="stylesheet" href="/static/style/laydate.css">
    <link rel="stylesheet" href="/static/js/molv/laydate.css">
    <script src="/static/js/jquery.min.js"></script>
    <script type='text/javascript' src='/static/js/citylist.js'></script>
    <%--<script type='text/javascript' src='/static/js/querycity1.js'></script>--%>
    <script type="text/javascript">
        (function($){
            $.querycity = function(input,options){
                var input = $(input);
                input.attr('autocomplete','off');
                if($.trim(input.val())=='' || $.trim(input.val())==options.defaultText){
                    input.val(options.defaultText).css('color','#aaa');
                }
                var t_pop_focus = false;
                var t_suggest_focus = false;
                var t_suggest_page_click = false;
                $('.tj-bottom').append("<div id='pop_city_"+input.attr('id')+"' class='pop_city' style='display:none'><p class='pop_head'></p><ul class='list_label'></ul><div class='pop_city_container'></div></div>");
                $('.tj-bottom').append("<div id='suggest_city_"+input.attr('id')+"' class='list_city' style='display:none'><div class='list_city_head'></div><div class='list_city_container'></div><div class='page_break'></div></div>");
                var popMain = $("#pop_city_"+input.attr('id'));
                var popContainer = popMain.find('.pop_city_container');
                var labelMain = popMain.find('.list_label');
                var suggestMain = $("#suggest_city_"+input.attr('id'));
                popMain.bgIframe();
                suggestMain.bgIframe();
                popInit();
                resetPosition();

                $(window).resize(function(){
                    resetPosition();
                });

                input.focus(function(){
                    if(t_suggest_page_click){
                        t_suggest_page_click = false;
                        return true;
                    }
                    suggestMain.hide();
                    if($.trim($(this).val())==options.defaultText){
                        $(this).val('').css('color','#000');
                    }
                    popMain.show();
                }).click(function(){
                    if(t_suggest_page_click){
                        t_suggest_page_click = false;
                        return;
                    }
                    suggestMain.hide();
                    popMain.show();
                }).blur(function(){
                    if(t_pop_focus == false){
                        popMain.hide();
                        if($.trim(input.val())=='' || $.trim(input.val())==options.defaultText){
                            input.val(options.defaultText).css('color','#aaa');
                        }
                    }
                });
                labelMain.find('a').live('click',function(){
                    input.focus();//使焦点在输入框，避免blur事件无法触发
                    t_pop_focus = true;
                    var labelId = $(this).attr('id');
                    labelMain.find('li a').removeClass('current');
                    $(this).addClass('current');
                    popContainer.find('ul').hide();
                    $("#"+labelId+'_container').show();
                });
                popContainer.find('a').live('click',function(){
                    input.attr("data-wholename",$(this).attr("data-wholename"));
                    input.val($(this).html());
                    popMain.hide();
                });
                popMain.mouseover(function(){
                    t_pop_focus = true;
                }).mouseout(function(){
                    t_pop_focus = false;
                });

                input.blur(function(){
                    if( t_suggest_focus == false ){
                        if($(this).val()==''){
                            $(this).val( suggestMain.find('.list_city_container a.selected').children('b').text());
                        }
                        suggestMain.hide();
                    }
                    if($.trim(input.val())=='' || $.trim(input.val())==options.defaultText){
                        $(this).attr("data-wholename","");
                    }
                }).keydown(function(event){
                    popMain.hide();
                    event = window.event || event;
                    var keyCode = event.keyCode || event.which || event.charCode;
                    if (keyCode == 37) {//左
                        prevPage();
                    } else if (keyCode == 39) {//右
                        nextPage();
                    }else if(keyCode == 38){//上
                        prevResult();
                    }else if(keyCode == 40){//下
                        nextResult();
                    }
                }).keypress(function(event){
                    event = window.event || event;
                    var keyCode = event.keyCode || event.which || event.charCode;
                    if(13 == keyCode){
                        if(suggestMain.find('.list_city_container a.selected').length > 0){
                            input.attr("data-wholename",suggestMain.find('.list_city_container a.selected').attr("data-wholename"));
                            input.val(suggestMain.find('.list_city_container a.selected').children('b').text());
                            suggestMain.hide();
                        }
                    }
                }).keyup(function(event){
                    event = window.event || event;
                    var keyCode = event.keyCode || event.which || event.charCode;
                    if(keyCode != 13 && keyCode != 37 && keyCode != 39 && keyCode !=9 && keyCode !=38 && keyCode !=40 ){
                        //keyCode == 9是tab切换键
                        queryCity();
                    }
                });

                suggestMain.find('.list_city_container a').live('click',function(){
                    input.attr("data-wholename",$(this).attr("data-wholename"));
                    input.val($(this).children('b').text());
                    suggestMain.hide();
                }).live('mouseover',function(){
                    t_suggest_focus = true;
                }).live('mouseout',function(){
                    t_suggest_focus = false;
                });
                suggestMain.find('.page_break a').live('mouseover',function(){
                    t_suggest_focus = true;
                }).live('mouseout',function(){
                    t_suggest_focus = false;
                });
                suggestMain.find('.page_break a').live('click',function(event){
                    t_suggest_page_click = true;
                    input.click();
                    if($(this).attr('inum') != null){
                        setAddPage($(this).attr('inum'));
                    }
                });

                function nextPage(){
                    var add_cur= suggestMain.find(".page_break a.current").next();
                    if (add_cur != null) {
                        if ($(add_cur).attr("inum") != null) {
                            setAddPage($(add_cur).attr("inum"));
                        }
                    }
                }
                function prevPage(){
                    var add_cur = suggestMain.find(".page_break a.current").prev();
                    if (add_cur != null) {
                        if ($(add_cur).attr("inum") != null) {
                            setAddPage($(add_cur).attr("inum"));
                        }
                    }
                }
                function nextResult(){
                    var t_index = suggestMain.find('.list_city_container a').index(suggestMain.find('.list_city_container a.selected')[0]);
                    suggestMain.find('.list_city_container').children().removeClass('selected');
                    t_index += 1;
                    var t_end =  suggestMain.find('.list_city_container a').index( suggestMain.find('.list_city_container a:visible').filter(':last')[0]);
                    if(t_index > t_end ){
                        t_index = suggestMain.find('.list_city_container a').index(suggestMain.find('.list_city_container a:visible').eq(0));
                    }
                    suggestMain.find('.list_city_container a').eq(t_index).addClass('selected');
                }
                function prevResult(){

                    var t_index = suggestMain.find('.list_city_container a').index(suggestMain.find('.list_city_container a.selected')[0]);
                    suggestMain.find('.list_city_container').children().removeClass('selected');
                    t_index -= 1;
                    var t_start = suggestMain.find('.list_city_container a').index(suggestMain.find('.list_city_container a:visible').filter(':first')[0]);
                    if( t_index < t_start){
                        t_index = suggestMain.find('.list_city_container a').index(suggestMain.find('.list_city_container a:visible').filter(':last')[0]);
                    }
                    suggestMain.find('.list_city_container a').eq(t_index).addClass('selected');
                }
                function loadCity(){
                    var cityList = suggestMain.find('.list_city_container');
                    cityList.empty();
                    if(options.hotList){
                        var hotList = options.hotList;
                    }else{
                        var hotList = [0,1,2,3,4,5,6,7,8,9];
                    }
                    for(var item in hotList){
                        if(item>options.suggestLength){
                            return;
                        }
                        var _data = options.data[hotList[item]];
                        cityList.append("<a href='javascript:void(0)' ><span>"+_data[2]+"</span><b>"+_data[1]+"</b></a>");
                    }
                    suggestMain.find('.list_city_head').html(options.suggestTitleText);
                    setAddPage(1);
                    suggestMain.show();
                    setTopSelect();
                }
                function queryCity(){
                    popMain.hide();
                    var value = input.val().toLowerCase();
                    if( value.length == 0){
                        loadCity();
                        return;
                    }
                    var city_container = suggestMain.find('.list_city_container');
                    var isHave = false;
                    var _tmp = new Array();
                    for(var item in options.data){
                        var _data = options.data[item];
                        if(typeof (_data) != 'undefined'){
                            if(_data[2].indexOf(value) >= 0 || _data[3].indexOf(value) >= 0 || _data[1].indexOf(value) >=0 || _data[0].indexOf(value) >=0 ){
                                isHave = true;
                                _tmp.push(_data);
                            }
                        }
                    }
                    ;
                    if(isHave){
                        city_container.empty();
                        for(var item in _tmp){
                            var _data= _tmp[item];
                            city_container.append("<a href='javascript:void(0)' style='display:none'  data-wholename='"+_data[2]+"'><span>"+_data[2]+"</span><b>"+     _data[1] +"</b></a>");
                        }
                        suggestMain.find('.list_city_head').html(value+",按拼音排序");
                        setAddPage(1);
                        setTopSelect()
                    }else{
                        suggestMain.find('.list_city_head').html("<span class='msg'>对不起,找不到"+value+"</span>");
                    }
                    suggestMain.show();
                }
                function setAddPage(pageIndex){
                    suggestMain.find('.list_city_container a').removeClass('selected');
                    suggestMain.find('.list_city_container').children().each(function(i){
                        var k = i+1;
                        if(k> options.suggestLength*(pageIndex-1) && k <= options.suggestLength*pageIndex){
                            $(this).css('display','block');
                        }else{
                            $(this).hide();
                        }
                    });
                    setTopSelect();
                    setAddPageHtml(pageIndex);
                }
                function setAddPageHtml(pageIndex){
                    var cityPageBreak = suggestMain.find('.page_break');
                    cityPageBreak.empty();
                    if(suggestMain.find('.list_city_container').children().length > options.suggestLength){
                        var pageBreakSize = Math.ceil(suggestMain.find('.list_city_container').children().length/options.suggestLength);
                        if(pageBreakSize <= 1){
                            return;
                        }
                        var start = end = pageIndex;
                        for(var index = 0 ,num = 1 ; index < options.pageLength && num < options.pageLength; index++){
                            if(start > 1){
                                start--;num++;
                            }
                            if(end<pageBreakSize){
                                end ++;num++;
                            }
                        }
                        if(pageIndex > 1){
                            cityPageBreak.append("<a href='javascript:void(0)' inum='"+(pageIndex-1)+"'>&lt;-</a>");
                        }
                        for(var i=start;i<=end;i++){
                            if(i == pageIndex){
                                cityPageBreak.append("<a href='javascript:void(0)' class='current' inum='"+(i)+"'>"+(i)+"</a>");
                            }else{
                                cityPageBreak.append("<a href='javascript:void(0)' inum='"+(i)+"'>"+(i)+"</a>");
                            }
                        }
                        if (pageIndex<pageBreakSize) {
                            cityPageBreak.append("<a href='javascript:void(0);' inum='"+ (i) +"'>-&gt;</a>");
                        }
                        cityPageBreak.show();
                    }else{
                        cityPageBreak.hide();
                    }
                    return;
                }
                function setTopSelect(){
                    if(suggestMain.find('.list_city_container').children().length > 0 ){
                        suggestMain.find('.list_city_container').children(':visible').eq(0).addClass('selected');
                    }
                }
                function onSelect(){
                    if( typeof options.onSelect == 'function'){
                        alert(1);
                    }
                }
                function popInit(){
                    var index = 0;
                    popMain.find('.pop_head').html(options.popTitleText);
                    if(!options.tabs){
                        popContainer.append("<ul id='label_"+input.attr('id')+"_container' class='current'></ul>");
                        labelMain.remove();
                        for( var item in options.data){
                            $("#label_"+input.attr('id')+"_container").append("<li><a href='javascript:void(0)'>"+options.data[item][1]+"</a></li>");
                        }
                        return;
                    }
                    for(var itemLabel in options.tabs){
                        index++;
                        if(index == 1){
                            popContainer.append("<ul id='label_"+input.attr('id')+index+"_container' class='current' data-type='"+itemLabel+"'></ul>");
                            labelMain.append("<li><a id='label_"+input.attr('id')+index+"' class='current' href='javascript:void(0)'>"+itemLabel+"</a></li>");
                        }else{
                            popContainer.append("<ul style='display:none' id='label_"+input.attr('id')+index+"_container' data-type='"+itemLabel+"'></ul>");
                            labelMain.append("<li><a id='label_"+input.attr('id')+index+"' href='javascript:void(0)'>"+itemLabel+"</a></li>");
                        }
                        for(var item in options.tabs[itemLabel]){
                            var cityCode = options.tabs[itemLabel][item];
                            if(!options.data[cityCode]){
                                break;
                            }
                            $("#label_"+input.attr('id')+index+"_container").append("<li><a href='javascript:void(0)'  data-wholename='"+options.data[cityCode][2]+"'>"+options.data[cityCode][1]+"</a></li>");
                        }
                    }
                }
                function resetPosition(){
                    popMain.css({'top':105,'left':80});

//            popMain.css({'top':input.position().top+input.outerHeight(),'left':input.position().left});

                    suggestMain.css({'top':105,'left':80});
//            suggestMain.css({'top':input.position().top+input.outerHeight(),'left':input.position().left});
                }
            }
            $.fn.querycity = function(options){
                var defaults = {
                    'data'          : {},
                    'tabs'          : '',
                    'hotList'       : '',
                    'defaultText'   : '请选择城市',
                    'popTitleText'  : '请选择城市或输入城市名称的拼音或英文',
                    'suggestTitleText' : '输入中文/拼音或↑↓选择',
                    'suggestLength' : 10,
                    'pageLength'    : 5,
                    'onSelect'      : ''
                };
                var options = $.extend(defaults,options);
                this.each(function(){
                    new $.querycity(this,options);
                });
                return this;
            };
        })(jQuery);


        (function($){
            $.fn.bgIframe = $.fn.bgiframe = function(s) {
                if ( $.browser.msie && /6.0/.test(navigator.userAgent) ) {
                    s = $.extend({
                        top     : 'auto', // auto == .currentStyle.borderTopWidth
                        left    : 'auto', // auto == .currentStyle.borderLeftWidth
                        width   : 'auto', // auto == offsetWidth
                        height  : 'auto', // auto == offsetHeight
                        opacity : true,
                        src     : 'javascript:false;'
                    }, s || {});
                    var prop = function(n){return n&&n.constructor==Number?n+'px':n;},
                        html = '<iframe class="bgiframe"frameborder="0"tabindex="-1"src="'+s.src+'"'+
                            'style="display:block;position:absolute;z-index:-1;'+
                            (s.opacity !== false?'filter:Alpha(Opacity=\'0\');':'')+
                            'top:'+(s.top=='auto'?'expression(((parseInt(this.parentNode.currentStyle.borderTopWidth)||0)*-1)+\'px\')':prop(s.top))+';'+
                            'left:'+(s.left=='auto'?'expression(((parseInt(this.parentNode.currentStyle.borderLeftWidth)||0)*-1)+\'px\')':prop(s.left))+';'+
                            'width:'+(s.width=='auto'?'expression(this.parentNode.offsetWidth+\'px\')':prop(s.width))+';'+
                            'height:'+(s.height=='auto'?'expression(this.parentNode.offsetHeight+\'px\')':prop(s.height))+';'+
                            '"/>';
                    return this.each(function() {
                        if ( $('> iframe.bgiframe', this).length == 0 )
                            this.insertBefore( document.createElement(html), this.firstChild );
                    });
                }
                return this;
            };
        })(jQuery);


    </script>
    <link href='/static/style/cityquery.css' rel="stylesheet" type="text/css" />
</head>
<body>
<!--首页TOP-->

<!--首页banner-->
<jsp:include  page="/WEB-INF/qiantai/head.jsp" />
<script type="text/javascript">
    function Alllogin(){
        window.location.href = "login?returnurl=/clxjmain!selXjOfPage.action";
    }
    function loginOut(){
        window.location.href = "<%=path%>/reguser!loginOut.action?returnurl=/clxjmain!selXjOfPage.action";
    }
    function Allregister(){
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
        <div class="gjcl">
            <div class="lbttj">
                <div class="tj-top">
                    <span id="gn" <c:if test="${clxjmain.type1 ==true}"> class="gnxjac"</c:if> <c:if test="${clxjmain.type1 ==null}"> class="gnxjac"</c:if> onclick="gn()">国内丛林</span ><span id="gj" <c:if test="${clxjmain.type1 ==false}"> class="gnxjac"</c:if> onclick="gj()">国际丛林</span>
                </div>
                <div class="tj-bottom">
                    <div class="xj">
                        <form action="selectCL" method="post" onsubmit="getCity('10',ones)">
                            <input type="hidden" id="type1" name="type1" <c:if test="${clxjmain.type1 ==true}"> value="true"</c:if> <c:if test="${clxjmain.type1 ==null}"> value="true"</c:if> <c:if test="${clxjmain.type1 ==false}"> value="false"</c:if>><%--设置国内外--%>
                            <input type="hidden" name="type2" value="true"><%--丛林--%>
                            <table>
                                <tr>
                                    <td>目的地</td>
                                    <td class="sec "><input type="text"  <c:if test="${clxjmain.belongCity!=null }">value="${clxjmain.belongCity }"</c:if>  <c:if test="${citypy!=null }"> data-wholename="${citypy }"</c:if><c:if test="${citypy==null }"> data-wholename=""</c:if> placeholder="请输入城市名" id="ones"></td>
                                    <input type="hidden" name="clxjmain.belong_city" id="city10"  <c:if test="${clxjmain.belongCity!=null }">value="${clxjmain.belongCity }"</c:if>>
                                </tr>
                                <tr>
                                    <td>入住</td>
                                    <td><p><input name="createtime" class="laydate-icon" id="demo1" <c:if test="${clxjmain.createtime !=null}">value="${clxjmain.createtime }"</c:if><c:if test="${clxjmain.createtime ==null}">value="2018-02-03"</c:if> >
                                    </p>

                                        <p>退房<input name="endTime" class="laydate-icon" id="demo2" <c:if test="${endTime !=null}">value="${endTime }"</c:if><c:if test="${endTime ==null}">value="2019-1-1"</c:if>>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td>关键词</td>
                                    <td class="sec"><input type="text" name="name"    <c:if test="${clxjmain.name==null }">placeholder="请输入地标/商圈/景点"</c:if> <c:if test="${clxjmain.name!=null }">value="${clxjmain.name }"</c:if> id="gnxjkey" ></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="ses sec"><input type="submit" value="搜索" /> </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="lby">
    <c:forEach items="${JungleList}" var="x">
        <div class="lby-xy">
            <div class="lby-left">
                <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${x.id}"><img width="296" height="188" src=${clxjBackurl }${x.firstImgMin }></a>
            </div>
            <div class="lby-right">
                <p class="title"><a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${x.id}">${x.name }</a></p>
                <p class="con">${x.introduction }</p>
                <p class="address">位  置:${x.address }</p>
            </div>
            <div class="lby-pos">
                <div>
                    <p class="one">
                        <span><i>${x.reserveNum }</i></span>
                        <span>闲居评价</span>
                    </p>
                    <p class="two">
                        <span><%--<i>${x.hpl }</i>--%></span>
                        <span>好评/10分</span>
                    </p>
                    <p class="yd">
                        <span class="mony">${x.price }<i>/晚</i></span>
                        <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${x.id}"><span class="dj">预定</span></a>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<form action="<%=path%>/clxjmain!selXjOfPage.action" method="post" id="xjForm">
    <input type="hidden" id="offset" name="offset" value="${offset }">
    <c:if test="${citytype !=null}"> <input type="hidden" name="clxjmain.type1" value="${citytype }"/></c:if>
    <input type="hidden" name="clxjmain.type2" value="${citytype2 }"/>
    <input type="hidden" name="clxjmain.name" value="${cityname }"/>
    <input type="hidden" name="clxjmain.belong_city" value="${belong_city }"/>
</form>
<div class="fenye">
    ${page.navigation }
</div>
<%@ include  file="bottom.jsp"%>


<script src="../../js"></script>
<script type="text/javascript">
    function gn() {
        var arr=document.getElementById("gn");
        var arr1=document.getElementById("gj");
        document.getElementById("type1").value='true';
        arr.classList.add("gnxjac");
        arr1.classList.remove("gnxjac");
    }
    function gj() {
        var arr=document.getElementById("gn");
        var arr1=document.getElementById("gj");
        document.getElementById("type1").value='false';
        arr.classList.remove("gnxjac");
        arr1.classList.add("gnxjac");
    }
    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#demo1'});//绑定元素
        laydate({elem: '#demo2'});//绑定元素
        laydate({elem: '#demo3'});//绑定元素
        laydate({elem: '#demo4'});//绑定元素
    }();

    //var labelFromcity = new Array();
    //labelFromcity ['热门城市'] = new Array(2,41,54,119,25,50,187,182,77,122,42,196,106,136,188,17,22,16,37,67,88,159,143,176,14,58,136,73);
    //labelFromcity ['A-F'] = new Array(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,38,39);
    //labelFromcity ['G-J'] = new Array(40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85);
    //labelFromcity ['K-N'] = new Array(86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124);
    //labelFromcity ['O-W'] = new Array(125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184);
    //labelFromcity ['X-Z'] = new Array(185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231);

    //var interlabelFromcity = new Array();
    //interlabelFromcity ['国际城市'] = new Array(1001,1002,1003,1004,1005,1006,1007,1008,1009);
    //var hotList = new Array(14,15,16,17,18,19);
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
    var hotList = new Array(14,15,16,17,18,19);
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
    $(document).ready(function(){
        var citysFlight=new Array();
        //新方法，加载页面的时候把所有的城市的数据加载出来
        $.ajax({
            type : "post",
            url : "selectCityTypeAll",
            data: {},
            dataType: "json",
            async : false,
            success : function(results){
                console.log(results.citys)
                for(var i =0;i<results.citys.length;i++){
                    citysFlight[results.citys[i].id]=new Array('',results.citys[i].chinese,results.citys[i].pinyin,results.citys[i].abbreviations);
                }
            }
        });
        $('#ones').querycity({'data':citysFlight,'tabs':labelFromcity,'hotList':hotList});
        $('#oness').querycity({'data':citysFlight,'tabs':interlabelFromcity,'hotList':hotList});

    });
    function pageClick(pagesize,limit)
    {
        document.getElementById("offset").value=pagesize;
        document.getElementById("xjForm").submit();
    }

    //des     目的地
    //sttime  入住时间
    //entime  退房时间
    //keyword 关键词
    function xjsearch(des,sttime,entime,keyword){
        alert(des+sttime+entime+keyword);
    }
    //将城市转换为拼音+城市名字
    function getCity(type,id){
        var citypy;
        var cityzw;
        switch (id) {
            case ones:
                citypy = $('#ones').attr('data-wholename');
                cityzw = $('#ones').val();
                break;
            case oness:
                citypy = $('#oness').attr('data-wholename');
                cityzw = $('#oness').val();
                break;
        }
        var city = document.getElementById("city"+type);
        city.value = citypy+"|"+cityzw;
    }
</script>
</body>
</html>