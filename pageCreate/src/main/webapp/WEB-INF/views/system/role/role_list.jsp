<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://hy.premission.com" prefix="premission" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="body">
    <form action="" method="post" id="queryForm" name="queryForm">
        <div class="page-container">
            <div class="text-l">
                <table class="search-table">
                    <tr>
                        <td class="td-w">菜单名称</td>
                        <td>
                            <input type="text" name="name_li" placeholder="菜单名称" id="logmin" class="input-text" style="width:260px;">
                        </td>
                        <td class="td-w">菜单地址</td>
                        <td>
                            <input type="text" name="url_li" placeholder="菜单地址" style="width:260px" class="input-text">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <premission:tag alias="system-role-delete">
                            	<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
	                                <i class="Hui-iconfont">&#xe6e2;</i>
	                               	批量删除
	                            </a>
                            </premission:tag>
                           	<premission:tag alias="system-role-add">
                           		 <a class="btn btn-primary radius" data-title="添加角色" data-href="article-add.html" onclick="role_add()" href="javascript:;">
	                                <i class="Hui-iconfont">&#xe600;</i>
	                               	 添加角色
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
                            <th width="160">角色名称</th>
                            <th>角色描述</th>
                            <th width="80" class="text-c">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${tools.entities}" var="role">
                            <tr class="text-l">
                                <td><input type="checkbox" data-id="${role.id }" value="" name="chk"></td>
                                <td class="text-l">
                                    <u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10001')" title="查看">
                                        ${role.roleName}
                                    </u>
                                </td>
                                <td>${role.roleDesc}</td>
                                <td class="f-14 td-manage text-c">
                                    <premission:tag alias="system-role-menu-add">
                                    	<a style="text-decoration:none" class="ml-5" onClick="add_menu('${role.id}')" href="javascript:;" title="添加菜单权限">
	                                        <i class="Hui-iconfont">&#xe604;</i>
	                                    </a>
                                    </premission:tag>
                                    <premission:tag alias="system-role-edit">
                                    	<a style="text-decoration:none" class="ml-5" onClick="role_edit('角色编辑','${role.id}')" href="javascript:;" title="编辑">
	                                        <i class="Hui-iconfont">&#xe6df;</i>
	                                    </a>
                                    </premission:tag>
                                    <premission:tag alias="system-role-delete">
                                    	<a style="text-decoration:none" class="ml-5" onClick="role_del(this,'${role.id}')" href="javascript:;" title="删除">
	                                        <i class="Hui-iconfont">&#xe6e2;</i>
	                                    </a>
                                    </premission:tag>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="6">
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
		                url: '${ctx}/system/role/delete',
		                type: 'post',
		                dataType: 'JSON',
		                data: {id: ids},
		                success: function (data) {
							$.closeLoading();
							if(data.resposecode == 200) {
								$.openTip('删除成功',true, function(dialogAlert) {
									$(dialogAlert).dialog( "close" );
									$.openLoading('正在刷新，请稍等...');
									window.location.href = "${ctx}/system/role/list"
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
        /*资讯-添加*/
        function role_add(){
            var url = "${ctx}/system/role/add";
            layer_show('添加角色', url, 600, 400);
        }
        function add_menu(id){
            var url = "${ctx}/system/role/module/add?id=" + id;
            layer_show('添加权限', url, 300, 500);
        }
        /*资讯-编辑*/
        function role_edit(title,id){
        	var url = "${ctx}/system/role/edit?id=" + id;
            layer_show('添加权限', url, 600, 400);
        }
        /* 删除*/
        function role_del(obj,id){
        	$.openTip('确定删除该角色吗？',false,function(d) {
        		$(d).dialog('close');
        		$.ajax({
                    type: 'POST',
                    url: '${ctx}/system/role/delete',
                    dataType: 'json',
                    data:{id:id},
                    success: function(data){
                    	$.openTip(data.message,true,function(dialog) {
                       		$(dialog).dialog('close');
                       		window.location.href = '${ctx}/system/role/list'
                       	});
                        
                    },
                    error:function(data) {
                        console.log(data.message);
                    },
                });
        	});
        }
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp" />