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
        <form class="form form-horizontal" id="form-article-add" method="post" action="">
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>上级角色：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" onclick="showTree()" class="input-text" value="" readonly="readonly" placeholder="请选择上级菜单" id="pName"
                           name="pName">
                    <input type="hidden" class="input-text" value="" placeholder="" id="pId" name="pId">
                    <ul id="treeDemo" class="ztree" style="display: none;"></ul>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>角色名称：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="" placeholder="请输入角色名称" id="roleName" name="roleName">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>菜单描述：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" placeholder="请输入角色描述信息" id="roleDesc" name="roleDesc">
                </div>
            </div>
            <div class="row cl" style="text-align: right;margin-right: 2px">
                <button class="btn btn-success" type="submit">
                    <i class="Hui-iconfont Hui-iconfont-save"></i>
                    &nbsp;保存角色
                </button>
            </div>
        </form>
    </article>
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
            $("#treeDemo").attr('style',"display:block;z-index:100;position：absolute");
        }
        function zTreeOnClick(event, treeId, treeNode) {
//            alert(treeId + ", " + treeNode.name + "," + treeNode.id);
            $("#pName").val(treeNode.name);
            $("#pId").val(treeNode.id);
            $("#treeDemo").attr('style',"display:none;z-index:100;position：absolute");
        };
        var setting = {
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

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);

        });
        $(function () {
            //表单验证
            $("#form-article-add").validate({
                rules: {
                    roleDesc: {
                        required: true,
                    },
                    roleName: {
                        required: true,
                    }
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    openLoading();
                    jQuery.ajax({
                        type: "POST",
                        url: "${ctx}/system/role/save",
                        data: $(form).serialize(),
                        error: function (XMLHttpRequest, error, errorThrown) {
                            alert(error);
                            alert(errorThrown);
                        },
                        success: function (response) {
                            var data = eval("(" + response + ")");
                            if (data.resposecode == 200) {
                                alert(data.message);
                                parent.window.location.href = '${ctx}/system/role/list'
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            }

                        }
                        //${ctx}/system/role/save
                    });
//
                }
            });
        });
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>
