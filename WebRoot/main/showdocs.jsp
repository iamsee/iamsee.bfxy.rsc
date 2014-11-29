<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.iamsee.bean.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	ArrayList menulist = (ArrayList) session.getAttribute("menulist");

	System.out.println(menulist.size());
	ArrayList docslist = (ArrayList) session.getAttribute("docslist");
	System.out.println(docslist.size());

	int pageNumber = (int) session.getAttribute("pageNumber");
	int totalPages = (int) session.getAttribute("totalPages");
	int pageSize = (int) session.getAttribute("pageSize");
	int totalPosts = (int) session.getAttribute("totalPosts");

	System.out.println(pageNumber);
	System.out.println(totalPages);
	System.out.println(pageSize);
	System.out.println(totalPosts);
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



					<table>
						<tr>

							<td style="width: 420px; " align="center"><h3 class="bigh">
									<center>文档标题</center>
								</h3></td>
							<td style="width: 80px" align="center"><h3 class="bigh">发布时间</h3>

							</td>

						</tr>


						<br>
						<br>
						<br>
						<br>

						<%
							if (docslist == null || docslist.equals("")) {
						%>
						<tr>
							<td><p>没有相关到信息</p></td>
						</tr>
						<%
							} else {
								for (int i = 0; i <docslist.size(); i++) {
									Docs docs = (Docs) docslist.get(i);
						%>
						<tr>

							<td style="width: 460px; " align="center">
								<center>
									<a
										href="servlet/dodocsaction?action=view&power=normal&id=<%=docs.getId()%>"><%=docs.getTitle()%>
									</a>
								</center>
							<td style="width: 40px; " align="center"><%=docs.getTime()%></td>

						</tr>


						<%
							}
							}
						%>

					</table>
				</center>
			</form>
			<script type="text/javascript">
				function gotoSelectedPage() {
					var x = document.getElementById("navigatorForm");
					//alert("Original action: " + x.action)
					x.submit();
				}
			</script>

			<br>
			<br>
			<br>
			<br>
			<center>
				<form action="servlet/dopageaction" method="get" id="navigatorForm">

					<a href="servlet/dopageaction?pageNumber=1">首页</a>

					<%
						if (pageNumber > 1) {
					%>
					<a href="servlet/dopageaction?pageNumber=${pageNumber-1}">上一页</a>
					<%
						}
					%>
					跳转到第 <select name="pageNumber" onchange="gotoSelectedPage();">

						<%
							for (int i = 1; i <= totalPages; i++) {
						%>

						<%
							if (i == pageNumber) {
						%>
						<option value="<%=i%>" selected="selected"><%=i%></option>
						<%
							} else {
						%>

						<option value="<%=i%>"><%=i%></option>


						<%
							}
							}
						%>
					</select>页

					<%
						if (pageNumber < totalPages) {
					%>
					<a href="servlet/dopageaction?pageNumber=${pageNumber+1}">下一页</a>
					<%
						} else {
					%>
					<a href="servlet/dopageaction?pageNumber=${totalPages}">末页</a>
					<%
						}
					%>
				</form>
			</center>

		</div>
	</div>
	<div class="com_ClearAll"></div>
	</div>
</body>
</html>
