﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>途乐行--订单</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.4.custom.min.css"  rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script  type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="js/dingdan.js"></script>
</head>

<body>
<!--头部-->
<div id="top-cont">
<div id="top-min">
<div id="min-left"></div>
    <span style="text-align: center;font-size: 20px">欢迎</span><span style="text-align: center;font-size: 20px;color: red">${customer.custName}</span>
    <a href="/ht/adminBack.jsp"><input type="button" value="退出"></a>
<div id="min-right"></div>
</div>
</div>
<!--导航-->
<div id="menu">
<div id="menu-m">
<ul>
<li><a href="index.jsp">首页</a></li>
<li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
<li><a href="type.jsp">境内游</a></li>
<li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
<li><a href="#">境外游</a></li>
<li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
<li><a href="#">热门游</a></li> 
<li style="width:8px;"><img src="images/t1.jpg" width="8" height="42" /></li>
<li><a href="#">团购</a></li>
<li><a href="#"><img src="images/che.jpg" width="176" height="42" /></a></li>
</ul>
</div>
</div>
<!--广告位图片-->

<!--主体内容第一部分开始-->
<div class="dingdan">
<div class="dingdan-m">
<ul>
<li><img src="images/n1.jpg" width="205" height="62" /></li>
<li><img src="images/jt2.jpg" width="44" height="60" /></li>
<li><img src="images/n22.jpg" width="205" height="62" /></li>
<li><img src="images/jt21.jpg" width="44" height="60" /></li>
<li><img src="images/n33.jpg" width="205" height="62" /></li>
<li></li>
</ul>
</div>
<div class="dingdan-inf">
<div class="dingdan-infm">线路信息</div>
<div class="dingdan-mm">
<div class="dingdan-x">线路信息</div>
<div class="dingdan-lx">
<ul>
<li class="ds">线路编号</li>
<li class="ds">线路名称</li>
<li class="ds">单价</li>
<li class="ds">出行工具</li>
<li>${car.line.lineId}</li>
<li>${car.line.lineName}</li>
    <c:if test="${car.line.lineTeamBuy ne 1}">
        <li>￥${car.line.linePrice}</li>
    </c:if>
    <c:if test="${car.line.lineTeamBuy eq 1}">
        <li>￥${car.line.lineTeamBuyPrice}</li>
    </c:if>

<li>${car.line.lineVehicle}</li>
</ul>
</div>
</div>
<div class="dingdan-infm">填写游客信息&nbsp;&nbsp;<span>请准确填写游客信息，以免发生不必要的纠纷&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
   <span style="color:red">*</span>选择出游日期：<input type="text" value="" id="txtLeaveDate" /><span></span>
</div>
    <form action="insertTourist.action" method="post">
<div class="vistor_info"> <!--游客的信息,以下是增加，删除的内容-->
<div class="dingdan-mm">
  <div class="dingdan-x">游客信息</div>
  <div class="youke">
  <ul>


  <li><span>*</span> 真实姓名 
      <input name="tourName" type="text" id="textfield" size="20" />
      <a href="#">修改</a></li>
        <li><span>*</span> 手机 
      <input name="tourPhone" type="text" id="textfield" size="20" />
      <a href="#">修改</a></li>
        <li><span>*</span> 身 份 证 
          <input name="tourCD" type="text" id="textfield" size="20" />
      <a href="#">修改</a></li>
      <li class="opli"><a href="#" class="operateDel">-移除该信息栏</a></li>
    </ul>
  </div>
</div>
</div>  <!--游客结束-->

<div class="people">
  <a href="#"  class="operateAdd">+添加游客信息</a>
</div>
<div class="xyb">
  <input type="submit" id="button" value="" style="height: 39px;width: 122px;background-image: url('images/xyb.jpg')"/>
        </form>
</div>
</div>

</div>

<!--主体内容第一部分结束-->
<!--底部-->
<div id="foot">
<div id="foot-t"><p>许可证编号：WE125482154 鄂ICP备125478966</p>
<p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
</div>
</div>
</body>
</html>
