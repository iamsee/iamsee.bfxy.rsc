<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String str = (String)session.getAttribute("str");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 配置文件 -->
<script type="text/javascript" charset="utf-8"
	src="main/ueditor/ueditor.config.js">
</script>
<!-- 编辑器源文件 -->
<script type="text/javascript" charset="utf-8"
	src="main/ueditor/ueditor.all.min.js">
</script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="main/ueidtor/lang/zh-cn/zh-cn.js">
</script>
<script>
		function sub(){
			var content = $("content").val();
			alert(content);
			return false;
			
		}
	</script>
<!-- 默认样式 -->
<link type="text/css" href="main/ueditor/themes/default/css/ueditor.css"
	rel="stylesheet" />
</head>

<body>


	<form action="servlet/createdocaction" method="post" id="myform">
		标题： <input type="text" name="title" /> <br />

		<textarea name="content" id="content" style="width: 800px"><%=str %></textarea>

		

	</form>

	<!-- 实例化编辑器 -->
	<script type="text/javascript">
			var ue = UE.getEditor("content");
		</script>
</body>
</html>
