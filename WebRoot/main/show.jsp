<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.iamsee.bean.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	ArrayList docslist_1 = (ArrayList) session
			.getAttribute("docslist_1");
	ArrayList docslist_4 = (ArrayList) session
			.getAttribute("docslist_4");
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

	<!-- 右边 -->
	<div class="pager_center_right">
		<div class="centlistb com_fl">
			<h3 class="pager_title">
				通知公告 <span>Notice</span> <a href="#">more</a>
			</h3>
			<%if(docslist_1==null||docslist_1.size()==0) {%>
			dolist_1为空
			<%}else{ 
			for(int i =0 ;i<docslist_1.size();i++)
			{
				Docs doc_1 = new Docs();
				doc_1 = (Docs)docslist_1.get(i);
			%>
			<table width="98%" border="0" align="center" cellspacing="0">
				<tr>
					<td width="3%" height="32" align="center" valign="middle"><img
						src="main/images/bg/bg_li_bg.png" width="12" height="11" alt="" /></td>
					<td width="97%">
						<table width=100% cellpadding=0 cellspacing=0 border=0>
							<tr>
								<td align=left><a href='servlet/dodocsaction?action=view&power=normal&id=<%=doc_1.getId() %>' target=_blank title="<%=doc_1.getTitle()%>"><%=doc_1.getTitle() %></a></td>
								<td width='50' align=right><div style='white-space:nowrap'><%=doc_1.getTime() %></div></td>
							</tr>
						</table>
					</td>
				</tr>

			
			</TABLE>
			<%} 
			}
			%>
		</div>
		<div class="centlistb com_fr">
			<h3 class="pager_title">
				招聘信息 <span>Recruitment</span> <a
					href="s/137/t/722/p/1/c/6467/d/6557/list.html">more</a>
			</h3>
			<%if(docslist_4==null||docslist_4.size()==0) {%>
			dolist_4为空
			<%}else{ 
			for(int i =0 ;i<docslist_4.size();i++)
			{
				Docs doc_4 = new Docs();
				doc_4 = (Docs)docslist_4.get(i);
			%>
			<table width="98%" height="32" border="0" align="center"
				cellspacing="0">
				<tr>
					<td width="3%" height="32" align="center" valign="middle"><img
						src="main/images/bg/bg_li_bg.png" width="12" height="11" alt="" /></td>
					<td width="97%">
						<table width=100% cellpadding=0 cellspacing=0 border=0>
							<tr>
								<td align=left><a href='servlet/dodocsaction?action=view&power=normal&id=<%=doc_4.getId() %>'
									target=_blank title="<%=doc_4.getTitle()%>>"><font color='#fb0310'><%=doc_4.getTitle() %></font></a></td>
								<td width='50' align=right><div style='white-space:nowrap'><%=doc_4.getTime() %></div></td>
							</tr>
						</table>
					</td>
				</tr>

				<%}} %>
			</TABLE>
		</div>
		<div class="com_ClearAll"></div>
		<div class="bigbody">
			<h3 class="bigtitle">
				展示中心<span>&nbsp;Show Center</span>
			</h3>
			<h3 class="bigh">领导教师</h3>
			<marquee direction=left>
			<img alt="安 峰" src="main/images/per/安 峰.png">
			<img alt="党委副书记、纪委书记：鲁杰.png" src="main/images/per/党委副书记、纪委书记：鲁杰.png">
			<img alt="安 峰" src="main/images/per/党委书记、院长：张力.png">
			<img alt="安 峰" src="main/images/per/舒丽莎.png">
			<img alt="安 峰" src="main/images/per/温一军.png">
			<img alt="安 峰" src="main/images/per/肖守库.png">
			<img alt="安 峰" src="main/images/per/薛 军.png">
			<img alt="安 峰" src="main/images/per/袁  铸.png">
			<img alt="安 峰" src="main/images/per/张 健.png">
			<img alt="安 峰" src="main/images/per/邹玉安.png">
			</marquee>
			
			<div class="com_ClearAll"></div>
			<h3 class="bigh">学院链接</h3>
			<ul class="bigul">
				<li><a href="http://60.8.194.163:7777/ise//"> <img src="main/images/xingong.png" />
						
				</a></li>
				<li><a href="http://lxy.hebeinu.edu.cn/lxy.htm"> <img
						src="main/images/lixueyuan.png" /> 
				</a></li>
				<li><a href="http://wxy.hebeinu.edu.cn/"> <img
						src="main/images/wenxueyuan.png" /> 
				</a></li>
				<li><a href="http://wyxy.hebeinu.edu.cn/wgyweb/"> <img
						src="main/images/waiguoyu.png" /> 
				</a></li>
				<li><a href="http://jgx.hebeinu.edu.cn/"> <img
						src="main/images/jingguan.png" /> 
				</a></li>	
				<li><a href="http://fzxy.hebeinu.edu.cn/"> <img
						src="main/images/fazheng.png" /> 
				</a></li>
				
			</ul>
		</div>
	</div>
	<div class="com_ClearAll"></div>
	</div>
</body>
</html>
