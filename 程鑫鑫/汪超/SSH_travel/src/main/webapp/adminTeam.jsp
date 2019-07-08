<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 28/06/2019
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>团购信息</title>
</head>
<body>
<form action=".action" method="post">
    <table border="1px">
        <tr>
            <th>序号</th>
            <th>路线名称</th>
            <th>出游天数</th>
            <th>路线价格</th>
            <th>团购价格</th>
            <th>交通工具</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${teamLineList}" var="line">
            <tr>
                <td>${line.lineId}</td>
                <td>${line.lineName}</td>
                <td>${line.lineDays}</td>
                <td>${line.linePrice}元</td>
                <td>${line.linePrice}元</td>
                <td>${line.lineVehicle}</td>
                <td><a href="#">修改团购信息</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td>
                <a href="allTeamLine.action?TeamPageIndex=1">首页</a>
                <a href="allTeamLine.action?TeamPageIndex=${TeamPageIndex-1}">上一页</a>
                ${TeamPageIndex}/${teamTotalPage}
                <a href="allTeamLine.action?TeamPageIndex=${TeamPageIndex+1}">下一页</a>
                <a href="allTeamLine.action?TeamPageIndex=${teamTotalPage}">尾页</a>

            </td>
        </tr>
    </table>
</form>
</body>
</html>
