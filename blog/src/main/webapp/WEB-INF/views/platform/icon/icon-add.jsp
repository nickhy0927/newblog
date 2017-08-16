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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="body">
    <article class="page-container">
        <form class="form form-horizontal" id="form-article-add">
            <input type="hidden" name="id"  id="id" value="${icon.id}">
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>图标名称：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="${icon.name}" placeholder="请输入图标名称" id="name" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>图标样式：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="${fn:escapeXml(icon.className)}" placeholder="请输入图标样式" id="className" name="className">
                </div>
            </div>
            <div class="row cl" style="text-align: right;margin-right: 2px">
                <button class="btn btn-success" type="submit">
                    <i class="Hui-iconfont Hui-iconfont-save"></i>
                    &nbsp;保存图标
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
    <script type="text/javascript">


        $(function () {
            //表单验证
            $("#form-article-add").validate({
                rules: {
                    name: {
                        required: true,
                    },
                    className: {
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
                        url: "${ctx}/platform/icon/save",
                        data: $(form).serialize(),
                        error: function (XMLHttpRequest, error, errorThrown) {
                            alert(error);
                            alert(errorThrown);
                        },
                        success: function (response) {
                            var data = eval("(" + response + ")");
                            if (data.resposecode == 200) {
                                alert(data.message);
                                parent.window.location.href = '${ctx}/platform/icon/list';
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
