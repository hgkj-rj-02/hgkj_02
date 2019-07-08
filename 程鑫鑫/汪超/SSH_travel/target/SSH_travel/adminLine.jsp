<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 2019/6/24
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>旅游线路管理</title>
</head>
<body>
    <table border="1px">
        <tr>
            <th>序号</th>
            <th>路线名称</th>
            <th>出游天数</th>
            <th>线路行程价格</th>
            <th>出游交通工具</th>
            <th>路线类型</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${lineList}" var="line">
            <tr>
                <td>${line.lineId}</td>
                <td>${line.lineName}</td>
                <td>${line.lineDays}</td>
                <td>${line.linePrice}</td>
                <td>${line.lineVehicle}</td>
                <td>${line.lineType.lineTypeName}</td>
                <td><a href="findLine.action?line.lineId=${line.lineId}">修改</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td>
                <a href="allLine.action?pageIndex=1&skip=adminLine">首页</a>
                <a href="allLine.action?pageIndex=${pageIndex-1}&skip=adminLine">上一页</a>
                ${pageIndex}/${totalPage}
                <a href="allLine.action?pageIndex=${pageIndex+1}&skip=adminLine">下一页</a>
                <a href="allLine.action?pageIndex=${totalPage}&skip=adminLine">尾页</a>

            </td>
        </tr>
    </table>
</body>
</html>
