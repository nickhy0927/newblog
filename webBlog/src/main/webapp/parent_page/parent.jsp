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
    <link rel="Bookmark" href="${ctx}/static/favicon.ico">
    <link href="${ctx}/static/lib/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${ctx}/static/lib/js/jquery.min.js"></script>
	<!-- Custom Theme files -->
	<link href="${ctx}/static/lib/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Custom Theme files -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- for bootstrap working -->
	<script type="text/javascript" src="${ctx}/static/lib/js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- web-fonts -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
	<script src="${ctx}/static/lib/js/responsiveslides.min.js"></script>
    <pgs:block name="css"></pgs:block>
    <pgs:block name="javascript"></pgs:block>
</head>
<body>
<pgs:block name="body"></pgs:block>
</body>
</html>
