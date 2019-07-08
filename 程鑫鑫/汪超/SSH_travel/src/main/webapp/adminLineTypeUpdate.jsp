<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 2019/6/24
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>路线类别修改</title>
</head>
<body>
<form action="updateLineType.action" method="post" enctype="multipart/form-data">
    类别编号： <input type="hidden" name="lineType.lineTypeId" value="${lineType.lineTypeId}"><br/>
    类别名称： <input name="lineType.lineTypeName" value="${lineType.lineTypeName}"><br/>
    图标：<input type="hidden" name="lineType.lineTypeIcon" value="${lineType.lineTypeIcon}"><img src="${lineType.lineTypeIcon}">
    更换图标：<input type="file" name="upload"><br/>
    <input type="submit" value="修改">
</form>
</body>
</html>
