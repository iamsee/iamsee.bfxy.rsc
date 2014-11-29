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
								<td align=left><a href='servlet/dodocsaction?action=view&power=normal&id=<%=doc_1.getId() %>' target=_blank title="<%=doc_1.getTitle()%>"><h3><%=doc_1.getTitle() %></h3></a></td>
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
				网上办事大厅 <span>Service Center</span>
			</h3>
			<h3 class="bigh">服务平台：登录办理相关业务</h3>
			<ul class="bigul">
				<li><a href="http://zp.xmu.edu.cn/zpsys/" target="_blank">
						<img src="main/images/icon/contacts_32.png" /> 招聘系统
				</a></li>
				<li><a href="http://121.192.191.149/salary" target="_blank">
						<img src="main/images/icon/finance_32.png" /> 工资查询
				</a></li>
				<li><a href="http://121.192.191.149/leave" target="_blank">
						<img src="main/images/icon/group_32.png" /> 探亲假报销
				</a></li>
				<li><a href="http://121.192.191.149/certify"> <img
						src="main/images/icon/remsjozjemg.png" /> 人事证明
				</a></li>
			</ul>
			<div class="com_ClearAll"></div>
			<h3 class="bigh">场景式服务：相关业务办理指南</h3>
			<ul class="bigul">
				<li><a href="#"> <img src="main/images/icon/copy_32.png" />
						聘任考核
				</a></li>
				<li><a href="#"> <img
						src="main/images/icon/applications_32.png" /> 重要岗位
				</a></li>
				<li><a href="#"> <img
						src="main/images/icon/20140112010603532_easyicon_.png" /> 人才项目申报
				</a></li>
				<li><a href="s/137/t/722/p/1/c/8554/d/8582/list.html"> <img
						src="main/images/icon/web_32.png" /> 国内外研修
				</a></li>
				<li><a href="s/137/t/722/p/1/c/6462/list.html"> <img
						src="main/images/icon/import_32.png" /> 博士后
				</a></li>
				<li><a href="s/137/t/722/p/1/c/8554/d/8584/list.html"> <img
						src="main/images/icon/2221.png" /> 报到离校
				</a></li>
				<li><a href="s/137/t/722/p/1/c/8554/d/8585/list.html"> <img
						src="main/images/icon/et_.png" /> 请假考勤
				</a></li>
				<li><a href="s/137/t/722/p/1/c/8554/d/8586/list.html"> <img
						src="main/images/icon/ganbubaojian.png" /> 干部保健
				</a></li>
				<li><a href="s/137/t/722/p/1/c/8554/d/8588/list.html"> <img
						src="main/images/icon/renshidangan.png" /> 人事档案
				</a></li>
			</ul>
		</div>
	</div>
	<div class="com_ClearAll"></div>
	</div>
</body>
</html>
