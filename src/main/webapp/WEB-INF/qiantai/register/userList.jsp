<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>userlist</title>
</head>
<body >
    <form action="${pageContext.request.contextPath}/register/addUser!queryUsers.action" method="post">
    <input type="hidden" id="offset" name="offset" value="${offset }">
        <table>
            <tr>
                <td>user name:</td>
                <td><input type="text" name="username" id="username" maxlength="10" value="${username }"/>
                <input type="submit" value="查询">
                </td>
            </tr>
        </table>
    
    <table>
    <tr>
       <td>序号</td>
       <td>姓名</td>
       <td>密码</td>
       <td></td>
    </tr>
    <s:iterator value="#request.page.list" id="x">
    <tr>
       <td>${ x.id}</td>
       <td>${ x.username}</td>
       <td>${ x.password}</td>
       <td><a href="addUser!deleteUser.action?id=${ x.id}">删除</a></td>
       <td><a href="addUser!queryUser.action?id=${ x.id}">编辑</a></td>
    </tr>
    </s:iterator>
    </table>
    ${page.navigation }每页显示<input type="text" id="limit" name="limit" value="${limit }" size="5">条
    </form>
</body>
<script type="text/javascript">
function pageClick(pagesize,limit)
{
	document.getElementById("offset").value=pagesize;
	document.forms[0].submit();
}
</script>
</html>