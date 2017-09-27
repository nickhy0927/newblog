<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" type="text/css" href="${ctx}/static/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="${ctx}/static/jquery-easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/h-ui.admin/js/H-ui.admin.js"></script>
    <!--/_footer /作为公共模版分离出去-->

    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="${ctx}/static/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
    <script type="text/javascript" src="${ctx}/static/ztree/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/ztree/js/jquery.ztree.excheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/ztree/js/jquery.ztree.exedit.min.js"></script>
    <style type="text/css">
        .col-xs-6 {
            margin: 20px;
            float: left;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#query').datagrid('loadData', {total: 0, rows: []});
            $("#query").datagrid({
                title: "用户列表",
                border: true,
                locale: "zh_CN",
                striped: true,
                sortOrder: "desc",
                collapsible: false,
                url: "${ctx}/system/user/role/list.json",
                columns: [[
                    {field: 'realName', title: '真实姓名', width: 80},
                    {field: 'loginName', title: '登录名', width: 93},
                    {
                        field: 'cardType',
                        title: '证件类型',
                        width: '100px',
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            if (value == 1) {
                                return "身份证";
                            }
                            return "a";
                        }
                    },
                    {field: 'idCard', title: '证件号码'},
                    {
                        field: 'locked',
                        title: '是否锁定',
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            if (value == false) {
                                return "否";
                            }
                            return "是";
                        }
                    },
                    {
                        field: 'disabled',
                        title: '是否可用',
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            if (value == false) {
                                return "否";
                            }
                            return "是";
                        }
                    },
                    {
                        field: 'id',
                        title: '操作',
                        align: 'center',
                        formatter: function (val, row) {
                            return '<a href="#" onclick="addRole(\'' + row.id + '\')\"></i>添加权限</a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="view(\'' + row.id + '\')\">查看权限</a>';
                        }
                    },
                ]],
                pagination: true,//表示在datagrid设置分页
                rownumbers: false,
                singleSelect: true
            });
            init();
            $('#query').datagrid('clearSelections');
            //条件查询
            function Search() {
                var queryParameter = $('#dataGrid').datagrid("options").queryParams;
                queryParameter.dtNumber = $("#dtNumber").val();
                queryParameter.dtTitle = $("#dtTitle").val();
                $("#dataGrid").datagrid("reload");
            }
        });

        function init() {
            queryDataGrid();
        }
        /*function article_add(title, url, w, h) {
         layer_show(title, url, w, h);
         }*/
        function addRole(id) {
            var url = "${ctx}/system/user/role/add?id=" + id;
            layer_show('添加权限', url, 300, 500);
        }
        function queryDataGrid(id) {
            var url = "${ctx}/system/user/role/queryUserById.json";
            if (id) {
                url += '?userId=' + id
            }
            $("#queryRole").datagrid({
                title: "角色列表",
                url: url,
                columns: [[
                    {field: 'roleName', title: '角色名称', width: 150},
                    {field: 'roleDesc', title: '角色描述', width: 140},
                ]],
                singleSelect: true,
            });
        }

        function view(id) {
            queryDataGrid(id);
        }
    </script>
</head>
<body>
<div class="page-container">
    <div class="col-xs-6">
        <table class="easyui-datagrid" style="width: 660px" id="query"></table>
    </div>
    <div class="col-xs-6">
        <table class="easyui-datagrid" id="queryRole" style="width: 300px;display: block"></table>
    </div>
</div>
</body>
</html>
