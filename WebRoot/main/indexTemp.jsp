<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String mainpage = (String)session.getAttribute("mainpage");
if(mainpage==null || mainpage.equals("")){
		mainpage="show.jsp";
	}
System.out.println(mainpage);
	
	
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'indexTemp.jsp' starting page</title>
    
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
  
    <jsp:include page="top.jsp"></jsp:include>
    <jsp:include page="left.jsp"></jsp:include>
    <jsp:include page="<%=mainpage %>"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
