<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from rsc.xmu.edu.cn/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 19 Aug 2014 19:09:19 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>河北北方学院 人事处</title>
    <link href="css/reset.css" rel="Stylesheet" type="text/css" />
    
    <link href="main/pager.css" rel="Stylesheet" type="text/css" />
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

<LINK href="css/divwin.css" type="text/css" rel="stylesheet">
</head>
<body>

    <!-- banner -->
    <div class="pager_gg_b">
        <div class="gg_bd">
            <ul>
                <li> <a href="#" target="_blank"><img src="images/banner/zp.png" /></a></li>
                <li>
                    <img src="images/banner/1.jpg" /></li>
                <li>
                    <img src="images/banner/2.jpg" /></li>
            </ul>
        </div>
        <div class="gg_hd">
            <ul>
            </ul>
        </div>
    </div>
  </body>
</html>
<script src="include/jquery.js" type="text/javascript"></script>
<script src="include/jquery.SuperSlide.2.1.js" type="text/javascript"></script>
<script src="include/ui.js" type="text/javascript"></script>
<script type="text/javascript">
    window.onload = function () {
        //jQuery(".pager_gg_b").slide({ titCell: ".gg_hd ul", mainCell: ".gg_bd ul", autoPage: true, effect: "fold", autoPlay: true, delayTime: 3000, triggerTime: 3000 });
        jQuery(".pager_gg_b").slide({ titCell: ".gg_hd ul", mainCell: ".gg_bd ul", autoPage: true, effect: "left", autoPlay: true });
        jQuery(".bookinfob").slide({ titCell: ".book_hd ul", mainCell: ".book_bd ul", autoPage: true, effect: "left", autoPlay: true,delayTime:3000,triggerTime:3000  });
    }
</script>

