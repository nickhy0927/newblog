<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%@taglib prefix="pgs" uri="http://www.commons.page" %>
<pgs:extends name="body">
    这是博客的首页...
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp" />
