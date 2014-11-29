<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.iamsee.bean.*"%>

<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList menulist = (ArrayList)session.getAttribute("menulist");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'adminshowdocs.jsp.jsp' starting page</title>

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
	<div class="pager_center_right">
		<div class="bigbody">
			<form action="servlet/showdocsaction" method="post" id="myform">
				<center>
					<select id="condition" name="condition" style="width: 200px;">
						<%
							if (menulist == null || menulist.size() == 0) {
						%>
						<option value="0">没有获取到menulist</option>
						<%
							} else {
											for (int i = 0; i < menulist.size(); i++) {
												Menu menu = (Menu) menulist.get(i);
						%>

						<option value="<%=menu.getMenusign()%>"><%=menu.getMenuname()%></option>
						<%
						
							}
										}
						%>
					</select> <input type="submit" style="width: 71px; height: 31px" value="筛选">
					



					
				</center>
			</form>

		</div>
	</div>
	<div class="com_ClearAll"></div>
	</div>
</body>
</html>
