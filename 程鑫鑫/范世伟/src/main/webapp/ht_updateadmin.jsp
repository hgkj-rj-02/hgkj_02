<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/06/22
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理页面</title>
    <script language=JavaScript>
        function logout(){
            if (confirm("您确定要退出控制面板吗？"))
                top.location ="ht/admin/AdminManagerServlet?flag=_logout";
            return false;
        }
        function deleteadmin(typeId) {
            $.post("deleteType.action",
                { "type.typeId": typeId },
                function(data){
                    if (data=="success"){
                        alert("删除成功！")
                        $("#li_"+typeId).fadeOut(10);
                    }else {
                        alert("删除失败！")
                    }
                }, "json");
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
<form action="updateCustomer.action" method="post" >
    <ul>
        <li class="m">用户帐号 </li>
        <li class="r" >
            <input name="customer.account" type="text" class="box txtInit" id="txtNo" value="${cust.account}" />
            <span id='prompt_no' class="spanInit" ></span></li>
        <li class="m">用户姓名 </li>
        <li class="r">
            <input name="customer.name" type="text" class="box txtInit" id="txtName" value="${cust.name}"/>
            <span id='prompt_name' class="spanInit"  ></span></li>
        <li class="m">设置密码 </li>
        <li class="r">
            <input name="customer.password" type="text" class="box txtInit" id="txtPwd"  value="${cust.password}"/>
            <span id='prompt_pwd'  class="spanInit" ></span></li>
        <li class="m">性 别 </li>
        <li class="r">
            <input name="customer.gender" type="radio" value="男" checked="checked" id="radio"  <c:if test="${cust.gender=='男'}">checked="checked"</c:if>>男
            <input name="customer.gender" type="radio" value="女" id="radio2" <c:if test="${cust.gender=='女'}">checked="checked"</c:if> >女
        <li class="m">身份证号 </li>
        <li class="r">
            <input name="customer.identityId" type="text" class="box txtInit" id="txtId" value="${cust.identityId}"  />
            <span id='prompt_id' class="spanInit"   ></span></li>

        <li class="m">手机号码 </li>
        <li class="r">
            <input name="customer.tel" type="text" class="box txtInit" id="txtPhone" value="${cust.tel}"/>
            <span id='prompt_phone' class="spanInit" ></span></li>
        <%--<li class="m">校验码 </li>--%>
        <%--<li class="r">--%>
        <%--<input name="yzm" type="text" class="box txtInit" id="textfield" size="15" />--%>
        <%--看不清？<a href="#">换一张</a></li>--%>
        ${message}
            <input name="button" type="submit" id="button" value="修改" style=";width: 120px;height: 30px" />

    </ul>
</form>
</body>
</html>
