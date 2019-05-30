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
    <%--<script type='text/javascript' src='${path}/static/js/querycity.js'></script>--%>
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
                var $tjbottom = input.closest('.tj-bottom');
                $tjbottom.append("<div id='pop_city_"+input.attr('id')+"' class='pop_city' style='display:none'><p class='pop_head'></p><ul class='list_label'></ul><div class='pop_city_container'></div></div>");
                $tjbottom.append("<div id='suggest_city_"+input.attr('id')+"' class='list_city' style='display:none'><div class='list_city_head'></div><div class='list_city_container'></div><div class='page_break'></div></div>");
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
                            city_container.append("<a href='javascript:void(0)' style='display:none' data-wholename='"+_data[2]+"'><span>"+_data[2]+"</span><b>"+     _data[1] +"</b></a>");
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
                            $("#label_"+input.attr('id')+index+"_container").append("<li><a href='javascript:void(0)' data-wholename='"+options.data[cityCode][2]+"'>"+options.data[cityCode][1]+"</a></li>");
                        }
                    }
                }
                function resetPosition(){
                    popMain.css({'top':105,'left':196});

//            popMain.css({'top':input.position().top+input.outerHeight(),'left':input.position().left});

                    suggestMain.css({'top':105,'left':196});
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
    <link href='${path}/static/style/cityquery.css' rel="stylesheet" type="text/css"/>
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
                                            <td class="sec"><input type="text" placeholder="请输入城市名" id="yyqx"
                                                                   data-wholename=""></td>
                                            <input type="hidden" name="clxjmain.belong_city" id="city11"/>
                                            <input type="hidden" id="CLtype1" name="type1" value="true"/>
                                            <input type="hidden" id="CLtype2" name="type2" value="true"/>
                                        </tr>
                                        <tr>
                                            <td>入住</td>
                                            <td><p><input name="startTime" class="laydate-icon ts" id="demo5"
                                                          value="2019-1-11"></p>

                                                <p>退房：<input name="endTime" class="laydate-icon" id="demo6"
                                                             value="2019-8-21"></p></td>
                                        </tr>
                                        <tr>
                                            <td>关键词</td>
                                            <td class="sec"><input type="text" name="clxjmain.name"
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
                                                <input type="text" placeholder="请输入城市名" id="zmx" data-wholename="">
                                                <input type="hidden" name="clxjmain.belong_city" id="city10"/>
                                                <input type="hidden" id="XJtype1" name="type1" value="true"/>
                                                <input type="hidden" id="XJtype2" name="type2" value="false"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>入住</td>
                                            <td><p><input name="startTime" class="laydate-icon ts" id="demo1"
                                                          value="2019-1-2"></p>

                                                <p>退房：<input name="endTime" class="laydate-icon" id="demo2"
                                                             value="2019-4-12"></p></td>
                                        </tr>
                                        <tr>
                                            <td>关键词</td>
                                            <td class="sec"><input type="text" name="clxjmain.name"
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
        <p class="rmtj">热门推荐${ceshi}<i>明月松间照，清泉石上流</i></p>

        <div class="taq1">
            <div>
                <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${topid1}"><img width="466" height="320"
                                                                                           src="${clxjBackurl }${top1 }"></a>
            </div>
            <span></span><span class="mfcy"><a
                href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${topid1}">${topname1 }</a> </span>
        </div>
        <div class="taq1 spec">
            <div>
                <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${topid2}"> <img width="467" height="320"
                                                                                            src="${clxjBackurl }${top2 }"></a>
            </div>
            <span></span><span class="mfcy"><a
                href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${topid2}">${topname2 }</a> </span>
        </div>
        <div class="taq2 spec">
            <div>
                <div>
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${topid3}"><img width="224" height="141"
                                                                                               src="${clxjBackurl }${top3 }"></a>
                    <span></span><span class="mfcy"><a
                        href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${topid3}">${topname3 }</a> </span>
                </div>
                <div class="spec2">
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${topid4}"><img width="224" height="141"
                                                                                               src="${clxjBackurl }${top4 }"></a>
                    <span></span><span class="mfcy"><a
                        href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${topid4}">${topname4 }</a> </span>
                </div>
            </div>
        </div>
    </div>
    <div id="a2" class="index-domestic">
        <div class="rmtj">
            <div class="rmtj1">国内<i>明月松间照，清泉石上流</i></div>
            <div class="rmtj2"><span class="forest">丛林</span><span>闲居</span></div><!--
            <div class="rmtj3"><a href="javascript:void(0)">更多国内游></a> </div>
        --></div>
        <div class="im-main">
            <div class="one">
                <div class="one-left">
                    <p class="rm">热门目的地</p>
                    <ul class="city">
                        <c:forEach items="${domesticHotCitys}" var="domestic">
                            <li><a href="javascript:void(0)"
                                   onclick="goOther(1,1,'${domestic.all }')">${domestic.chinese }</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="one-con">
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id1}"><img width="467"
                                                                                                  height="320"
                                                                                                  src="${clxjBackurl }${type111 }"></a>
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id1}"><span>${type11name1 }</span></a>
                </div>
                <div class="one-right">
                    <div class="or-one">
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id2}"> <img width="223"
                                                                                                           height="142"
                                                                                                           src="${clxjBackurl }${type112 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id2}"><span>${type11name2 }</span></a>
                        </div>
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id3}"><img width="223"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${type113 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id3}"><span>${type11name3 }</span></a>
                        </div>
                    </div>
                    <div class="or-two">
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id4}"><img width="224"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${type114 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id4}"><span>${type11name4 }</span></a>
                        </div>
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id5}"><img width="224"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${type115 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type11id5}"><span>${type11name5 }</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="one none">
                <div class="one-left">
                    <p class="rm">热门目的地</p>
                    <ul class="city">
                        <c:forEach items="${domesticHotCitys}" var="domestic2">
                            <li><a href="javascript:void(0)"
                                   onclick="goOther(1,0,'${domestic2.all }')">${domestic2.chinese }</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="one-con">
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id1}"><img width="467"
                                                                                                  height="320"
                                                                                                  src="${clxjBackurl }${type101 }"></a>
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id1}"><span>${type10name1 }</span></a>
                </div>
                <div class="one-right">
                    <div class="or-one">
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id2}"><img width="223"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${type102 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id2}"><span>${type10name2 }</span></a>
                        </div>
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id3}"><img width="223"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${type103 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id3}"><span>${type10name3 }</span></a>
                        </div>
                    </div>
                    <div class="or-two">
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id4}"><img width="224"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${type104 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id4}">
                                <span>${type10name4 }</span></a>
                        </div>
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id5}"><img width="224"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${type105 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type10id5}"><span>${type10name5 }</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="a3" class="index-abroad">
        <div class="rmtj">
            <div class="rmtj1">境外<i>明月松间照，清泉石上流</i></div>
            <div class="rmtj2"><span class="forest1">丛林</span><span>闲居</span></div><!--
            <div class="rmtj3"><a href="javascript:void(0)">更多国内游></a> </div>
        --></div>
        <div class="ia-main">
            <div class="one">
                <div class="one-left">
                    <p class="rm">热门目的地</p>
                    <ul class="city">
                        <c:forEach items="${abroadHotCitys}" var="abroad">
                            <li><a href="javascript:void(0)"
                                   onclick="goOther(0,1,'${abroad.all }')">${abroad.chinese }</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="one-con">
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id1}"><img width="465"
                                                                                                  height="320"
                                                                                                  src="${clxjBackurl }${type011 }"></a>
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id1}"><span>${type01name1 }</span></a>
                </div>
                <div class="one-right">
                    <div class="or-one">
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id2}"><img width="223"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${type012 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id2}"><span>${type01name2 }</span></a>
                        </div>
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id3}"> <img width="225"
                                                                                                           height="141"
                                                                                                           src="${clxjBackurl }${type013 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id3}"><span>${type01name3 }</span></a>
                        </div>
                    </div>
                    <div class="or-two">
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id4}"> <img width="224"
                                                                                                           height="142"
                                                                                                           src="${clxjBackurl }${type014 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id4}"><span>${type01name4 }</span></a>
                        </div>
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id5}"> <img width="224"
                                                                                                           height="141"
                                                                                                           src="${clxjBackurl }${type015 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type01id5}"><span>${type01name5 }</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="one none">
                <div class="one-left">
                    <p class="rm">热门目的地</p>
                    <ul class="city">
                        <c:forEach items="${abroadHotCitys}" var="abroad2">
                            <li><a href="javascript:void(0)"
                                   onclick="goOther(0,0,'${abroad2.all }')">${abroad2.chinese }</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="one-con">
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id1}"><img width="465"
                                                                                                  height="320"
                                                                                                  src="${clxjBackurl }${type001 }"></a>
                    <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id1}">
                        <span>${type00name1 }</span></a>
                </div>
                <div class="one-right">
                    <div class="or-one">
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id2}"><img width="223"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${type002 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id2}"><span>${type00name2 }</span></a>
                        </div>
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id3}"><img width="225"
                                                                                                          height="141"
                                                                                                          src="${clxjBackurl }${type003 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id3}"><span>${type00name3 }</span></a>
                        </div>
                    </div>
                    <div class="or-two">
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id4}"><img width="224"
                                                                                                          height="142"
                                                                                                          src="${clxjBackurl }${type004 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id4}"><span>${type00name4 }</span></a>
                        </div>
                        <div>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id5}"> <img width="224"
                                                                                                           height="141"
                                                                                                           src="${clxjBackurl }${type005 }"></a>
                            <a href="<%=path%>/clxjmain!selClxjOfId.action?clxjmain.id=${type00id5}"><span>${type00name5 }</span></a>
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
                <p><input type="text" placeholder="请输入捐款人姓名"></p>
                <p><input type="text" placeholder="请输入捐款金额"></p>
                <p><a href="${path}/FoundDonations.jsp"><input type="submit" value="在线捐赠"></a></p>
            </div>
            <form action="${path}/DonationLove.jsp" method="post">
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
            <p class="ckax"><img src="${path}/images/07.png">实时查看基金会总爱心金额</p>
            <p class="money">${moneyCountStr }</p>
            <p><img src="${path}/images/jk_03.jpg"></p>
            <p class="xz"><span class="one"><a href="${path}/qiantai/PLpublicity.jsp">捐款支出细则</a> </span><span
                    class="two"><a href="${path}/qiantai/FoundIndex.jsp">基金会简介</a> </span></p>
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
<script src="${path}/static/js"></script>
<script src="${path}/static/js/scorll.js"></script>
<script type="text/javascript">
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
    /*
        function(){
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
        }();*/
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
            window.location.href = "<%=path%>/clxjmain!selClOfPage.action?clxjmain.type2=true&clxjmain.type1=" + type1 + "&city=" + city;
        } else {
            window.location.href = "<%=path%>/clxjmain!selXjOfPage.action?clxjmain.type2=false&clxjmain.type1=" + type1 + "&city=" + city;
        }
    }
</script>
</body>
</html>