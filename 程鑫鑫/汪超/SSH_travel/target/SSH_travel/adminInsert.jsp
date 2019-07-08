<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 2019/6/24
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>普通管理员添加</title>
</head>
<body>
<form action="insertCustomer.action?skip=adminInsert" method="post">
    账 &nbsp; 号：<input name="customer.custAccount"><br/>
    名 &nbsp; 称：<input name="customer.custName"><br/>
    密 &nbsp; 码：<input name="customer.custPassWord"><br/>
    性 &nbsp; 别：<input type="radio" name="customer.custSex" checked="checked" value="男">男
    <input type="radio" name="customer.custSex" value="女">女<br/>
    身份证：<input name="customer.custIdentityId"><br/>
    电 &nbsp; 话：<input name="customer.custTel"><br/>
    <input type="hidden" name="customer.custType" value="1">
    <input type="submit" value="添加">
</form>
</body>
</html>
