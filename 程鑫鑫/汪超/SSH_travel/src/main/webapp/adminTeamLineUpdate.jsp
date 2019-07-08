<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 01/07/2019
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>团购路线修改</title>
</head>
<body>
<form action="teamLineUpdate.action" method="post">
    <table>
        <tr>
            <input type="hidden" name="line.lineId" value="${lineTeam.lineId}">
            <input type="hidden" name="line.lineTeamBuy" value="0">
            <input type="hidden" name="line.lineOnTime" value="${lineTeam.lineOnTime}">
            <td>路线名称：</td>
            <td><input name="line.lineName" value="${lineTeam.lineName}"></td>
            <td>路线价格：</td>
            <td><input name="line.linePrice" value="${lineTeam.linePrice}"></td>
            <td><input type="submit" value="设置团购信息"></td>
        </tr>
        <tr>
            <td>出游天数：</td>
            <td>
                <select name="line.lineDays">
                    <c:forEach var="day" begin="1" end="7" step="1">
                        <option value="${day}" <c:if test="${lineTeam.lineDays eq day }">selected</c:if>>${day}天</option>
                    </c:forEach>
                </select>
            </td>
            <td>团购价格：</td>
            <td><input name="line.lineTeamBuyPrice" value="${lineTeam.lineTeamBuyPrice}"></td>
        </tr>
        <tr>
            <td>开团时间：</td>
            <td><input name="line.lineBeginTime" value="${lineTeam.lineBeginTime}"></td>
            <td>闭团时间：</td>
            <td><input name="line.lineEndTime" value="${lineTeam.lineEndTime}"></td>
        </tr>
        <tr>
            <td>交通工具：</td>
            <td>
                <select name="line.lineVehicle">
                    <option value="飞机" <c:if test="${lineTeam.lineVehicle eq '飞机' }">selected</c:if>>飞机</option>
                    <option value="火车" <c:if test="${lineTeam.lineVehicle eq '火车' }">selected</c:if>>火车</option>
                    <option value="客车" <c:if test="${lineTeam.lineVehicle eq '客车' }">selected</c:if>>客车</option>
                </select>
            </td>
            <td>路线类型：</td>
            <td>
                <select name="line.lineType.lineTypeId">
                    <c:forEach items="${lineTypeList}" var="ltl">
                        <option value="${ltl.lineTypeId}"
                                <c:if test="${ltl.lineTypeName eq lineTeam.lineType.lineTypeName}"> selected </c:if>>
                                ${ltl.lineTypeName}
                        </option>
                    </c:forEach>
                </select>
            </td>
        </tr>
    </table>
    <textarea name="line.lineReason">${lineTeam.lineReason}</textarea>
    <textarea name="line.lineArrange">${lineTeam.lineArrange}</textarea>
    <textarea name="line.lineIntroduction">${lineTeam.lineIntroduction}</textarea>
</form>
</body>
</html>
