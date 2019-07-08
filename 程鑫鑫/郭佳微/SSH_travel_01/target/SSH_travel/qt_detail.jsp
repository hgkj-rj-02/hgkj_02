<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/06/22
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@include file="checkLine.jsp"%>--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>途乐行--旅游景点</title>
    <link href="qt/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="qt/css/jqzoom.css" rel="stylesheet" type="text/css" />
    <script src="qt/js/jquery-1.3.2.min.js"></script>
    <script src="qt/js/jquery.jqzoom1.0.1.js"></script>
    <script src="qt/js/jqzoom.pack.1.0.1.js"></script>
    <script src="qt/js/detail.js"></script>
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
<div id="banner"><img src="qt/images/banner.jpg" width="1003" height="93" /></div>

<!--主体内容第一部分开始-->
<div class="jindck">
    <div class="jindck-meun">[多重优惠+超值赠送]品质全景，${linel.lineName}纯玩双飞${linel.lineDays}日游
        <img src="qt/images/tjcp.jpg" width="40" height="40" /><img src="qt/images/fk.jpg" width="40" height="40" /></div>
    <div class="jin2">
        <div class="jin2-left">
            <ul>
                <c:forEach items="${linel.pictureSet}" var="line2" begin="0" end="0">
                <li>
                    <a href="" title="">
                        <img src="${line2.pictName}" width="400" height="250" />
                    </a>
                </li>
                </c:forEach>
                    <c:forEach items="${linel.pictureSet}" var="line2">
                     <li class="pics"><a href="${line2.pictName}" class="zoom" title="${linel.lineName}" ><img src="${line2.pictName}" width="70" height="43" /></a></li>
                    </c:forEach>
            </ul>
        </div>
        <div class="jin2-right">
            <ul>
                    <li>途乐行价：<span class="colorc">￥${linel.linePrice}</span></li>
                    <li>团购价：<strong>￥${linel.lineTeamBuyPrice}</strong> 起</li>
                    <li>最大优惠：￥100</li>
                    <li>出游天数：${linel.lineDays}</li>
                    <li>出游人数：已有<span>0</span>人出游此线路</li>
                    <li>提前报名：建议提前一天报名</li>
                        <form action="insertCar.action" method="post">
                            <input type="hidden" name="car.customer.customerId" value="${customer.customerId}">
                            <input type="hidden" name="car.line.lineId" value="${line.lineId}">
                     <li>
                         <input type="submit" src="qt/images/jgwc.jpg" width="122" height="42">
                        <%--<img src="qt/images/jgwc.jpg" width="122" height="42" />--%>
                        &nbsp;&nbsp;&nbsp;&nbsp;<a href="qt_order.jsp"><img src="qt/images/js.jpg" width="123" height="43" /></a>
                     </li>
                        </form>
            </ul>
        </div>
    </div>
    <div class="tuijian">
        <div class="tuijian-m">推荐理由</div>
        <div class="tuijian-inf">
            <ul>
                    <li>${linel.lineReason}</li>
            </ul>
        </div>
        <div class="tuijian-t">特别优惠</div>
        <div class="tuijian-inf">
            <ul>
                <li>凤凰古城是国家历史文化名城，曾被新西兰著名作家路易艾黎称赞为中国最美丽的小城。</li>
                <li>热热闹闹的土家风情园，感受当地独特的人文底蕴。</li>
                <li>武昌/长沙往返空调火车硬座，当地空调旅游车（保证一人一座）</li>
            </ul>
        </div>
    </div>
    <div class="jianjie">
        <div class="jianjie-m">景点简介</div>
            <div>${linel.lineIntroduction}</div>
    </div>
    <div class="tuijian">
        <div class="tuijian-m">温馨提示</div>
        <div class="tuijian-inf">
            <ul>
                <li> 按2人入住1间房核算，如出现单男单女，尽量安排该客人与其他同性别团友拼房；如不愿拼房或未能拼房，请补齐单房差以享用单人房间。 </li>
                <li> 当地购物时请慎重考虑，把握好质量与价格，务必索要发票。 </li>
                <li> 出团通知最晚于出团前1天发送，若能提前确定，我们将会第一时间通知您。 </li>
                <li> 出游过程中，如产生退费情况，以退费项目旅行社折扣价为依据，均不以挂牌价为准。 </li>
                <li> 如遇国家政策性调整门票、交通价格等，按调整后的实际价格结算。 </li>
            </ul>
        </div>
    </div>
</div>
<!--主体内容第一部分结束-->
<!--底部-->
<div id="foot">
    <div id="foot-t"><p>许可证编号：WE125482154 鄂ICP备125478966</p>
        <p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
    </div>
</div>
</body>
</html>
