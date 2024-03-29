<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/06/22
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购物车</title>
    <link href="qt/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="qt/css/nf.lightbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="qt/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="qt/js/NFLightBox.js"></script>
    <script type="text/javascript" src="qt/js/shop.js"></script>
    <style type="text/css">
        .mask { /*遮罩层*/
            background-color:gray;
            left:0;
            position:absolute;
            top:0;
            z-index:100;
            filter:alpha(opacity=30);
            opacity:0.3;
        }

        div.dialog {
            width: 296px;
            height:173px;
            position: absolute;
            z-index: 101;
            display: none;
            background-image:url(qt/images/dialog.png)
        }

        div.title {
            padding-top: 5px;
            padding-left:270px;
        }
        div.dialog div.content {

            height: 90px;
            text-align:center;

            font:bold 15px/90px Verdana, Geneva, sans-serif;
        }

        div.dialog div.bottom {
            text-align: right;
            padding: 10px 10px 10px 0px;
            border-top:1px dashed #999999;

        }
        div.bottom .btn1 {
            border:none;
            width: 63px;
            height: 29px;
            cursor:pointer;

        }
        div.bottom #btnSure{
            background-image:url(qt/images/delSure.jpg);
        }
        div.bottom #btnCancel{
            background-image:url(qt/images/delCancel.jpg);
        }
    </style>
</head>
<body>
<!--头部-->
<div id="top-cont">
    <div id="top-min">
        <div id="min-left"></div>
        <div id="min-right"></div>
    </div>
</div>
<div id="menu">
    <div id="menu-m">
        <ul>
            <li><a href="qt_index.jsp">首页</a></li>
            <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            <li><a href="qt_type.jsp">境内游</a></li>
            <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            <li><a href="#">境外游</a></li>
            <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            <li><a href="#">热门游</a></li>
            <li style="width:8px;"><img src="qt/images/t1.jpg" width="8" height="42" /></li>
            <li><a href="qt_group.jsp">团购</a></li>
            <li><a href="qt_cart.jsp"><img src="qt/images/che.jpg" width="176" height="42" /></a></li>
        </ul>
    </div>
</div>
<!--广告位图片-->


<!--注册版块-->
<div id="shop">
    <div id="shop-t">
        <div id="shop-l"><img src="qt/images/sh.jpg" width="74" height="67" /></div>
        <div id="shop-r">我的购物车</div>
    </div>
    <div id="shop-inf">
        <ul>
            <li class="xh">序号</li>
            <li class="lx">路线名称</li>
            <li class="rs">单价</li>
            <li class="dj"><a href="#">下单</a></li>
            <li class="cz">操作</li>
        </ul>
    </div>
    <div id="shop-xx">
        <ul id="shop1">
            <li class="xh">1</li>
            <li class="lx">
                <div id="luxian">
                    <ul>
                        <li><a href="qt/images/pic1.jpg" title="美国"><img src="qt/images/pic1.jpg" width="87" height="58"  /></a></li>
                        <li><a href="#">产品编号：f45efb23线路名：美国1日游【交通工具+火车】</a></li>
                    </ul>
                </div>
            </li>
            <li class="rs">￥234</li>
            <li class="dj"><a href="qt_order.jsp">下单</a></li>
            <li class="cz"><a href="#" class="btnDel" ><span style="color:#F60; text-decoration:underline;">删除</span></a></li>
        </ul>
        <ul id="shop2">
            <li class="xh">2</li>
            <li class="lx">
                <div id="luxian">
                    <ul>
                        <li><a href="qt/images/pic2.png" title="仰光"><img src="qt/images/pic2.png" width="87" height="58" /></a></li>
                        <li><a href="#">产品编号：39252b36d线路名：仰光2日游【交通工具+飞机】</a></li>
                    </ul>
                </div>
            </li>
            <li class="rs">￥765</li>
            <li class="dj"><a href="qt_order.jsp">下单</a></li>
            <li class="cz"><a href="#" class="btnDel"><span style="color:#F60; text-decoration:underline;">删除</span></a></li>
        </ul>
        <ul id="shop3">
            <li class="xh">3</li>
            <li class="lx">
                <div id="luxian">
                    <ul>
                        <li><a href="qt/images/pic3.jpg" title="大阪"><img src="qt/images/pic3.jpg" width="87" height="58" /></a></li>
                        <li><a href="#">产品编号：24b958r6线路名：大阪1日游【交通工具+飞机】</a></li>
                    </ul>
                </div>
            </li>
            <li class="rs">￥897</li>
            <li class="dj"><a href="qt_order.jsp">下单</a></li>
            <li class="cz"><a href="#" class="btnDel"><span style="color:#F60; text-decoration:underline;">删除</span></a></li>
        </ul>

        <ul id="shop4">
            <li class="xh">4</li>
            <li class="lx">
                <div id="luxian">
                    <ul>
                        <li><a href="qt/images/fhgc.jpg" title="凤凰古城"><img src="qt/images/fhgc.jpg" width="87" height="58" /></a></li>
                        <li><a href="#">产品编号：24b967f7线路名：凤凰古城5日游【交通工具+飞机】</a></li>
                    </ul>
                </div>
            </li>
            <li class="rs">￥2888</li>
            <li class="dj"><a href="qt_order.jsp">下单</a></li>
            <li class="cz"><a href="#" class="btnDel"><span style="color:#F60; text-decoration:underline;">删除</span></a></li>
        </ul>


    </div>
    <div id="fanye"><a href="#">首页</a> <a href="#">上一页</a> <a href="#">下一页</a> <a href="#">尾页</a></div>
    <div id="jine">应付金额：<span style="color:#F00;"></span>元</div>
    <div id="js">
        <input name="button" type="image" id="button" value="提交" src="qt/images/js.jpg" />
    </div>
</div>

<!--底部-->
<div id="foot">
    <div id="foot-t">
        <p>许可证编号：WE125482154 鄂ICP备125478966</p>
        <p><a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> | <a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a></p>
    </div>
</div>
<div class="mask"></div>


<div class="dialog">
    <div class="title">
        <img src="qt/images/del.png" id="closePic" title="关闭"/> </div>
    <div class="content"> <p>您真的要删除这条记录吗？</p></div>
    <div class="bottom">
        <input type="button" value="" class="btn1"  id="btnSure"/>
        <input type="button" value="" class="btn1" id="btnCancel" />
    </div>
</div>
</body>
</html>
