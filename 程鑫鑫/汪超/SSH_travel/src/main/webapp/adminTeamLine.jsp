<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 28/06/2019
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>团购路线</title>
    <script src="webjars/jquery/3.4.0/dist/jquery.js"></script>
    <script>
        $(function () {
            $.post(
              "allLine.action",
              function (data) {
              },
              "json"
            );
        })
    </script>
</head>
<body>
<form action=".action" method="post">
    <table border="1px">
        <tr>
            <th>序号</th>
            <th>路线名称</th>
            <th>出游天数</th>
            <th>路线价格</th>
            <th>是否为团购路线</th>
            <th>路线类型</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${lineList}" var="line">
            <tr>
                <td>${line.lineId}</td>
                <td>${line.lineName}</td>
                <td>${line.lineDays}</td>
                <td>${line.linePrice}元</td>
                <td>
                    <c:choose>
                        <c:when test="${line.lineTeamBuy <= 0}">
                            <span style="color: red">团购</span>
                        </c:when>
                        <c:when test="${line.lineTeamBuy != 0}">
                            非团购
                        </c:when>
                    </c:choose>
                </td>
                <td>${line.lineType.lineTypeId}</td>
                <td><a href="findTeamLind.action?line.lineId=${line.lineId}">设置团购信息</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td>
                <a href="allLine.action?pageIndex=1&skip=adminTeamLine">首页</a>
                <a href="allLine.action?pageIndex=${pageIndex-1}&skip=adminTeamLine">上一页</a>
                ${pageIndex}/${totalPage}
                <a href="allLine.action?pageIndex=${pageIndex+1}&skip=adminTeamLine">下一页</a>
                <a href="allLine.action?pageIndex=${totalPage}&skip=adminTeamLine">尾页</a>

            </td>
        </tr>
    </table>
</form>
</body>
</html>
