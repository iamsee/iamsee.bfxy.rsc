<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String adminmainpage = (String)session.getAttribute("adminmainpage");
System.out.println(adminmainpage);
if(adminmainpage==null || adminmainpage.equals("")){
		adminmainpage="rightshow.jsp";
	}
	adminmainpage="admin/"+adminmainpage;

System.out.println(adminmainpage);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
    <jsp:include page="leftlogin.jsp"></jsp:include>
 <jsp:include page="<%=adminmainpage %>"></jsp:include>  
 
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>
