<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 2019/6/23
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>高级管理员</title>
</head>
<body>
${message}

<table>
    <tr>
        <th>管理员编号</th>
        <th>管理员账号</th>
        <th>管理员名称</th>
        <th>管理员密码</th>
        <th>删除管理员</th>
    </tr>
    <c:forEach items="${adminList}" var="admin">
        <tr>
            <td>${admin.custId}</td>
            <td>${admin.custAccount}</td>
            <td>${admin.custName}</td>
            <td>${admin.custPassWord}</td>
            <td><a href="deleteCustomer.action?customer.custId=${admin.custId}">删除</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td><a href="adminInsert.jsp">添加管理员</a></td>
        <td><a href="loggingOut.action">安全退出</a></td>
    </tr>
</table>
</body>
</html>
