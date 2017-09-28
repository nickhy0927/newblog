<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="psg" uri="http://www.commons.page" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<psg:extends name="body">
    博客前台页面展示
</psg:extends>
<jsp:include page="/parent_page/parent.jsp"/>