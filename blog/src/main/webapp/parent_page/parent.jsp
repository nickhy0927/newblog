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
    <link rel="Shortcut Icon" href="${ctx}/static/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/admin/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/admin/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/admin/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/admin/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/admin/h-ui.admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/lib/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/jquery-ui/jquery-ui.css"/>

    <pgs:block name="css"></pgs:block>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${ctx}/static/admin/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/respond.min.js"></script>
    <![endif]-->
    <!--[if IE 6]>
    <script type="text/javascript" src="${ctx}/static/admin/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->
    <script type="text/javascript">
    	var ctx = '${ctx}'
    </script>
    <script type="text/javascript" src="${ctx}/static/jquery-ui/external/jquery/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/static/jquery-ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${ctx}/static/jquery-ui/iss-util.js"></script>
    <style type="text/css">
        #submitDialog img {
            opacity: 0.5;
            filter: "alpha(opacity=50)";
            -ms-filter: "alpha(opacity=50)"; /* 旧版IE */
        }

        #submitDialog img, #submitDialog span {
            float: left;
            line-height: 30px;
        }

        #submitDialog span {
            padding-left: 10px;
        }
        
        .ui-dialog .ui-dialog-buttonpane button {
        	margin: 0em 0em 0em 1em;
        }
        
        .ui-dialog .ui-dialog-buttonpane {
		    padding: .3em 0em 0.3em .4em;
		}
    </style>
    <script type="text/javascript">
        
    </script>
    <pgs:block name="javascript"></pgs:block>
</head>
<body>
<pgs:block name="body"></pgs:block>
</body>
</html>
