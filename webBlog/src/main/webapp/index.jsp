<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="psg" uri="http://www.commons.page" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<pgs:extends name="title">博客</pgs:extends>
<pgs:extends name="body">
	<script type="text/javascript">
		window.location.href = '${ctx}/index'
	</script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>