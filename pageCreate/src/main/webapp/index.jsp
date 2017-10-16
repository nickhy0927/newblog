<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<pgs:extends name="body">
   	<form>
   		<div>
   			<div>
   				<input type="checkbox" value="add" name="add">
   				<input type="checkbox" value="edit" name="edit">
   				<input type="checkbox" value="list" name="list">
   			</div>
   		</div>
   	</form>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>