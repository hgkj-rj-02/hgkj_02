<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/06/22
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>途乐行--首页</title>
    <link href="qt/css/layout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="qt/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="qt/js/index.js"></script>
</head>
<body>
<!--头部-->
<div id="top-cont">
    <div id="top-min">
        <div id="min-left"></div>
        <div id="min-right"></div>
    </div>
</div>
<!--导航-->
<div id="menu">
    <div id="menu-m">
        <ul>
            <li><a href="qt_index.jsp">首页</a></li>
            <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            <c:forEach items="${linetypeList}" var="lineTypel" begin="0" end="2">
                <li><a href="qtAlltype.action">${lineTypel.typeName}</a></li>
                <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            </c:forEach>


            <li><a href="qtTeam.action">团购</a></li>
            <li><a href="qt_cart.jsp"><img src="qt/images/che.jpg" width="176" height="42" /></a></li>
        </ul>
    </div>
</div>
<!--广告位图片-->
<div id="banner"> <img src="qt/images/banner.jpg" width="1003" height="93" /></div>

<!--主体内容第一部分开始-->
<div id="content1">
    <!--左侧-->
    <div id="con1-left">

        <c:forEach items="${linetypeList}" var="linety">
            <div class="con1-1">
                ${linety.typeName}
            </div>
            <div class="cs">
                    <ul>
                        <c:forEach items="${lineList}" var="lineList">
                            <c:if test="${linety.lineTypeId eq lineList.linetype.lineTypeId}">
                                <li><a href="findCar.action?line.lineId=${lineList.lineId}&customer.customerId=${customerId}">${lineList.lineName}</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                    </div>
        </c:forEach>


    </div>
    <!--右侧-->
    <div id="con1-right">
        <div id="right-top">
            <div class="banner">
                <ul id="imgs">
                    <li><img src="qt/images/tg.jpg" width="540" height="240"/></li>
                    <li><img src="qt/images/tg2.jpg" width="540" height="240"/></li>
                    <li><img src="qt/images/tg3.jpg" width="540" height="240"/></li>
                    <li><img src="qt/images/tg4.jpg" width="540" height="240"/></li>
                </ul>
                <ul id="numbers">
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                </ul>
            </div>
            <div class="zcdl">
                <c:if test="${customerId ==null}">
                    <ul>
                        <li style="margin-right:3px;"><a href="qt_login.jsp"><img src="qt/images/dl.jpg" width="85" height="36" /></a></li>
                        <li><a href="qt_regist.jsp"><img src="qt/images/zc.jpg" width="85" height="36" /></a></li>
                    </ul>
                </c:if>
            </div>
            <div class="my">
                <ul>
                    <li><span class="myd">96%</span> 满意度</li>
                    <li class="xt">已有<span class="rs">2569874</span>人预订出游</li>
                    <li class="cls"><a href="#">查看历史订单</a></li>
                </ul>
            </div>
        </div>
        <div id="right-btm">
            <div class="tgj"><span><a href="#">更多旅游特价</a></span></div>
            <div class="tgjlx">
                <ul style="width:1446px">
                    <c:forEach items="${lineList}" var="lineList">
                       <c:if test="${lineList.teamBuy eq 1}" >
                           <li>
                               <c:forEach items="${lineList.pictureSet}" var="pict" begin="0" end="0">
                                   <a href="find.action?line.lineId=${lineList.lineId}"><img src="${pict.picname}" width="160" height="88" /></a>

                               </c:forEach>
                               <a href="find.action?line.lineId=${lineList.lineId}">${lineList.lineName}${lineList.days}</a><br />
                               <span>￥${lineList.teamBuyPrice}</span>起 原价${lineList.price}
                           </li>
                       </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--主体内容第一部分结束-->
<!--主体内容第二部分开始-->
<div id="con-2">
    <!--左侧开始-->
    <div id="con-2left">
        <div id="con-2left1">
            <div class="con-21"></div>
            <div class="jingdian">
                <ul>
                    <li><a href="#">古琴台</a></li>
                    <li><a href="#">黄鹤楼</a></li>
                    <li><a href="#">海洋世界</a></li>
                    <li><a href="#">武汉东湖</a></li>
                    <li><a href="#">木兰天地</a></li>
                    <li><a href="#">汉正街</a></li>
                    <li><a href="#">坝子岭</a></li>
                    <li><a href="#">武汉欢乐谷</a></li>
                </ul>
            </div>
            <div class="con-22"></div>
            <div class="jingdian">
                <ul>
                    <li><a href="#">澳门</a></li>
                    <li><a href="#">烟台</a></li>
                    <li><a href="#">仰光</a></li>
                    <li><a href="#">约旦</a></li>
                    <li><a href="#">伊朗</a></li>
                    <li><a href="#">德国</a></li>
                    <li><a href="#">缅甸</a></li>
                    <li><a href="#">希腊</a></li>
                </ul>
            </div>
            <div class="con-23"></div>
            <div class="jingdian">
                <ul>
                    <li><a href="#">北京</a></li>
                    <li><a href="#">上海</a></li>
                    <li><a href="#">加拿大</a></li>
                    <li><a href="#">香港</a></li>
                    <li><a href="#">海南</a></li>
                    <li><a href="#">马尔代夫</a></li>
                    <li><a href="#">韩国</a></li>
                    <li><a href="#">福建</a></li>
                </ul>
            </div>
            <div class="picj"><img src="qt/images/bb1.jpg" width="248" height="94" /></div>
            <div class="picj"><img src="qt/images/bb2.jpg" width="248" height="94" /></div>
            <div class="picj"><img src="qt/images/bb3.jpg" width="248" height="94" /></div>
        </div>
    </div>
    <!--左侧结束-->
    <!--右侧开始-->
    <div id="con-2right">
        <div id="con-2meun">
            <ul>
                <li><a href="#">境内游</a></li>
                <li><a href="#">境外游</a></li>
                <li><a href="#">海岛游</a></li>
                <li><a href="#">自驾游</a></li>
            </ul>
        </div>


        <c:forEach items="${lineList}" var="lineList">
            <div class="con-2inf">
                <ul>
                    <li class="w130">
                        <c:forEach items="${lineList.pictureSet}" var="ps" begin="0" end="0">
                            <a href="find.action?line.lineId=${lineList.lineId}"><img src="${ps.picname}" width="120" height="75" /></a>
                        </c:forEach>
                        产品编号：${lineList.lineId}</li>
                    <li class="w440">
                        <div class="w440lx"><a href="find.action?line.lineId=${lineList.lineId}">[${lineList.days}] &nbsp;&nbsp;${lineList.lineName}${lineList.days}游 &nbsp;&nbsp;交通工具（${lineList.vehicle}）</a></div>
                        <div class="w440xx"><a href="#">简介：${lineList.introduction}</a> <br />
                            本线路已有<span>5144</span>人出游 </div>
                    </li>
                    <li class="w140"><br />
                        <span>${lineList.price}元/每人</span></li>
                </ul>
            </div>
        </c:forEach>

    </div>
    <!--主体内容第二部分结束-->
    <!--底部-->
    <div id="foot">
        <div id="foot-t">
            <p>许可证编号：WE125482154 鄂ICP备125478966</p>
            <p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
        </div>
    </div>
</body>
</html>
