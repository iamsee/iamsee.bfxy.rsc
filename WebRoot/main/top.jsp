<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.iamsee.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList menulist = (ArrayList)session.getAttribute("menulist");

System.out.println("path:"+path);
System.out.println("basePath:"+basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tom.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="main/css/reset.css">
	<link rel="stylesheet" type="text/css" href="main/css/common.css">
	<link rel="stylesheet" type="text/css" href="main/css/ui/pager.css">
	
  
    
       <script type='text/javascript'>
        function AddFavorite(sURL, sTitle) {
            try {
                window.external.addFavorite(sURL, sTitle);
            }
            catch (e) {
                try {
                    window.sidebar.addPanel(sTitle, sURL, "");
                }
                catch (e) {
                    alert("加入收藏失败，请使用Ctrl+D进行添加");
                }
            }
        }
    </script>
<script language="JavaScript" src="include/classbase.js" type="text/javascript"></script>
<script language="JavaScript" src="include/windowopener.js" type="text/javascript"></script>

	<link rel="stylesheet" type="text/css" href="main/css/divwin.css">

  </head>
  
  <body>
      <!-- top -->
    <div class="c_centw pager_top_h com_Center_MaT0Auto com_Relative">
        <div class="pager_top_logo">
        </div>
        <ul class="pager_top_nav">
            <li><a href="main/login.jsp">权限登陆</a></li>
            <li><a onclick="AddFavorite(window.location,document.title)">加入收藏</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
             </ul>
       <!--  <div class="pager_search_b">
            <form id='searchForm8' name='searchForm8' action='#' method='post' style='display: inline'>
            <input type='text' class='search_input' name='searchTitle'>
            <input type="submit" class="search_submit" value="搜索" onclick="document.getElementById('searchForm8').submit();" />
            </form>
            <script type='text/javascript'>                document.getElementById('searchForm8').action = '#' + window.location.host</script>
        </div> -->
    </div>
    <!-- nav -->
            <ul class="c_centw pager_nav_h com_Center_MaT0Auto">
        <li><a href="<%=basePath %>index.jsp">首&nbsp;&nbsp;页</a></li>
        
  
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
        
    
        <li><a href="http://blog.iamsee.com:9090/iamsee.bfxy.yggl">员工信息平台</a></li>
    </ul>
        </ul>
       
    </div>
    <!-- nav -->
    
     <!-- banner -->
    <div class="pager_gg_b">
        <div class="gg_bd">
            <ul>
                <li> <a href="#" target="_blank"><img src="main/images/banner/1.png" /></a></li>
                <li>
                    <img src="main/images/banner/2.png" /></li>
                <li>
                    <img src="main/images/banner/3.png" /></li>
            </ul>
        </div>
        <div class="gg_hd">
            <ul>
            </ul>
        </div>
    </div>
    <!-- body -->
    <div class="pager_center">
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
