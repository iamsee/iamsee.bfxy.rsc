<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String backmsg = (String) session.getAttribute("backmsg");
	String username = (String) session.getAttribute("username");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'leftlogin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>



	<div class="pager_center_left">
		<div class="leftlogin">
			<%
				if (username == null || username.equals("")) {
			%>
			<form action="servlet/loginaction">
				<table>
					<tr>

						<td>用户名:</td>
						<td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>密&nbsp;&nbsp;码:</td>
						<td><input type="password" name="password"></td>
					</tr>
					<!-- <tr>
    				<td>部&nbsp;&nbsp;门:</td>
    				<td>
    				<select id="condition" name="condition">
                                	<option value="">请选择...</option>
								    
                     </select>
                     </td>
    			</tr> -->
					<tr>
						<td colspan="2"><input type="submit" value="登陆" class="btn"
							align="right"></td>
					</tr>
					<%if(backmsg!=null) {%>
					
					<tr>
						<td colspan="2"><p><%=backmsg%></p></td>
						</tr>
						<%} %>
				</table>
			</form>


			<%
				} else {
			%>

			<table>

				<tr>
					<td><p><%=backmsg%></p></td>
				</tr>
				<tr>

					<td>当前登录用户:</td>
					<td><%=username.toString()%></td>
					<td><a href="main/admin/loginout.jsp">「退出登录」</a></td>

				</tr>
				<tr>
					<td>进行操作:<br><br></td>
				</tr>
				
				<tr>
					<td><a href="servlet/admindoaction?menutype=changepwd">>更改密码</a><br><br><br></td>
				</tr>
				<tr>
					<td><a href="servlet/admindoaction?menutype=createdoc">>发布新文章</a><br><br><br></td>
				</tr>
				<tr>
					<td><a href="servlet/admindoaction?menutype=showdocs">>查看已发布文章</a><br><br></td>
				</tr>


			</table>


			<%
				}
				
			%>
		</div>
	</div>

	
</body>
</html>
