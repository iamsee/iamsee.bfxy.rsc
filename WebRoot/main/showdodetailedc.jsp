<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.iamsee.bean.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String menuname =(String)session.getAttribute("menuname");
System.out.println("menuname");
Docs doc = (Docs)session.getAttribute("doc");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show.jsp' starting page</title>
    
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
		
  		类别：<%=menuname %>
    	<br/>
    	<center>
  		<font size="18px"> <%=doc.getTitle() %></font>
    	<br/>
   		<br/>
   		<br/>
   		<br/>
   		<br/>
    	<%=doc.getContent()%>
    	
    	</center>
    	<br>
    	<div align="right">
    	<%=doc.getTime() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	
    	</div>
    	</div>
    	</div>
    	<div class="com_ClearAll"></div>
	</div>
  </body>
</html>
