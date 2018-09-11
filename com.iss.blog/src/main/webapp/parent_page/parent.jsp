<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>
<!DOCTYPE html>
<html>
<head>
	<title>
		<pgs:block name="title"></pgs:block>
	</title>
    <meta http-equiv="Content-Type" content="text/html; charset=${charset}"/>
    <meta http-equiv="Content-Language" content="${lang}"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/H-ui.admin.css">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="Bookmark" href="/favicon.ico">
    <link rel="Shortcut Icon" href="/favicon.ico"/>
    <meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
    <link rel="favicon.ico" href="${ctx}/assets/images/favicon.ico" type="image/x-icon"/>
    <link rel="icon" href="${ctx}/assets/images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="${ctx}/assets/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/skin/bluet/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"> <!-- zTree插件 -->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/pagination.css" media="screen"/> <!-- 分页样式 -->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/lib/font-awesome/css/font-awesome.min.css"/> <!-- 自定义样式 -->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/style.css"/> <!-- 自定义样式 -->
    <pgs:block name="css"></pgs:block>
    <style type="text/css">
        .ui-widget-overlay {
            opacity: .5;
            background: #eee;
            filter: Alpha(Opacity=80);
        }

        p {
            margin-bottom: 0px;
        }
        .check-box, .radio-box {
            padding-left: 5px;
        }
        a.btn, a.btn.size-M, span.btn, span.btn.size-M {
		    line-height: 23px;
		}
    </style>
    <link rel="stylesheet" href="${ctx}/assets/lib/layui/css/layui.css" media="all">
	<script src="${ctx}/assets/lib/layui/layui.js"></script>
    <script type="text/javascript">
        var ctx = '${ctx}';
    </script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${ctx}/assets/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${ctx}/assets/lib/respond.min.js"></script>
    <![endif]-->
    <!--[if IE 6]>
    <script type="text/javascript" src="${ctx}/assets/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <script type="text/javascript" src="${ctx}/assets/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/assets/lib/jquery/1.9.1/jquery.core.autocomplete.js"></script>
    <script type="text/javascript" src="${ctx}/assets/lib/jquery/1.9.1/jquery.mockjax.js"></script>
    <script type="text/javascript" src="${ctx}/assets/lib/jquery/1.9.1/countries.js"></script>
    <script type="text/javascript" src="${ctx}/assets/lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="${ctx}/assets/js/H-ui.min.js"></script>
    <script type="text/javascript" src="${ctx}/assets/js/H-ui.admin.js"></script>
    <script type="text/javascript" src="${ctx}/assets/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
    <!-- zTree插件 -->
    <script type="text/javascript" src="${ctx}/assets/js/jquery.core.ajaxtable.js"></script> <!-- table插件 -->
    <script type="text/javascript" src="${ctx}/assets/js/codeTool.js"></script> <!-- 公共编解码 定制方法 -->
    <script type="text/javascript" src="${ctx}/assets/js/jquery.pagination.js"></script> <!-- 翻页插件 -->
    <script type="text/javascript" src="${ctx}/assets/lib/jquery-ui/iss-util.js"></script> <!-- 信息提示框 -->
    <script type="text/javascript" src="${ctx}/assets/lib/jquery-ui/iss-util-editer.js"></script> <!-- 信息提示框 -->
    <script type="text/javascript" src="${ctx}/assets/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
    <!-- 表单验证插件 -->
    <script type="text/javascript" src="${ctx}/assets/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <!-- 表单验证插件 -->
    <script type="text/javascript" src="${ctx}/assets/lib/jquery.validation/1.14.0/messages_zh.js"></script> <!-- 表单验证插件 -->
    <script type="text/javascript" src="${ctx}/assets/lib/angular/v1.2.30/angular.min.js"></script><!-- 引入angularJS -->
    <script type="text/javascript" src="${ctx}/assets/lib/angular/v1.2.30/app.js"></script><!-- 引入angularJS -->
    <script type="text/javascript" src="${ctx}/assets/lib/angular/v1.2.30/controllers.js"></script>
    <script type="text/javascript" src="${ctx}/assets/lib/angular/v1.2.30/services.js"></script>
    <script type="text/javascript" src="${ctx}/assets/js/common/tools.js"></script>
	<pgs:block name="javascript"></pgs:block>
</head>
<body>
	<pgs:block name="body"></pgs:block>
</body>
</html>
