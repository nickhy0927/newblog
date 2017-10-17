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
<pgs:extends name="body">
    <article class="page-container">
        <form class="form form-horizontal" id="form-article-add">
            <input type="hidden" value="${module.id}" name="id" id="id">
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>上级菜单：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" onclick="showTree()" class="input-text" value="${module.module.name}"
                           readonly="readonly" placeholder="请选择上级菜单" id="pName"
                           name="pName">
                    <input type="hidden" class="input-text" value="${module.module.id}" placeholder="" id="pId"
                           name="pId">
                    <ul id="treeDemo" class="ztree" style="display: none;"></ul>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>菜单名称：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="${module.name}" placeholder="请输入菜单名称" id="name"
                           name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>菜单地址：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="${module.url}" placeholder="请输入菜单地址" id="url"
                           name="url">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>菜单别名：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="${module.alias}" placeholder="请输入菜单地址" id="alias"
                           name="alias">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">&nbsp;</span>菜单描述：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="${module.descs}" placeholder="请输入菜单描述信息" id="descs"
                           name="descs">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">&nbsp;</span>菜单图标：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <span class="select-box" style="width:100%;">
                    <select class="select valid" name="iconId" size="1">
                        <c:forEach var="icon" items="${icons}">
                            <option value="${icon.id}" <c:if test="${module.icon.id == icon.id}">selected="selected"</c:if> >${icon.name}</option>
                        </c:forEach>
                    </select>
                    </span>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">&nbsp;</span>是否显示：</label>
                <div class="formControls col-xs-9 col-sm-10 skin-minimal">
                    <c:if test="${module.shows != '' && module.shows != null}">
                        <div class="radio-box">
                            <input name="shows" value="0" type="radio"
                                   <c:if test="${module.shows == '0'}">checked="checked"</c:if> id="sex-1">
                            <label for="sex-1">不显示</label>
                        </div>
                        <div class="radio-box">
                            <input type="radio" value="1" id="sex-2"
                                   <c:if test="${module.shows ==1}">checked="checked"</c:if> name="shows">
                            <label for="sex-2">显示</label>
                        </div>
                    </c:if>
                    <c:if test="${module.shows == '' || module.shows == null}">
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
                    &nbsp;保存菜单
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
                    pName: { required: true },
                    name: { required: true },
                    url: { required: true },
                    pName: { required: true },
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                	 $.openTip('确定保存吗？',false,function(d){
                     	$(d).dialog('close');
                     	$.openLoading('正在保存，请稍等...');
	                    jQuery.ajax({
	                        type: "POST",
	                        url: "",
	                        data: $(form).serialize(),
	                        error: function (XMLHttpRequest, error, errorThrown) {
	                        	$.closeLoading();
	                        	$.openTip('保存失败，请稍候再试...',true, function(dialogAlert) {
									$(dialogAlert).dialog( "close" );
									return ;
								});
	                        },
	                        success: function (response) {
	                            var data = eval("(" + response + ")");
	                            if (data.resposecode == 200) {
	                            	$.openTip(data.message,true, function(dialogAlert) {
	    								$(dialogAlert).dialog( "close" );
	    								 parent.window.location.href = '';
	    	                             var index = parent.layer.getFrameIndex(window.name);
	    	                             parent.layer.close(index);
	    							});
	                            } else {
	                            	$.closeLoading();
	                            	$.openTip(data.message,true, function(dialogAlert) {
	    								$(dialogAlert).dialog( "close" );
	    								return ;
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
<jsp:include page="/parent_page/parent.jsp"/>
