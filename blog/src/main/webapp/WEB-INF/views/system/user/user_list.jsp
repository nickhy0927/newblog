<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib uri="http://hy.premission.com" prefix="premission" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="javascript">
	<script type="text/javascript" src="${ctx}/static/js/module/user/user-list.js"></script>
</pgs:extends>
<pgs:extends name="body">
	<div class="pd-20">
	  	<div class="text-l cl">
			<ul class="sel-list">
				<li>
					真实姓名：<input type="text" value="${objectMap.realName_li}" id="realName_li" name="realName_li" class="input-text" style="width:auto;" placeholder="输入真实姓名">
				</li>
				<li>
					登录账号：<input type="text" class="input-text" value="${objectMap.realName_li}" name="realName_li" id="realName_li" style="width:auto;" placeholder="输入登录账号">
					<button type="button" class="btn btn-success radius" id="searchButton" name="searchButton"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
				</li>
			</ul>
		</div>
  		<div class="cl pd-5 bg-1 bk-gray mt-20">
    		<span class="l">
    			<premission:tag alias="system-user-delete">
                 	<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                      	<i class="Hui-iconfont">&#xe6e2;</i>
                      	批量删除
                  	</a>
                </premission:tag>
		    	<premission:tag alias="system-user-add">
                   	<a class="btn btn-primary radius" data-title="添加菜单" onclick="user_add('添加用户','${ctx}/system/user/add',600,550)" href="javascript:;">
                        <i class="Hui-iconfont">&#xe600;</i>
                                                       添加用户
                    </a>
                  </premission:tag>
		    </span>
	  	</div>
	  	<div class="mt-20">
  			<div class="mt-20">
                <table id="dataGridTable" class="table table-border table-bordered table-bg table-hover table-sort table-responsive"></table>
            </div>
  		</div>
	</div>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp" />