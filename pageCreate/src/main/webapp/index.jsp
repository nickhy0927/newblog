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
        	<div style="text-align: left;margin-bottom: 20px;">
                <button style="width: 100%;height: 50px;" class="btn btn-primary radius">
                   	请选择需要创建的页面：
                </button>
            </div>
			<div class="skin-minimal">
				<div class="check-box">
					<input type="checkbox" id="add" name="add" value="add"> <label
						for="checkbox-1">创建新增页面</label>
				</div>
				<div class="check-box">
					<input type="checkbox" id="edit" value="edit" name="edit"> 
					<label for="checkbox-2">创建修改页面</label>
				</div>
				<div class="check-box">
					<input type="checkbox" id="list" name="list" value="list"> 
					<label for="checkbox-2">创建列表页面</label>
				</div>
			</div>
			<div class="row cl" style="text-align: left;margin-right: 2px;margin-left:0px;">
                <button class="btn btn-primary radius" type="submit">
                    <i class="Hui-iconfont Hui-iconfont-save"></i>
                    &nbsp;确认创建页面
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
    	$(function(){
	    	$('.skin-minimal input').iCheck({
	    		checkboxClass: 'icheckbox-blue',
	    		radioClass: 'iradio-blue',
	    		increaseArea: '20%'
	    	})
	    });
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>
