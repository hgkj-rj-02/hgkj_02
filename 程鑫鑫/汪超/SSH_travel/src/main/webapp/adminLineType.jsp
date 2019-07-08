<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 2019/6/24
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>旅游路线类别</title>
</head>
<body>
<table border="1px">
    <tr>
        <th>路线类别编号</th>
        <th>路线类别名称</th>
        <th>路线类别添加时间</th>
        <th>路线类别图标名</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${lineTypeLists}" var="lineType">
        <tr>
            <td>${lineType.lineTypeId}</td>
            <td>${lineType.lineTypeName}</td>
            <td>${lineType.lineTypeTime}</td>
            <td><img src="${lineType.lineTypeIcon}"></td>
            <td><a href="findLineType.action?lineType.lineTypeId=${lineType.lineTypeId}">修改</a></td>
            <td><a href="deleteLineType.action?lineType.lineTypeId=${lineType.lineTypeId}">删除</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
