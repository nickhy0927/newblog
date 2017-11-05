<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="pgs" uri="http://www.commons.page"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="psg" uri="http://www.commons.page"%>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<pgs:extends name="title">博客</pgs:extends>
<pgs:extends name="javasript">
	<script type="text/javascript"></script>
</pgs:extends>

<pgs:extends name="body">
	注册页面
</pgs:extends>

<jsp:include page="/parent_page/parent.jsp" />