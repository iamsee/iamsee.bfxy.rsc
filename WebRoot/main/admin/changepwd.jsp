<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changepwd.jsp' starting page</title>
    
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
  <script type="text/javascript">
  	function checkrepwd(){
  	 	var newpwd =document.getElementById('newpwd').value;
  	 	var renewpwd = document.getElementById("renewpwd").value;
  		var oldpwd = document.getElementById("oldpwd").value;
  	
  	alert(oldpwd);
  		if(newpwd==""||renewpwd==""||oldpwd=="")
  		{
  			alert("输入不能为空！");
  			return false;
  		}
  		else
  		{
  		if(newpwd!=renewpwd )
  		{ 
  			alert("重复新密码不匹配！")
  			document.getElementById("newpwd").valueOf("");
  			document.getElementById("renewpwd").valueOf("");
  			document.getElementById("newpwd").focus();
  			return false;
  			
  		}
  		else
  		{
  			return true;
  		}
  		}
  		 
  	}
  </script>
  <form action="servlet/changepwdaction" id="changepwdform"  method="post" onsubmit="return checkrepwd()" >
    <div class="pager_center_right">
		<div class="bigbody">
		<center>
		<table><tr>
		<td>原密码：</td>
		<td><input type="password" name="oldpwd" id="oldpwd"></td>
		</tr>
		<tr>
		<td>新密码: </td>
		<td><input type="password" name="newpwd" id="newpwd">
		</td>
		</tr>
		<tr>
			<td>重复新密码:</td>
			<td><input type="password" name="renewpwd" id="renewpwd"></td>
		</tr>
		
		<tr>
		<td colspan="2" align="center"><input type="submit" value="提交"  ></td>
		</tr>
			
						
			</table>
		</center>
		</div>
		</div>
		<div class="com_ClearAll"></div>
	</div>
	</form>
  </body>
</html>
