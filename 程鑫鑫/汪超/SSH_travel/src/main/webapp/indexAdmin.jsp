<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 2019/6/22
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>途乐行旅游网后台管理系统</title>
</head>
<frameset rows="64,*" frameborder="NO" border="0" framespacing="0">
    <frame src="adminTop.jsp" noresize="noresize" frameborder="NO" name="topFrame" scrolling="no" marginwidth="0"
           marginheight="0" target="main"/>
    <frameset cols="200,*" rows="560,*" id="frame">
        <frame src="left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0"
               scrolling="no" target="left"/>
        <frame src="_right.jsp" name="right" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto"
               target="_self"/>
    </frameset>
</frameset>
<noframes>
    <body></body>
</noframes>

</html>
