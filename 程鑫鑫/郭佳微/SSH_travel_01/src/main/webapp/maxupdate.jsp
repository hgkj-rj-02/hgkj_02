<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/06/24
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员修改</title>
</head>
<body>
<form action="updateCustomer.action" method="post">
    <input type="hidden" name="customer.customerId" value="${cu.customerId}">
    客户账号：<input type="text" name="customer.custAccount" value="${cu.custAccount}"><br/>
    客户名称：<input type="text" name="customer.custName" value="${cu.custName}"><br/>
    客户密码：<input type="text" name="customer.custPassWord" value="${cu.custPassWord}"><br/>
    客户性别：<input type="radio" value="男" name="customer.custSex" <c:if test="${cu.custSex == '男'}">checked="checked"</c:if>>男
    <input type="radio" value="女" name="customer.custSex" <c:if test="${cu.custSex == '女'}">checked="checked"</c:if>>女<br/>
    客户身份证号：<input type="text" name="customer.custIdentityId" value="${cu.custIdentityId}"><br/>
    客户号码：<input type="text" name="customer.custTel" value="${cu.custTel}"><br/>
    客户状态：<input type="text" name="customer.custType" value="${cu.custType}"><br/>
    <input type="submit" value="修改">

</form>
</body>
</html>
