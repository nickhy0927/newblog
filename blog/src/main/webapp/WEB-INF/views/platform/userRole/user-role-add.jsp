<%--
  Created by IntelliJ IDEA.
  User: yuanhuangd
  Date: 2017/7/26
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="css">
    <link rel="stylesheet" href="${ctx}/static/ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style type="text/css">
        ul.ztree {
            margin-top: 0px;
            border: 1px solid #617775;
            background: #f0f6e4;
            width: auto;
            height: auto;
            overflow-y: scroll;
            overflow-x: auto;
        }
    </style>
</pgs:extends>
<pgs:extends name="body">
    <article class="page-container">
        <form class="form form-horizontal" id="form-article-add">
            <div class="Huialert Huialert-info">用户名：${user.loginName}</div>
            <ul id="treeDemo" class="ztree"></ul>
            <div class="row cl" style="text-align: right;margin-right: 2px">
                <input type="hidden" name="userId" value="${user.id}">
                <input type="hidden" name="ids" id="ids">
                <button class="btn btn-success" type="submit">
                    <i class="Hui-iconfont Hui-iconfont-save"></i>
                    &nbsp;保存菜单
                </button>
            </div>
        </form>
    </article>
    <script type="text/javascript" src="${ctx}/static/admin/lib/jquery/1.9.1/jquery.min.js"></script>
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
    <script type="text/javascript">

        function showTree() {
            $("#treeDemo").attr('style', "display:block;z-index:100;position：absolute");
        }
        function zTreeOnClick(event, treeId, treeNode) {
//            alert(treeId + ", " + treeNode.name + "," + treeNode.id);
            $("#pName").val(treeNode.name);
            $("#pId").val(treeNode.id);
            $("#treeDemo").attr('style', "display:none;z-index:100;position：absolute");
        };
        function getetCheckedAll() {
            var ids = "";
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            var nodes = treeObj.getCheckedNodes(true);
            for (var i = 0; i < nodes.length; i++) {
                console.log(nodes[i].id);
                ids += nodes[i].id + ",";
            }
            $("#ids").val(ids);

        }
        var setting = {
            check: {
                enable: true,
                nocheckInherit: false
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onClick: zTreeOnClick
            }
        };

        var zNodes = ${json};
        //过滤节点的机制 直接return node表示不做任何过滤
        function filter(node) {
            return node;
        }
        var list = ${roleTrees};
        ///动态设置zTree的所有节点有checkbox
        function DynamicUpdateNodeCheck() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            //根据过滤机制获得zTree的所有节点
            var nodes = zTree.getNodesByFilter(filter);
            //遍历每一个节点然后动态更新nocheck属性值
            for (var i = 0; i < nodes.length; i++) {
                var node = nodes[i];
                var id = node.id;
                for(var j = 0; j < list.length;j++) {
                    if(id == list[j].id) {
                        zTree.checkNode(node, true, true);
                        break;
                    } else {
                        zTree.checkNode(node, false, true);
                    }
                }
            }
        }
        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            DynamicUpdateNodeCheck();
        });

        $(function () {
            //表单验证
            $("#form-article-add").validate({
                rules: {
                    pName: {
                        required: true,
                    },
                    name: {
                        required: true,
                    },
                    url: {
                        required: true,
                    },
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    getetCheckedAll();
                    var ids = $("#ids").val();
                    if (ids) {
                        jQuery.ajax({
                            type: "POST",
                            url: "${ctx}/platform/user/role/save",
                            data: $(form).serialize(),
                            error: function (XMLHttpRequest, error, errorThrown) {
                                alert(error);
                                alert(errorThrown);
                            },
                            success: function (response) {
                                var data = eval("(" + response + ")");
                                if (data.resposecode == 200) {
                                    alert(data.message);
                                    parent.window.location.href = '${ctx}/platform/user/role/list';
                                    var index = parent.layer.getFrameIndex(window.name);
                                    parent.layer.close(index);
                                }
                            }
                        });
                    } else
                        alert('请选择角色');
                }
            });
        });
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>
