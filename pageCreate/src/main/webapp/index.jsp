<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<pgs:extends name="body">
   	<form>
		<div class="skin-minimal">
			<div class="check-box">
				<input type="checkbox" id="checkbox-1"> <label
					for="checkbox-1">复选框</label>
			</div>
			<div class="check-box">
				<input type="checkbox" id="checkbox-2" checked> <label
					for="checkbox-2">复选框 checked状态</label>
			</div>
			<div class="check-box">
				<input type="checkbox" id="checkbox-disabled" disabled> <label
					for="checkbox-disabled">Disabled</label>
			</div>
			<div class="check-box">
				<input type="checkbox" id="checkbox-disabled-checked" checked
					disabled> <label for="checkbox-disabled-checked">Disabled
					&amp; checked</label>
			</div>
		</div>
		<div class="mt-20 skin-minimal">
			<div class="radio-box">
				<input type="radio" id="radio-1" name="demo-radio1"> <label
					for="radio-1">单选按钮</label>
			</div>
			<div class="radio-box">
				<input type="radio" id="radio-2" name="demo-radio1" checked>
				<label for="radio-2">单选按钮 checked状态</label>
			</div>
			<div class="radio-box">
				<input type="radio" id="radio-disabled" disabled> <label
					for="radio-disabled">Disabled</label>
			</div>
			<div class="radio-box">
				<input type="radio" id="radio-disabled-checked" checked disabled>
				<label for="radio-disabled-checked">Disabled &amp; checked</label>
			</div>
		</div>
		<div>
   			<div style="height: 40px;line-height: 40px;padding: 10px;">
   				请选择需要创建的模块
   			</div>
   			<div style="border: 1px solid #ddd;height: 40px;line-height: 40px;padding: 10px;">
   				<input type="checkbox" value="add" name="add"> 创建新增页面
   				<input type="checkbox" value="edit" name="edit"> 创建修改页面
   				<input type="checkbox" value="list" name="list"> 创建列表页面
   			</div>
   			<div style="height: 40px;line-height: 40px;padding: 10px;">
   				<button>确定</button>
   			</div>
   		</div>
   	</form>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>