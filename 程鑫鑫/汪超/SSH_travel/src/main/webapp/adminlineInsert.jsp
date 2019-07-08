<%--
  Created by IntelliJ IDEA.
  User: 22695
  Date: 2019/6/25
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加路线</title>
</head>
<body>

<form action="insertLine.action" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>路线编号：</td>
            <td><input name="line.lineId"></td>
        </tr>
        <tr>
            <td>路线名称：</td>
            <td><input name="line.lineName"></td>
        </tr>
        <tr>
            <td>线路行程价格：</td>
            <td><input name="line.linePrice"></td>
        </tr>
        <tr>
            <td>出游天数：</td>
            <td>
                <select name="line.lineDays">
                    <option value="1">1天</option>
                    <option value="2">2天</option>
                    <option value="3">3天</option>
                    <option value="4">4天</option>
                    <option value="5">5天</option>
                    <option value="6">6天</option>
                    <option value="7">7天</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>出游交通工具：</td>
            <td>
                <select name="line.lineVehicle">
                    <option value="飞机">飞机</option>
                    <option value="火车">火车</option>
                    <option value="客车">客车</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>线路类型：</td>
            <td>
                <select name="line.lineType.lineTypeId">
                    <option value="F1">国内</option>
                    <option value="H2">国外</option>
                    <option value="L3">热门</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>线路推荐理由：</td>
            <td><textarea name="line.lineReason"></textarea></td>
        </tr>
        <tr>
            <td>线路行程安排：</td>
            <td><textarea name="line.lineArrange"></textarea></td>
        </tr>
        <tr>
            <td>线路简介：</td>
            <td><textarea name="line.lineIntroduction"></textarea></td>
        </tr>
        <tr>
            <td>选择上传路线图片（说明：用户查看路线时有四张图片作为简介部分）</td>
        </tr>
        <tr>
            <td><input type="file" name="uploads"></td>
            <td>图片介绍<input name="pictName"></td>
        </tr>
        <tr>
            <td><input type="file" name="uploads"></td>
            <td>图片介绍<input name="pictName"></td>
        </tr>
        <tr>
            <td><input type="file" name="uploads"></td>
            <td>图片介绍<input name="pictName"></td>
        </tr>
        <tr>
            <td><input type="file" name="uploads"></td>
            <td>图片介绍<input name="pictName"></td>
        </tr>
        <tr>
            <td><input type="submit" value="添加"></td>
        </tr>
    </table>
</form>
</body>
</html>
