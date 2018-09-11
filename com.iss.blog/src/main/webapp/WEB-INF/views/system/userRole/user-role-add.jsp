<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="css">
    <link rel="stylesheet" href="${ctx}/assets/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
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
<pgs:extends name="javascript">
    <script type="text/javascript" src="${ctx}/assets/lib/zTree/v3/js/jquery.ztree.all-3.5.js"></script>
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
                ids += nodes[i].id + ",";
            }
            $("#ids").val(ids);

        }
        var setting = {
            check: {
                enable: true,
                nocheckInherit: false,
                chkboxType: { "Y": "s", "N": "s" }
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
            $("#addForm").validate({
                rules: {
                    pName: {required: true},
                    name: {required: true},
                    url: {required: true},
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    getetCheckedAll();
                    var ids = $("#ids").val();
                    if(!ids) ids = "";
                    $.openTip('确定进行此操作吗？', false, function(dialog) {
                   		$(dialog).dialog('close');
                   		$.openLoading('正在保存权限,请稍等...');
                   		jQuery.ajax({
                            type: "POST",
                            url: "${ctx}/system/user/role/save",
                            data: $(form).serialize(),
                            error: function (XMLHttpRequest, error, errorThrown) {
                               	$.openTip('添加权限失败',true);
                               	return;
                            },
                            success: function (response) {
                                var data = eval("(" + response + ")");
                                if (data.code == 200) {
                                    $.openTip('添加权限成功',true, function() {
                                   		$.closeLoading();
    	                               	 parent.window.location.href = '${ctx}/system/user/role/list';
    	                                 var index = parent.layer.getFrameIndex(window.name);
    	                                 parent.layer.close(index);
                                   	});
                                } else {
                                	$.closeLoading();
                                	$.openTip('添加权限失败',true,function(dialog) {
                                   		$.closeLoading();
                                   	});
                                }
                            }
                        });
                   	});
                }
            });
        });
    </script>
</pgs:extends>
<pgs:extends name="body">
    <article class="page-container">
        <form class="form form-horizontal" id="addForm">
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
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>
