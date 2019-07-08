<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/06/22
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="ht/images/admin/images/skin.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="17" valign="top" background="ht/images/admin/images/mail_leftbg.gif"><img src="ht/images/admin/images/left-top-right.gif" width="17" height="29" /></td>
        <td valign="top" background="ht/images/admin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
            <tr>
                <td height="31"><div class="titlebt">欢迎界面</div></td>
            </tr>
        </table></td>
        <td width="16" valign="top" background="ht/images/mail_rightbg.gif">
            <img src="ht/images/admin/images/nav-right-bg.gif" width="16" height="29" /></td>
    </tr>
    <tr>
        <td valign="middle" background="ht/images/admin/images/mail_leftbg.gif">&nbsp;</td>
        <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2" valign="top">&nbsp;</td>
                <td>&nbsp;</td>
                <td valign="top">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <form action="updateLineTeam.action" method="post">
                        <input type="hidden" name="line.lineId" value="${linel.lineId}">
                        <input type="hidden" name="line.lineTeamBuy" value="${linel.lineTeamBuy}">
                        <input type="hidden" name="line.lineOnTime" value="${linel.lineOnTime}">
                        <table style="width: 1000px">
                            <tr>
                                <td>线路名称</td>
                                <td><input type="text" name="line.lineName" value="${linel.lineName}"></td>
                                <td>线路价格</td>
                                <td><input type="text" name="line.linePrice" value="${linel.linePrice}"></td>
                                <td><input type="submit" value="设置团购信息"></td>
                            </tr>
                            <tr>
                                <td>出游天数</td>
                                <td><input type="text" name="line.lineDays" value="${linel.lineDays}"></td>
                                <td>团购价格</td>
                                <td><input type="text" name="line.lineTeamBuyPrice" value="${linel.lineTeamBuyPrice}"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>开团时间</td>
                                <td><input type="text" name="line.lineBeginTime" value="${linel.lineBeginTime}"></td>
                                <td>闭团时间</td>
                                <td><input type="text" name="line.lineEndTime" value="${linel.lineEndTime}"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>交通工具</td>
                                <td><select name="line.lineVehicle">
                                    <option value="飞机">飞机</option>
                                    <option value="高铁">高铁</option>
                                    <option value="动车">动车</option>
                                    <option value="火车">火车</option>
                                    <option value="汽车">汽车</option>
                                </select></td>
                                <td>线路类型</td>
                                <td><select name="line.linetype.lineTypeId">
                                    <c:forEach items="${linetypeList}" var="linetypel">
                                        <option value="${linetypel.lineTypeId}" <c:if test="${linetypel.lineTypeId eq line.linetype.lineTypeId}">selected="selected"</c:if>>${linetypel.lineTypeName}</option>
                                    </c:forEach>
                                </select>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2">推荐理由</td>
                                <td colspan="2">行程安排</td>
                                <td>线路简介</td>
                            </tr>
                            <tr>
                                <td colspan="2"><textarea rows="7" cols="25" name="line.lineReason">${linel.lineReason}</textarea></td>
                                <td colspan="2"><textarea rows="7" cols="25" name="line.lineArrange">${linel.lineArrange}</textarea></td>
                                <td><textarea rows="7" cols="25" name="line.lineIntroduction">${linel.lineIntroduction}</textarea></td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" valign="top"><!--JavaScript部分-->

                    <TABLE class=main_tab id=mainTable cellSpacing=0 cellPadding=0 width=100% border=0>
                        <!--关于TBODY标记-->

                        <!--关于cells集合-->
                        <TBODY style="DISPLAY: none">
                        </TD>
                        </TR>
                        </TBODY>

                        <TBODY style="DISPLAY: none">
                        <TR>
                            <TD vAlign=top align=middle><TABLE width=98% border=0 align="center" cellPadding=0 cellSpacing=0>

                            </TABLE></TD>
                        </TR>
                        </TBODY>
                        <!--关于display属性-->
                        <TBODY style="DISPLAY: none">
                        <TR>
                            <TD vAlign=top align=middle><TABLE width=98% border=0 align="center" cellPadding=0 cellSpacing=0>
                                <TBODY>
                                <TR>
                                    <TD colspan="3"></TD>
                                </TR>
                                <TR>
                                    <TD height="5" colspan="3"></TD>
                                </TR>
                                <TR>
                                    <TD width="4%" background="ht/images/admin/images/news-title-bg.gif"></TD>
                                    <TD width="91%" background="ht/images/admin/images/news-title-bg.gif" class="left_ts"></TD>
                                    <TD width="5%" background="ht/images/admin/images/news-title-bg.gif" class="left_txt">&nbsp;</TD>
                                </TR>

                                <TR>
                                    <TD height="5" colspan="3"></TD>
                                </TR>
                                </TBODY>
                            </TABLE></TD>
                        </TR>
                        </TBODY>
                    </TABLE></td>
                <td>&nbsp;</td>

            </tr>
            <tr>
                <td height="40" colspan="4"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                    <tr>
                        <td></td>
                    </tr>
                </table></td>
            </tr>
        </table></td>
        <td background="ht/images/admin/images/mail_rightbg.gif">&nbsp;</td>
    </tr>
    <tr>
        <td valign="bottom" background="ht/images/admin/images/mail_leftbg.gif"><img src="ht/images/admin/images/buttom_left2.gif" width="17" height="17" /></td>
        <td background="ht/images/admin/images/buttom_bgs.gif"><img src="ht/images/admin/images/buttom_bgs.gif" width="17" height="17"></td>
        <td valign="bottom" background="ht/images/admin/images/mail_rightbg.gif"><img src="ht/images/admin/images/buttom_right2.gif" width="16" height="17" /></td>
    </tr>
</table>
</body>
</html>
