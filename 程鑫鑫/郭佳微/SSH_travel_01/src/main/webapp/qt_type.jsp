<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/06/22
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@include file="checkLine.jsp"%>--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>境内游</title>
    <link href="qt/css/layout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="qt/js/jquery-1.11.0.min.js"></script>
    <script src="qt/js/type.js"></script>
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
            <li><a href="qtAllLinetype.action">首页</a></li>
            <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            <c:forEach items="${linetypeList}" var="linetypel" begin="0" end="2">
                <li><a href="allLineQtType.action">${linetypel.lineTypeName}</a></li>
                <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            </c:forEach>
            <li><a href="qtAllLine.action">团购</a></li>
            <li><a href="qt_cart.jsp"><img src="qt/images/che.jpg" width="176" height="42" /></a></li>
        </ul>
    </div>
</div>
<!--广告位图片-->
<div id="banner"> <img src="qt/images/banner.jpg" width="1003" height="93" /></div>

<!--主体内容第一部分开始-->
<div class="jindinf">
    <div class="jindinf-left">
        <ul>
            <li>当月景点推荐</li>
            <li>
                <c:forEach items="${lineList}" var="linel" begin="0" end="0">
                <a href="allLineDetail.action?line.lineId=${linel.lineId}">${linel.lineName}</a>
                </c:forEach>
                    <c:forEach items="${lineList}" var="linel" begin="1" end="1">
                    <a href="allLineDetail.action?line.lineId=${linel.lineId}">| ${linel.lineName}</a>
                </c:forEach>
            </li>
            <li>武汉热门景点</li>
            <li>
                <c:forEach items="${lineList}" var="linel" begin="2" end="2">
                <a href="allLineDetail.action?line.lineId=${linel.lineId}">${linel.lineName}</a></c:forEach>
                    <c:forEach items="${lineList}" var="linel" begin="3" end="3">
                    <a href="allLineDetail.action?line.lineId=${linel.lineId}">| ${linel.lineName}</a>
                </c:forEach>
            </li>
            <li>咸宁热门景点</li>
            <li>
                <c:forEach items="${lineList}" var="linel" begin="4" end="4">
                <a href="allLineDetail.action?line.lineId=${linel.lineId}">${linel.lineName}</a></c:forEach>
                    <c:forEach items="${lineList}" var="linel" begin="5" end="5">
                    <a href="allLineDetail.action?line.lineId=${linel.lineId}">| ${linel.lineName}</a>
                </c:forEach>
            </li>
            <li>宜昌热门景点</li>
            <li>
                <c:forEach items="${lineList}" var="linel" begin="6" end="6">
                <a href="allLineDetail.action?line.lineId=${linel.lineId}">${linel.lineName}</a></c:forEach>
                    <c:forEach items="${lineList}" var="linel" begin="7" end="7">
                    <a href="allLineDetail.action?line.lineId=${linel.lineId}">| ${linel.lineName}</a>
                </c:forEach>
            </li>
            <li>热门景点酒店</li>
            <li>
                <c:forEach items="${lineList}" var="linel" begin="8" end="8">
                <a href="allLineDetail.action?line.lineId=${linel.lineId}">${linel.lineName}</a></c:forEach>
                <c:forEach items="${lineList}" var="linel" begin="9" end="9">
                    <a href="allLineDetail.action?line.lineId=${linel.lineId}">|${linel.lineName} </a>
                </c:forEach>
            </li>
        </ul>
    </div>
    <div class="jindinf-right">
        <ul class="jnImgs">
            <li><a href="#"><img src="qt/images/jn1.jpg" /></a></li>
            <li><a href="#"><img src="qt/images/jn2.jpg" /></a></li>
            <li><a href="#"><img src="qt/images/jn3.jpg" /></a></li>
            <li><a href="#"><img src="qt/images/jn4.jpg" /></a></li>
            <li><a href="#"><img src="qt/images/jn5.jpg" /></a></li>
            <li><a href="#"><img src="qt/images/jn6.jpg" /></a></li>
            <li><a href="#"><img src="qt/images/jn7.jpg" /></a></li>
            <li><a href="#"><img src="qt/images/jn8.jpg" /></a></li>
            <li><a href="#"><img src="qt/images/jn9.jpg" /></a></li>
            <li><a href="#"><img src="qt/images/jn10.jpg" /></a></li>

        </ul>
        <ul class="jnText">
            <li>丽江千古情</li>
            <li>错峰出游抄底</li>
            <li>妇女节特辑</li>
            <li>三亚自由行</li>
            <li>踏青至福建</li>
            <li>新云南心旅程</li>
            <li>东北特色游</li>
            <li>张家界风情</li>
            <li>三亚特价抄底</li>
            <li>洛阳牡丹节</li>
        </ul>
    </div>
</div>
<!--主体内容第一部分结束-->
<!--主体内容第二部分开始-->
<div class="huodong">
    <div class="huodong-meun1">最新活动</div>
    <div class="huodong-inf">
        <ul>
            <c:forEach items="${lineList}" var="linel">
            <li><c:forEach items="${linel.pictureSet}" var="line2" begin="0" end="0">
                <img src="${line2.pictName}" width="180" height="120" />
            </c:forEach>
                时间：${linel.lineOnTime}<p>${linel.lineName}${linel.lineDays}日游</p></li>
            </c:forEach>
        </ul>
    </div>
    <div></div>
</div>
<!--主体内容第二部分结束-->
<!--主体内容第三部分开始-->
<div class="jinrtg">
    <div class="jinrtg-meun">今日景点团购</div>
    <div class="jinrtg-inf">
        <ul>
            <c:forEach items="${lineList}" var="linel" begin="0" end="4">
                <c:if test="${linel.lineTeamBuy==1}">
            <li>
                <c:forEach items="${linel.pictureSet}" var="line2" begin="0" end="0">
                <div class="w16"><img src="${line2.pictName}" width="160" height="120" /></div>
                </c:forEach>
                <div class="w16-r">(团购)${linel.lineName}</div>
                <div class="w16-rx">团购价<span>￥${linel.lineTeamBuyPrice}</span> 节省${linel.linePrice-linel.lineTeamBuyPrice}<img src="qt/images/qg.jpg" width="92" height="32" /></div>
            </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
<!--主体内容第三部分结束-->
<!--主体内容第四部分开始-->
<div class="jdtj">
    <div class="jdtj-meun">推荐景点</div>
    <div class="jdtj-inf">
        <ul>
            <c:forEach items="${lineList}" var="linel" begin="0" end="7">
            <li>
                <c:forEach items="${linel.pictureSet}" var="line2" begin="0" end="0">
                <img src="${line2.pictName}" width="240" height="160" />
                </c:forEach>
                <span>推荐理由：</span>${linel.lineIntroduction}</li>
            </c:forEach>
        </ul>
    </div>
    <div class="jdfy"><a href="#">首页</a>&nbsp;&nbsp;&nbsp;<a href="#">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">尾页</a></div>
</div>
<!--主体内容第四部分结束-->
<!--底部-->
<div id="foot">
    <div id="foot-t"><p>许可证编号：WE125482154 鄂ICP备125478966</p>
        <p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
    </div>
</div>
</body>
</html>
