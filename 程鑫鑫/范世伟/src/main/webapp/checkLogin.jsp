<%--
  Created by IntelliJ IDEA.
  User: rice
  Date: 2019/7/5
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    if (request.getSession().getAttribute("linetypeList")==null && request.getSession().getAttribute("lineList")==null){
        response.sendRedirect("qtAllLineType.action");
        return;
    }
%>
</html>
