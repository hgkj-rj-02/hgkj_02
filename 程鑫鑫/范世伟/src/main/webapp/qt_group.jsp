<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/06/22
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>团购</title>
    <link href="qt/css/layout.css" rel="stylesheet" type="text/css" />
    <script src="qt/js/jquery-1.11.0.min.js"></script>
    <script src="qt/js/tgou.js"></script>
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
            <li><a href="qt_type.jsp">境内游</a></li>
            <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            <li><a href="#">境外游</a></li>
            <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            <li><a href="#">热门游</a></li>
            <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            <li><a href="qt_group.jsp">团购</a></li>
            <li><a href="qt_cart.jsp"><img src="qt/images/che.jpg" width="176" height="42" /></a></li>
        </ul>
    </div>
</div>
<!--广告位图片-->
<div id="banner"><img src="qt/images/tgg1.jpg" width="1003" height="190" />
    <img src="qt/images/del.png" class="close" />
</div>
<!--主体内容第一部分开始-->
<div class="tuangouy">
    <ul>
        <c:forEach items="${lineList}" var="lineList">
           <c:if test="${lineList.teamBuy eq 1}">
               <li>
                   <div><a href="#">
                       <c:forEach items="${lineList.pictureSet}" var="liPic" begin="0" end="0">
                           <img src="${liPic.picname}" width="305" height="200" />
                       </c:forEach>
                   </a></div>
                   <div class="tuangouy-m"><a href="findTeam.action?line.lineId=${lineList.lineId}">[全国联保]${lineList.lineName}${lineList.days}</a><br />
                           ${lineList.introduction}<br />
                       <span>团价￥${lineList.teamBuyPrice}</span>&nbsp;&nbsp;原价：￥${lineList.price}
                   </div>
                   <div class="fengsu">已有2人参与</div>
               </li>
           </c:if>
        </c:forEach>

    </ul>
</div>
<div class="tgfy"><a href="#">首页</a> <a href="#">上一页</a> <a href="#">下一页</a> <a href="#">尾页</a></div>
<!--主体内容第一部分结束-->
<!--底部-->
<div id="foot">
    <div id="foot-t"><p>许可证编号：WE125482154 鄂ICP备125478966</p>
        <p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
    </div>
</div>
</body>
</html>
