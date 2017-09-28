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
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>
        <pgs:block name="title"></pgs:block>
    </title>
    <link rel="Bookmark" href="${ctx}/static/favicon.ico">
    <pgs:block name="css"></pgs:block>
    <pgs:block name="javascript"></pgs:block>
</head>
<body>
<pgs:block name="body"></pgs:block>
abc
</body>
</html>
