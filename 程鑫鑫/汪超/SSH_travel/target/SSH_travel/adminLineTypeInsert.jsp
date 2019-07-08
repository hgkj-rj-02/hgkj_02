<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 2019/6/24
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加路线类别</title>
</head>
<body>
<form action="insertLineType.action" method="post" enctype="multipart/form-data">
    类别编号： <input name="lineType.lineTypeId"><br/>
    类别名称： <input name="lineType.lineTypeName"><br/>
    图标：
    <input type="file" name="upload"><br/>
    <input type="submit" value="添加">
</form>
</body>
</html>
