<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.iamsee.bean.*"%>

<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList menulist = (ArrayList)session.getAttribute("menulist");

System.out.println(menulist.size());
ArrayList docslist = (ArrayList)session.getAttribute("docslist");
System.out.println(docslist.size());

int pageNumber = (int)session.getAttribute("pageNumber");
int totalPages =  (int)session.getAttribute("totalPages");
int pageSize =  (int)session.getAttribute("pageSize");
int totalPosts = (int)session.getAttribute("totalPosts");

boolean backmsgdeldoc = (boolean)session.getAttribute("backmsgdeldoc");
System.out.println(backmsgdeldoc);
if(backmsgdeldoc==true){
backmsgdeldoc = false;
session.removeAttribute("backmsgdeldoc");
session.setAttribute("backmsgdeldoc", backmsgdeldoc);
%>
<script type="text/javascript"> alert("删除成功！"); </script>
<%}


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



					<table>
						<tr>
							<td style="width: 256px; "><p>文章标题</p></td>
							<td><p>发布时间</p></td>

						</tr>

						<%
							if(docslist==null||docslist.equals("")){
						%>
						<tr>
							<td><p>没有相关到信息</p></td>
						</tr>
						<%
							}else{
									for(int i=0;i<docslist.size();i++)
									{
										Docs docs = (Docs)docslist.get(i);
						%>
						<tr>
							<td><p>
									<a href="servlet/dodocsaction?action=view&power=master&id=<%=docs.getId()%>"><%=docs.getTitle()%>
								</p> </a>
							<td><p><%=docs.getTime()%></p></td>

							<td><p>
									<a
										href="servlet/dodocsaction?action=changedoc&power=master&id=<%=docs.getId()%>">修改</a>
								</p></td>
							<td><p>
									<a
										href="servlet/dodocsaction?action=deldoc&power=master&id=<%=docs.getId()%>">删除</a>
								</p></td>
						</tr>


						<%
							}
									 }
						%>

					</table>
				</center>
			</form>
			<script type="text/javascript">
function gotoSelectedPage()
{
	var x = document.getElementById("navigatorForm");
	//alert("Original action: " + x.action)
	x.submit();
}
</script>
			<form action="servlet/dopageaction" method="get" id="navigatorForm">

				<a href="servlet/dopageaction?pageNumber=1">首页</a>

				<%
					if(pageNumber>1){
				%>
				<a href="servlet/dopageaction?pageNumber=${pageNumber-1}">上一页</a>
				<%
					}
				%>
				跳转到第 <select name="pageNumber" onchange="gotoSelectedPage();">

					<%
						for(int i =1;i<=totalPages;i++) 
						{%>

					<%if(i== pageNumber){%>
					<option value="<%=i
					%>" selected="selected"><%=i%></option>
					<%
						}else{
					%>

					<option value="<%=i%>"><%=i %></option>


					<%
						}}
					%>
				</select>页

				<%
					if(pageNumber<totalPages) {%>
				<a href="servlet/dopageaction?pageNumber=${pageNumber+1}">下一页</a>
				<%}else{
				%>
				<a href="servlet/dopageaction?pageNumber=${totalPages}">末页</a>
				<%
					}
				%>
			</form>

		</div>
	</div>
	<div class="com_ClearAll"></div>
	</div>
</body>
</html>
