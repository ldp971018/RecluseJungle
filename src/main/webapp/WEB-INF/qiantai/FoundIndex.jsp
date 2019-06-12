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
    <link rel="stylesheet" href="<%=path%>/static/style/cy.css">
    <link rel="stylesheet" href="<%=path%>/static/style/style.css">

</head>
<body>
<div>
    <!--首页TOP-->
    <div class="yc-txdd1">

        <!--首页banner-->
        <jsp:include page="head.jsp"/>
        <!--首页轮播图-->


        <!--用车-填写订单-->
        <div class="yc-txdd">
            <div class="yc-mbx">
                <p>当前位置：<a href="index.jsp" class="ll">丛林闲居网</a> > <a href="#" class="xz">基金会</a></p>
            </div>
            <div><img src="<%=path%>/static/images/jjh_03.jpg"></div>
            <div class="jjh-index">
                <div class="jjh-index-left">
                    <p class="jyjs">简要介绍</p>
                    <p class="jyxx">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江西济缘慈善基金会是江西丛林闲居投资有限公司于2016年元月联合多家有志于慈善事业的企业，在中国禅宗圣地江西宜春发起筹建，并拟报江西省民政厅登记注册的具有独立法人地位的私募基金会，其宗旨是济缘、慈善、养老、奉献。致力于救助、扶助有缘人和对丛林闲居发展有帮助的社会团体及单位，促进社会和谐发展与社会进步。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;丛林闲居利用网络和微信平台面向社会，运用佛教禅宗思想在丛林和闲居为有困惑的人士进行疏导，缓解人们的心理压力；运用丛林素斋全国连锁店的推广与运营，筹集慈善基金；运用佛教慈悲为怀的大慈大悲的理念与基金会济缘慈善的宗旨相结合，济缘有缘人安度晚年。促进社会和谐，实现“佛教就是解决人们所有问题”的宏愿。<br/>
                        基金会善款的募集模式：<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一、凡通过平台联系在丛林或闲居进行旅游、休闲、探索、修行等的朋友每次均需向基金会捐款人民币30元；<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二、社会有缘人士和团体的捐款；<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三、丛林素斋经营利润的30%。<br/>
                        基金会善款的发放：<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一、基金会资金的救助、扶助、帮助对象只限于向基金会捐过款的人士、社会团体以及给予过丛林闲居帮助过的单位；<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二、基金会筹集的每一笔善款都透明公开，接受捐赠人的监督；<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三、对每笔支出必须公示并按流程进行审批。
                    </p>
                    <p class="jjh-arrow">
                        <img src="<%=path%>/static/images/arrow_03.jpg">
                    </p>
                    <p class="jyjs">活动图片</p>
                    <div class="hdtp">
                        <img src="<%=path%>/static/images/hd1.jpg"><img src="<%=path%>/static/images/hd2.jpg"><img
                            src="<%=path%>/static/images/hd3.jpg"><img
                            src="<%=path%>/static/images/hd4.jpg"><img src="<%=path%>/static/images/hd5.jpg">
                        <img src="<%=path%>/static/images/hd6.jpg"><img src="<%=path%>/static/images/hd7.jpg"><img
                            src="<%=path%>/static/images/hd8.jpg"><img
                            src="<%=path%>/static/images/hd9.jpg"><img src="<%=path%>/static/images/hd10.jpg">
                        <img src="<%=path%>/static/images/hd11.jpg"><img src="<%=path%>/static/images/hd12.jpg"><img
                            src="<%=path%>/static/images/hd13.jpg"><img
                            src="<%=path%>/static/images/hd14.jpg"><img src="<%=path%>/static/images/hd15.jpg">
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


</div>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="../../static/js"></script>

</body>
</html>