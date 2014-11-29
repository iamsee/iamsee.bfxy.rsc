<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.iamsee.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList menulist = (ArrayList)session.getAttribute("menulist");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="main/css/reset.css">
<link rel="stylesheet" type="text/css" href="main/css/common.css">
<link rel="stylesheet" type="text/css" href="main/css/ui/pager.css">
<script language="JavaScript" src="main/include/classbase.js"
	type="text/javascript"></script>
<script language="JavaScript" src="main/include/windowopener.js"
	type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="main/css/divwin.css">


</head>

<body>

	<!-- 左边 -->
	<div class="pager_center_left">
		<div class="bookinfob">
			<div class="book_bd">
				<ul>
					<li><a href="#" target="_blank"> <img
							src="main/images/book/a.png" width="212" height="330" /></a></li>
					<li><a href="#" target="_blank"> <img
							src="main/images/book/b.png" /></a></li>
					<li><a href="#" target="_blank"> <img
							src="main/images/book/c.png" /></a></li>
					<li><a href="#" target="_blank"> <img
							src="main/images/book/d.png" /></a></li>
				</ul>
			</div>
			<div class="book_hd">
				<ul>
				</ul>
			</div>
		</div>
		<div class="zhengcebg">
			<h3>
				文件一览 <span>Policy Document</span>
			</h3>
			<ul class="zcul">
				 <%if(menulist == null || menulist.size()==0){
         %>
         <li>没有获取到menulist</li>
         <%}
         else{
         	for(int i =0;i<menulist.size();i++)
         	{
         		Menu menu = (Menu)menulist.get(i);
       
          %>
          <li><a href="servlet/domenuaction?menuId=<%=menu.getId() %>"><%=menu.getMenuname() %></a></li>
          <%  	
          }
         }
          %>
			</ul>
		</div>
		<div class="webinfo">
			<h3>
				人事处简介 <span>Introduction</span>
			</h3>
			<div class="title1">
				<a href="#" target="_blank">职责分工</a>
			</div>
			<div class="title2">联系方式：</div>
			<table cellspacing=0 cellpadding=0 border=0
				class='tbl_ArticlePortlet_picTitleClass'>
				<tr>
					<td height=1 width="100%"><table border="0" cellspacing="0"
							width="100%">
							<tr>
								<td>
									<ul class="webul">
										<li>招聘邮箱：bfxyrczp@163.com</li>
										<li>招聘网站：
										<li><a href="http://www.he.lss.gov.cn" arget="_Blank">河北人力资源和社会保障网</a></li>
										
										<li><a href="http://www.hebpta.com.cn" arget="_Blank">河北省人事考试网</a></li>
										
										<li><a href="http://www.hebeinu.edu.cn" arget="_Blank">河北北方学院网站</a></li>
										</li>
										<li>地址：张家口钻石南路11号</li>
										<li>学院电话：
										(0313)4029182
										(0313)4029220<br>
										(0313)4029221</li>
										
									</ul>
								</td>
							</tr>
						</TABLE></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
<script src="main/include/jquery.js" type="text/javascript"></script>
<script src="main/include/jquery.SuperSlide.2.1.js" type="text/javascript"></script>
<script src="main/include/ui.js" type="text/javascript"></script>
<script type="text/javascript">
    window.onload = function () {
        //jQuery(".pager_gg_b").slide({ titCell: ".gg_hd ul", mainCell: ".gg_bd ul", autoPage: true, effect: "fold", autoPlay: true, delayTime: 3000, triggerTime: 3000 });
        jQuery(".pager_gg_b").slide({ titCell: ".gg_hd ul", mainCell: ".gg_bd ul", autoPage: true, effect: "left", autoPlay: true });
        jQuery(".bookinfob").slide({ titCell: ".book_hd ul", mainCell: ".book_bd ul", autoPage: true, effect: "left", autoPlay: true,delayTime:3000,triggerTime:3000  });
    }
</script>
