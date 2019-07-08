<%--
  Created by IntelliJ IDEA.
  User: rice
  Date: 2019/6/26
  Time: 18:08
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
