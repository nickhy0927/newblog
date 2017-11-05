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
		<form class="form form-horizontal" id="form-article-add" style="position: relative;">
			<input type="hidden" value="${module.id}" name="id" id="id">
	        <div class="row cl">
	            <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>文章分类：</label>
	            <div class="formControls col-xs-6 col-sm-7">
	                <input type="text" onclick="showTree()" class="input-text" value="${article.category.name}"
	                       readonly="readonly" placeholder="请选择分类" id="pName"
	                       name="pName">
	                <input type="hidden" class="input-text" value="${article.category.id}" placeholder="" id="pId"
	                       name="pId">
	                <ul id="treeDemo" class="ztree" style="display: none;"></ul>
	            </div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>文章标题：</label>
	            <div class="formControls col-xs-6 col-sm-7">
	                <input type="text" class="input-text" value="" placeholder="请输入分类名称" id="title" name="title">
	            </div>
	        </div>
	        <div class="row cl">
	            <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>文章logo：</label>
	            <div class="formControls col-xs-6 col-sm-7">
	                <input type="file" style="display: none;" id="files" name="myfiles" class="input-text" >
	                <button id="uploadLogo" class="btn btn-secondary radius" type="button">
	                	<i class="Hui-iconfont">&#xe632;</i> 
	                	上传图片
	                </button>
	            </div>
	        </div>
	        <div class="row cl" style="text-align: center;float: right;width: 223px;right: 40px;position: absolute;top: -41px;">
	            <div class="formControls col-xs-12 col-sm-12">
					<img src="http://img.my.csdn.net/uploads/201705/10/1494430832_3925.png" id="loc_img" />
					<button id="article_save" class="btn btn-danger radius" type="button" style="margin-left: 40px;">
		               	<i class="Hui-iconfont">&#xe6e2;</i> 
		               	删除图片
	               </button>
	            </div>
	        </div>
			<textarea style="display: none" id="content" name="content"></textarea>
	        <div class="row cl">
	            <label class="form-label col-xs-3 col-sm-2">
					<span class="c-red">*</span>
					文章内容：
				</label>
	            <div class="formControls col-xs-6 col-sm-7">
					<script id="editor" type="text/plain"></script>
	            </div>
	        </div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
					<button id="article_save_submit" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存并提交审核</button>
				</div>
			</div>
		</form>
	</article>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="${ctx}/static/admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${ctx}/static/admin/h-ui/js/H-ui.min.js"></script> 
	<script type="text/javascript" src="${ctx}/static/admin//h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->
	
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="${ctx}/static/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/static/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
	<script type="text/javascript" src="${ctx}/static/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
	<script type="text/javascript" src="${ctx}/static/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript" src="${ctx}/static/admin/lib/webuploader/0.1.5/webuploader.min.js"></script> 
	<script type="text/javascript" src="${ctx}/static/admin/lib/ueditor/1.4.3/ueditor.config.js"></script> 
	<script type="text/javascript" src="${ctx}/static/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
	<script type="text/javascript" src="${ctx}/static/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" src="${ctx}/static/ztree/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/ztree/js/jquery.ztree.excheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/ztree/js/jquery.ztree.exedit.min.js"></script>
	<script type="text/javascript">
		function showTree() {
		    $("#treeDemo").attr('style', "display:block;z-index:100;position：absolute");
		}
		function zTreeOnClick(event, treeId, treeNode) {
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
		$(function () {
			$("#uploadLogo").click(function() {
				
			});
			
			$('.skin-minimal input').iCheck({
				checkboxClass: 'icheckbox-blue',
				radioClass: 'iradio-blue',
				increaseArea: '20%'
			});
			$("#article_save_submit").click(function(){
				var val = UE.getEditor('editor').getPlainTxt();
				$("#content").val(val);
			});
			UE.getEditor('editor');
			$("#edui1").css({
				'style':'width: auto; z-index: 999;'
			});
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		    //表单验证
		    $("#form-article-add").validate({
		        rules: {
		            pName: {
		                required: true,
		            },
		            title: {
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
		            jQuery.ajax({
		                type: "POST",
		                url: "${ctx}/content/article/save",
		                data: $(form).serialize(),
		                error: function (XMLHttpRequest, error, errorThrown) {
		                    alert(error);
		                },
		                success: function (response) {
		                    var data = eval("(" + response + ")");
		                    if (data.resposecode == 200) {
		                        alert(data.message);
		                        parent.window.location.href = '${ctx}/content/article/list';
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
<jsp:include page="/parent_page/parent.jsp"/>
