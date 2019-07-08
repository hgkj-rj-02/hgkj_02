<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/06/22
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统管理员</title>
    <link href="ht/images/admin/images/skin.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="webjars/jquery/3.4.0/dist/jquery.js"></script>
    <script language=JavaScript>
        function logout(){
            if (confirm("您确定要退出控制面板吗？"))
                top.location ="qt_login.jsp";
            return false;
        }
        function deleteCustomer(customerId) {
            $.ajax({
                type: "post",
                url: "deleteCustomer.action",
                dataType: "json",
                data:{"customer.customerId":customerId},
                success:function (data) {
                    if(data=="ok"){
                        $("#cu"+customerId).remove();
                    }else {
                        alert("删除失败！")
                    }
                }
            });
        }
    </script>

    <meta http-equiv=Content-Type content=text/html;charset=gb2312>
    <meta http-equiv="refresh" content="60">

    <base target="main">
    <link href="ht/images/admin/images/skin.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
    <tr>
        <td width="61%" height="64"><img src="ht/images/admin/images/logo.gif" width="262" height="64"></td>
        <td width="39%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="74%" height="38" class="admin_txt">管理员：<b>管理员您好,感谢登陆使用！</b></td>
                <td width="22%"><a href="#" target="_self" onClick="logout();"><img src="ht/images/admin/images/out.gif" alt="安全退出" width="46" height="20" border="0"></a></td>
                <td width="4%">&nbsp;</td>
            </tr>
            <tr>
                <td height="19" colspan="3">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
</table>
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
                <table border="1px" style="width: 800px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>客户账号</td>
                        <td>客户名称</td>
                        <td>客户密码</td>
                        <td>客户性别</td>
                        <td>客户身份证号</td>
                        <td>客户手机号</td>
                        <td>客户状态</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items="${customerList}" var="customer">
                        <c:if test="${customer.custType ne 2}">
                            <tr id="cu${customer.customerId}">
                                <td>${customer.custAccount}</td>
                                <td>${customer.custName}</td>
                                <td>${customer.custPassWord}</td>
                                <td>${customer.custSex}</td>
                                <td>${customer.custIdentityId}</td>
                                <td>${customer.custTel}</td>
                                <td>${customer.custType}</td>
                                <td><a href="findCustomer.action?customer.customerId=${customer.customerId}">修改</a>
                                    <a href="javascript:deleteCustomer(${customer.customerId})">删除</a> </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
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
            <tr>
                <td width="2%">&nbsp;</td>
                <td width="51%" class="left_txt"><img src="ht/images/admin/images/icon-mail2.gif" width="16" height="11"> 客户服务邮箱：www.tlx.com<br>
                    <img src="ht/images/admin/images/icon-phone.gif" width="17" height="14"> 联系方式：888-000-8888</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
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
