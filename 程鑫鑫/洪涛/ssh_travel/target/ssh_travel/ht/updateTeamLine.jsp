<%@ page import="com.hgkj.model.entity.Linetype" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="images/admin/images/skin.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script type="text/javascript">
    function fileChange(target){
        //检测上传文件的类型
        var ext,idx;
        if (target == null){
            alert("请选择需要上传的文件!");
            return;
        } else {
            idx = target.lastIndexOf(".");
            if (idx != -1){
                ext = target.substr(idx+1).toUpperCase();
                ext = ext.toLowerCase( );
                if (ext!='jpg'&&ext!='png'&&ext!='jpeg'&& ext!='gif'){
                    alert("只能上传图片(jpg,png,jpeg,gif)");
                    document.getElementById("file").value = null;
                    return;
                }
            } else {
                return;
            }
        }
    }
</script>
<style type="text/css">

    <!--
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        background-color: #EEF2FB;
    }
    -->
</style>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="17" valign="top" background="images/admin/images/mail_leftbg.gif"><img src="images/admin/images/left-top-right.gif" width="17" height="29" /></td>
        <td valign="top" background="images/admin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
            <tr>
                <td height="31"><div class="titlebt">设置信息</div></td>
            </tr>
        </table></td>
        <td width="16" valign="top" background="images/mail_rightbg.gif">
            <img src="images/admin/images/nav-right-bg.gif" width="16" height="29" /></td>
    </tr>

    <form action="updateTeamLineAction.action" method="post" enctype="multipart/form-data">
        <tr>
            <td valign="middle" background="images/admin/images/mail_leftbg.gif">&nbsp;</td>
            <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" valign="top">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" valign="top"><input type="hidden" name="line.lineId" value="${line.lineId}">
                        <%--<input type="hidden" name="line.lineName" value="${line.lineName}">--%>
                        <%--<input type="hidden" name="line.lineDays" value="${line.lineDays}">--%>
                        <%--<input type="hidden" name="line.linePrice" value="${line.linePrice}">--%>
                        <table style="text-align: center;margin: auto" cellpadding="5px" cellspacing="5px">
                            <tr>
                                <td>线路名称<input type="text" name="line.lineName" value="${line.lineName}"></td>
                                <td>线路价格<input type="text" name="line.linePrice" value="${line.linePrice}"></td>
                                <td><input type="submit" value="设置团购信息"></td>
                            </tr>
                            <tr>
                                <td>出游天数<input type="text" name="line.lineDays" value="${line.lineDays}"></td>
                                <td>团购价格<input type="text" name="line.lineTeamBuyPrice"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>开团时间<input type="date" name="line.lineBeginTime" value="${line.lineBeginTime}"></td>
                                <td>闭团时间<input type="date" name="line.lineEndTime" value="${line.lineEndTime}"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>交通工具<select name="line.lineVehicle">
                                    <option value="${line.lineVehicle}">${line.lineVehicle}</option>
                                    <option value="飞机">飞机</option>
                                    <option value="高铁">高铁</option>
                                    <option value="动车">动车</option>
                                    <option value="火车">火车</option>
                                    <option value="汽车">汽车</option>
                                    <option value="轮船">轮船</option>
                                </select></td>
                                <td>
                                    线路类型<select name="line.linetype.lineTypeId">
                                        <c:forEach items="${linetypeList}" var="linetype">
                                                 <c:if test="${line.linetype.lineTypeId eq linetype.lineTypeId}">
                                                   <option value="${linetype.lineTypeId}">${linetype.lineTypeName}</option>
                                                   </c:if>
                                        </c:forEach>
                                        <c:forEach items="${linetypeList}" var="linetype">
                                                 <c:if test="${line.linetype.lineTypeId ne linetype.lineTypeId}">
                                                      <option value="${linetype.lineTypeId}">${linetype.lineTypeName}</option>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>推荐理由</td>
                                <td>行程安排</td>
                                <td>路线简介</td>
                            </tr>
                            <tr>
                                <td><textarea name="line.lineReason" cols="33%" rows="10%">${line.lineReason}</textarea></td>
                                <td><textarea name="line.lineArrange" cols="33%" rows="10%">${line.lineArrange}</textarea></td>
                                <td><textarea name="line.lineIntroduction" cols="33%" rows="10%">${line.lineIntroduction}</textarea></td>
                            </tr>
                        </table>

                                <%--<td><input type="file" name="file" id="file" onchange="fileChange(this.value)" accept=".gif,.jpg,.jpeg,.png" required/></td>--%>
                                <%--<td><input type="file" name="file" id="file" onchange="fileChange(this.value)" accept=".gif,.jpg,.jpeg,.png" required/></td>--%>
                                <%--<td><input type="file" name="file" id="file" onchange="fileChange(this.value)" accept=".gif,.jpg,.jpeg,.png" required/></td>--%>
                            </tr>
                        </table>
                <span class="left_ts"></span><span class="left_txt"><br>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;　 <br>
</span>
                    <td width="7%">&nbsp;</td>

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
                                        <TD width="4%" background="images/admin/images/news-title-bg.gif"></TD>
                                        <TD width="91%" background="images/admin/images/news-title-bg.gif" class="left_ts"></TD>
                                        <TD width="5%" background="images/admin/images/news-title-bg.gif" class="left_txt">&nbsp;</TD>
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
                <tr>
                    <td width="2%">&nbsp;</td>
                    <td width="51%" class="left_txt"><img src="images/admin/images/icon-mail2.gif" width="16" height="11"><br>
                        <img src="/images/admin/images/icon-phone.gif" width="17" height="14"> </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table></td>
            <td background="/images/admin/images/mail_rightbg.gif">&nbsp;</td>
        </tr>
    </form>
    <tr>
        <td valign="bottom" background="images/admin/images/mail_leftbg.gif"><img src="images/admin/images/buttom_left2.gif" width="17" height="17" /></td>
        <td background="images/admin/images/buttom_bgs.gif"><img src="images/admin/images/buttom_bgs.gif" width="17" height="17"></td>
        <td valign="bottom" background="images/admin/images/mail_rightbg.gif"><img src="images/admin/images/buttom_right2.gif" width="16" height="17" /></td>
    </tr>
</table>
</body>
