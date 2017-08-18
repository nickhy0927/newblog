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
    <script type="text/javascript" src="${ctx}/static/jquery-ui/external/jquery/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/static/jquery-ui/jquery-ui.js"></script>
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
    </style>
    <script type="text/javascript">

        function closeLoading() {
            $("#submitDialog").dialog('close')
        }
        function openLoading() {
            $("#submitDialog").dialog({
                closeOnEscape: false,
                width: 250,
                dialogClass: "no-close",
                height: 100,
                resizable: false,
                draggable: false,
                modal: true,
                //隐藏默认的关闭按钮
                open: function (event, ui) {
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide();
                    $(".ui-dialog-titlebar").remove();
                    $("#submitDialog").attr('style', 'width: auto;min-height: 0px;max-height: none;height: 30px;color:white')
                    $("#submitDialog").parent().css('background', "#969494");
                }
            });
//            $("#submitDialog").dialog('close');
        }
    </script>
    <pgs:block name="javascript"></pgs:block>
</head>
<body>
<pgs:block name="body"></pgs:block>
<div id="submitDialog" style="display: none;">
    <img style="height: 30px;" src="${ctx}/static/jquery-ui/loading_circle_40b82ef.gif">
    &nbsp;&nbsp;<span>正在操作，请稍候...</span>
</div>
</body>
</html>
