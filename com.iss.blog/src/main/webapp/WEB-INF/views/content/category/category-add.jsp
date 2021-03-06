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

        .check-box, .radio-box {
            padding-left: 0px;
        }
    </style>
</pgs:extends>
<pgs:extends name="javascript">
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

        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);

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
                    pName: {
                        required: true,
                    },
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    openLoading();
                    jQuery.ajax({
                        type: "POST",
                        url: "${ctx}/content/category/save",
                        data: $(form).serialize(),
                        error: function (XMLHttpRequest, error, errorThrown) {
                            alert(error);
                            alert(errorThrown);
                        },
                        success: function (response) {
                            var data = eval("(" + response + ")");
                            if (data.resposecode == 200) {
                                alert(data.message);
                                parent.window.location.href = '${ctx}/content/category/list';
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            }
                        }
                    });
                }
            });
        });
    </script>
</pgs:extends>
<pgs:extends name="body">
    <article class="page-container">
        <form class="form form-horizontal" id="form-article-add">
            <div class="row cl">
                <input type="hidden" value="${category.id}" name="id">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>上级分类：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" onclick="showTree()" class="input-text" value="${category.category.name}"
                           readonly="readonly" placeholder="请选择上级分类" id="pName"
                           name="pName">
                    <input type="hidden" class="input-text" value="${category.category.id}" placeholder="" id="pId"
                           name="pId">
                    <ul id="treeDemo" class="ztree" style="display: none;"></ul>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>分类名称：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="${category.name}" placeholder="请输入分类名称" id="name"
                           name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">&nbsp;</span>是否显示：</label>
                <div class="formControls col-xs-9 col-sm-10 skin-minimal">
                    <c:if test="${category.shows != '' && category.shows != null}">
                        <div class="radio-box">
                            <input name="show" value="0" type="radio" <c:if test="${category.shows == '0'}">checked="checked"</c:if> id="sex-1">
                            <label for="sex-1">不显示</label>
                        </div>
                        <div class="radio-box">
                            <input type="radio" value="1" id="sex-2" <c:if test="${category.shows == true}">checked="checked"</c:if> name="shows">
                            <label for="sex-2">显示</label>
                        </div>
                    </c:if>
                    <c:if test="${category.shows == '' || category.shows == null}">
                        <div class="radio-box">
                            <input name="shows" value="0" type="radio" checked="checked">
                            <label for="sex-1">不显示</label>
                        </div>
                        <div class="radio-box">
                            <input type="radio" value="1" name="shows">
                            <label for="sex-2">显示</label>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="row cl" style="text-align: right;margin-right: 2px">
                <button class="btn btn-success" type="submit">
                    <i class="Hui-iconfont Hui-iconfont-save"></i>
                    &nbsp;保存分类
                </button>
            </div>
        </form>
    </article>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>
