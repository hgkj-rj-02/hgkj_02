<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/07/03
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    if (request.getSession().getAttribute("linetypeList")==null){
        response.sendRedirect("qtAllLinetype.action");
        return;
    }
%>
</html>
