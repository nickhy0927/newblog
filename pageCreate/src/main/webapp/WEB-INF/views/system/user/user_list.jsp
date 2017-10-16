<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib uri="http://hy.premission.com" prefix="premission" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>

<pgs:extends name="javascript">
	<script type="text/javascript">
		function datadel() {
			var ids = $.getCheckboxIds('chk');
			if(!ids) {
				$.openTip("请选择一项再进行操作.",true,function(dialog) {
					$(dialog).dialog('close');
					return;
				})
			} else {
				$.openTip('你确定删除吗？',false, function(dialogConfirm) {
					$(dialogConfirm).dialog( "close" );
					$.openLoading('正在删除，请稍等...');
					$.ajax({
		                url: '${ctx}/system/user/delete',
		                type: 'post',
		                dataType: 'JSON',
		                data: {id: ids},
		                success: function (data) {
		                	console.log(data);
							$.closeLoading();
							if(data.resposecode == 200) {
								$.openTip('删除成功',true, function(dialogAlert) {
									$(dialogAlert).dialog( "close" );
									$.openLoading('正在刷新，请稍等...');
									window.location.href = "${ctx}/system/user/list"
								});
							} else {
								$.closeLoading();
								$.openTip('删除失败',true, function(dialogAlert) {
									$(dialogAlert).dialog( "close" );
								});
							}
		                },
		                error: function (err) {
		                	$.closeLoading();
		                	$.openTip('删除失败',true, function(dialogAlert) {
								$(dialogAlert).dialog( "close" );
							});
		                }
		            })
					
				});
			}
		}
	</script>
</pgs:extends>
<pgs:extends name="body">
    <form action="${ctx}/system/user/list" method="post" id="queryForm" name="queryForm">
        <div class="page-container">
            <div class="text-l">
                <table class="search-table">
                    <tr>
                        <td class="td-w">真实姓名</td>
                        <td>
                            <input type="text" value="${objectMap.realName_li}" name="realName_li" placeholder="菜单名称" id="realName_li" class="input-text" style="width:260px;">
                        </td>
                        <td class="td-w">登录名</td>
                        <td>
                            <input type="text" value="${objectMap.loginName_li}" name="loginName_li" placeholder="请输入登录名称" style="width:260px" class="input-text">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <premission:tag alias="system-user-delete">
                            	<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
	                                <i class="Hui-iconfont">&#xe6e2;</i>
	                                	批量删除
	                            </a>
                            </premission:tag>
                            <premission:tag alias="system-user-add">
                            	<a class="btn btn-primary radius" data-title="添加菜单" data-href="article-add.html" onclick="user_add('添加用户','${ctx}/system/user/add',600,550)" href="javascript:;">
	                                <i class="Hui-iconfont">&#xe600;</i>
	                                	添加用户
	                            </a>
                            </premission:tag>
                            <button name="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i>搜索</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
                    <thead>
                    <tr class="text-l">
                        <th width="25"><input type="checkbox" name="chks" value=""></th>
                        <th>真实姓名</th>
                        <th>用户名</th>
                        <th>证件类型</th>
                        <th>证件号码</th>
                        <th>电话号码</th>
                        <th class="text-c">锁定状态</th>
                        <th>上次登录时间</th>
                        <th width="70" class="text-c">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${tools.entities}" var="user">
                            <tr class="text-l">
                                <td><input type="checkbox" data-id="${user.id}" value="" name="chk"></td>
                                <td class="text-l">
                                        ${user.realName}
                                </td>
                                <td class="text-l">
                                    <u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10001')" title="查看">
                                        ${user.loginName}
                                    </u>
                                </td>
                                <td>身份证</td>
                                <td>${user.idCard}</td>
                                <td>${user.phoneNumber}</td>
                                <td class="text-c">
                                    <c:if test="${user.locked == false}">否</c:if>
                                    <c:if test="${user.locked == true}">是</c:if>
                                </td>
                                <td>
                                    <c:if test="${user.lastLoginTime != null && user.lastLoginTime != ''}">
                                        <fmt:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                    </c:if>
                                </td>
                                <td class="f-14 td-manage text-c">
                                	<a style="text-decoration:none" class="ml-5" onClick="article_edit('编辑用户信息','${ctx}/system/user/edit/${user.id}','10001')" href="javascript:;" title="查看">
	                                     <i class="fa fa-search"></i>
                                    </a>
                                    <premission:tag alias="system-user-edit">
                                    	<a style="text-decoration:none" class="ml-5" onClick="article_edit('编辑用户信息','${ctx}/system/user/edit/${user.id}','10001')" href="javascript:;" title="编辑">
	                                        <i class="fa fa-edit"></i>
	                                    </a>
                                    </premission:tag>
                                    <premission:tag alias="system-user-delete">
	                                    <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除">
	                                        <i class="Hui-iconfont">&#xe6e2;</i>
	                                    </a>
                                    </premission:tag>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="9">
                                <page:pageInfo currentPage="${currentPage}" pageInfo="${tools.pager}" formId="queryForm" ></page:pageInfo>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
    <!--_footer 作为公共模版分离出去-->
    <script type="text/javascript" src="${ctx}/static/admin/lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="${ctx}/static/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript">
        function user_add(title,url,w,h){
            layer_show(title,url,w,h);
        }
        /*资讯-编辑*/
        function article_edit(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp" />