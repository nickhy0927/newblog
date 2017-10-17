<%--
  Created by IntelliJ IDEA.
  User: yuanhuangd
  Date: 2017/7/26
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.iss.pages.operate.ReadXml"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<Map<String,Object>> list = ReadXml.getInstance().getItems();
%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="body">
    <article class="page-container">
        <form id="createForm" class="form form-horizontal" id="form-article-add">
        	<div style="text-align: left;margin-bottom: 20px;">
                <button style="width: 100%;height: 50px;" class="btn btn-primary radius">
                   	请选择需要创建的页面：
                </button>
            </div>
            <div class="row cl" style="text-align: left;margin-right: 2px;margin-left:0px;">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>实体包名：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text"  placeholder="请输入实体包名" id="entityPackage" name="entityPackage">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>请选择模块：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <span class="select-box" style="width:100%;">
	                    <select class="select valid" name="direcroy" size="1">
	                        <%
	                        	
	                        	for(Map<String,Object> map : list) {
	                        		String directroy = map.get("directroy").toString();
	                        		String name = map.get("name").toString();
	                      	%>
	                        		<option value="<%=directroy %>" ><%=name %></option>
	                      	<%
	                        	}
	                        %>
	                    </select>
                    </span>
                </div>
            </div>
			<div class="skin-minimal">
			 	<label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>需要创建的页面：</label>
                <div class="formControls col-xs-9 col-sm-10">
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
				
			</div>
			<div class="row cl" style="text-align: left;margin-right: 2px;margin-left:0px;margin-top: 50px;">
                <button class="btn btn-primary radius" id="saveAndSubmit" type="button">
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
	    	
	    	$("#saveAndSubmit").click(function () {
	    		$.openTip('确认创建页面吗？',false,function(d) {
	    			$(d).dialog('close');
	    			$.openLoading('正在创建页面，请稍等...');
	    			jQuery.ajax({
                        type: "POST",
                        url: "${ctx}/execate.json",
                        data: $("#createForm").serialize(),
                        error: function (XMLHttpRequest, error, errorThrown) {
                        	$.closeLoading();
                        	$.openTip('创建页面失败，请稍候再试...',true, function(dialogAlert) {
								$(dialogAlert).dialog( "close" );
								return ;
							});
                        },
                        success: function (response) {
                        	console.log(response);
                            var data = eval("(" + response + ")");
                            if (data.resposecode == 200) {
                            	$.openTip(data.message,true, function(dialogAlert) {
                            		$.closeLoading();
                            		$(dialogAlert).dialog( "close" );
    							});
                            } else {
	                        	$.closeLoading();
                            	$.openTip('创建页面失败',true, function(dialogAlert) {
    								$(dialogAlert).dialog( "close" );
    								return ;
    							});
	                        }
                        } 
	    			});
	    		})
			});
	    });
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>
