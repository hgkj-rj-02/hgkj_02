<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 28/06/2019
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>路线修改</title>
</head>
<body>
<form action="updateLine.action" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>
                <input type="hidden" name="line.lineId" value="${line.lineId}">
            </td>
        </tr>
        <tr>
            <td>路线名称：</td>
            <td><input name="line.lineName" value="${line.lineName}"></td>
        </tr>
        <tr>
            <td>路线价格：</td>
            <td><input name="line.linePrice" value="${line.linePrice}"></td>
        </tr>
        <tr>
            <td>出行天数：</td>
            <td>
                <select name="line.lineDays">
                    <c:forEach var="day" begin="1" end="7" step="1">
                        <option value="${day}" <c:if test="${line.lineDays eq day }">selected</c:if>>${day}天</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>交通工具：</td>
            <td>
                <select name="line.lineVehicle">
                    <option value="飞机" <c:if test="${line.lineVehicle eq '飞机' }">selected</c:if>>飞机</option>
                    <option value="火车" <c:if test="${line.lineVehicle eq '火车' }">selected</c:if>>火车</option>
                    <option value="客车" <c:if test="${line.lineVehicle eq '客车' }">selected</c:if>>客车</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>路线类型：</td>
            <td>
                <select name="line.lineType.lineTypeId">
                    <c:forEach items="${lineTypeList}" var="ltl">
                        <option value="${ltl.lineTypeId}"
                                <c:if test="${ltl.lineTypeName eq lineOne.lineType.lineTypeName}"> selected </c:if>>
                                ${ltl.lineTypeName}
                        </option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>推荐理由：</td>
            <td><textarea name="line.lineReason">${lineOne.lineReason}</textarea></td>
        </tr>
        <tr>
            <td>行程安排：</td>
            <td><textarea name="line.lineArrange">${lineOne.lineArrange}</textarea></td>
        </tr>
        <tr>
            <td>行程简介：</td>
            <td><textarea name="line.lineIntroduction">${lineOne.lineIntroduction}</textarea></td>
        </tr>
        ${sessionScope.lineOne.pictureSet}
        <c:forEach items="${lineOne.pictureSet}" var="picture">
            <tr>
                <td>路线图片：</td>
                <td>
                        ${picture.pictIntroduction}
                    <input type="text" name="pictureId" value="${picture.pictureId}">
                    <input type="hidden" name="pictureIntroduce" value="${picture.pictIntroduction}">
                    <img src="${picture.pictIntroduction}">
                </td>
                <td>路线介绍：</td>
                <td><input name="pictName" value="${picture.pictName}" ></td>
                <td>上传路线图片：</td>
                <td><input type="file" name="uploads"></td>
            </tr>
        </c:forEach>
        <tr>
            <td>
                <input type="submit" name="修改">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
