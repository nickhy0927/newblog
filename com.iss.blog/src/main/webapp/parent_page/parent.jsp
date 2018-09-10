<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>
		<pgs:block name="title"></pgs:block>
	</title>
	
	<link rel="favicon.ico" href="${ctx}/static/images/favicon.ico"  type="image/x-icon"/>
	<link rel="icon" href="${ctx}/static/favicon.ico"  type="image/x-icon"/>
	<link rel="shortcut icon" href="${ctx}/static/images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/skin/green/skin.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"> <!-- zTree插件 -->
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/pagination.css" media="screen"/> <!-- 分页样式 -->
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/style.css" /> <!-- 自定义样式 -->
	<pgs:block name="css"></pgs:block>
	<style type="text/css">
		.ui-widget-overlay {
		    opacity: .5;
		    background: #eee;
		    filter: Alpha(Opacity=80);
		}
	</style>
	<script type="text/javascript">
    	var ctx = '${ctx}'
    </script>
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${ctx}/static/lib/html5shiv.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/respond.min.js"></script>
	<![endif]-->
	<!--[if IE 6]>
	<script type="text/javascript" src="${ctx}/static/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<script type="text/javascript" src="${ctx}/static/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${ctx}/static/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/H-ui.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/H-ui.admin.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script> <!-- zTree插件 -->
	<script type="text/javascript" src="${ctx}/static/js/jquery.core.ajaxtable.js"></script> <!-- table插件 -->
	<script type="text/javascript" src="${ctx}/static/js/jquery.pagination.js"></script> <!-- 翻页插件 -->
	<script type="text/javascript" src="${ctx}/static/lib/jquery-ui/iss-util.js"></script> <!-- 信息提示框 -->
	<script type="text/javascript" src="${ctx}/static/lib/jquery.validation/1.14.0/jquery.validate.js"></script> <!-- 表单验证插件 -->
	<script type="text/javascript" src="${ctx}/static/lib/jquery.validation/1.14.0/validate-methods.js"></script> <!-- 表单验证插件 -->
	<script type="text/javascript" src="${ctx}/static/lib/jquery.validation/1.14.0/messages_zh.js"></script> <!-- 表单验证插件 -->
	<pgs:block name="javascript"></pgs:block>
</head>
<body>
	<pgs:block name="body"></pgs:block>
</body>
</html>
