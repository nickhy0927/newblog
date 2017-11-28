<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://hy.premission.com" prefix="premission" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="javascript">
	<script type="text/javascript">
	
	</script>
</pgs:extends>
<pgs:extends name="body">
    <form action="${ctx}/system/module/list" method="post" id="queryForm" name="queryForm">
    	<div class="pd-20">
		  	<div class="text-l cl">
				<ul class="sel-list">
					<li>
						菜单名称：<input type="text" value="${objectMap.name_li}" id="name_li" name="name_li" placeholder="菜单名称" class="input-text" style="width:auto;" placeholder="输入菜单名称">
					</li>
					<li>
						菜单地址：<input type="text" class="input-text" value="${objectMap.url_li}" name="url_li" id="url_li" placeholder="菜单地址" style="width:auto;" placeholder="输入菜单地址">
					</li>
					<li>
						菜单别名：<input type="text" class="input-text" value="${objectMap.alias_li}" name="alias_li" id="url_li" placeholder="菜单地址" style="width:auto;" placeholder="输入菜单别名">
						<button type="submit" class="btn btn-success radius" id="searchButton" name="searchButton"><i class="Hui-iconfont">&#xe665;</i> 搜菜单</button>
					</li>
				</ul>
			</div>
	  		<div class="cl pd-5 bg-1 bk-gray mt-20">
	    		<span class="l">
	    			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
	    				<i class="Hui-iconfont">&#xe6e2;</i> 
	    				批量删除
	    			</a>
			    	<a href="javascript:;" onclick="module_add()" class="btn btn-primary radius">
			    		<i class="Hui-iconfont">&#xe600;</i> 
			    		添加菜单
			    	</a>
			    </span>
		  	</div>
		  	<div class="mt-20">
	  			<div class="mt-20">
	                <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
	                    <thead>
		                    <tr class="text-l">
		                        <th width="15"><input type="checkbox" name="chks" value=""></th>
		                        <th>菜单名称</th>
		                        <th>菜单地址</th>
		                        <th>菜单别名</th>
		                        <th class="text-c">图标</th>
		                        <th width="160">上级菜单</th>
		                        <th>菜单描述</th>
		                        <th class="text-c">是否显示</th>
		                        <th style="width: 70px;" class="text-c">操作</th>
		                    </tr>
	                    </thead>
	                    <tbody>
		                    <c:forEach items="${tools.entities}" var="menu">
		                        <tr class="text-l">
		                            <td><input type="checkbox" data-id="${menu.id}" value="" name="chk"></td>
		                            <td class="text-l">
		                                ${menu.name}
		                            </td>
		                            <td>${menu.url}</td>
		                            <td>${menu.alias}</td>
		                            <td class="text-c">${menu.icon.className}</td>
		                            <td>
		                                ${menu.module.name}
		                            </td>
		                            <td>${menu.descs}</td>
		                            <td class="text-c">
		                                <c:if test="${menu.shows == 1}">显示</c:if>
		                                <c:if test="${menu.shows != 1}">不显示</c:if>
		                            </td>
		                            <td class="f-14 td-manage text-c">
		                            	<premission:tag alias="system-module-view">
			                                <a style="text-decoration:none" class="ml-5" onclick="module_view('${menu.id}')"
			                                   href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i>
			                                </a>
		                                </premission:tag>
		                            	<premission:tag alias="system-module-edit">
			                                <a style="text-decoration:none" class="ml-5" onclick="module_edit('${menu.id}')"
			                                   href="javascript:;" title="查看"><i class="Hui-iconfont">&#xe725;</i>
			                                </a>
		                                </premission:tag>
		                                <premission:tag alias="system-module-delete">
			                                <a style="text-decoration:none" class="ml-5" onClick="data_del(this,'${menu.id}')"
			                                   href="javascript:;" title="删除">
			                                    <i class="Hui-iconfont">&#xe6e2;</i>
			                                </a>
		                                </premission:tag>
		                            </td>
		                        </tr>
		                    </c:forEach>
		                    <input type="hidden" name="name_li" value="用户">
		                    <tr>
		                        <td colspan="9">
		                            <page:pageInfo currentPage="${currentPage}" pageInfo="${tools.pager}" formId="queryForm"></page:pageInfo>
		                        </td>
		                    </tr>
	                    </tbody>
	                </table>
	            </div>
	  		</div>
		</div>
    </form>
    <script type="text/javascript">
        /*资讯-添加*/
        function module_add() {
            var title = '添加菜单',url='${ctx}/system/module/add',w = 600,h = 500;
            layer_show(title, url, w, h);
        }
        /*资讯-编辑*/
        function module_view(id) {
            var url = '${ctx}/system/module/edit'
            url = url + "?id=" + id
            layer_show('修改菜单', url, 600, 500);
        }
        function module_edit(id) {
            var url = '${ctx}/system/module/view'
            url = url + "?id=" + id
            layer_show('查看菜单', url, 600, 500);
        }
        /* 删除*/
        function data_del(obj,id){
        	$.openTip('确定删除吗？',false,function(d) {
        		$(d).dialog('close');
        		$.ajax({
                    type: 'POST',
                    url: '${ctx}/system/module/delete',
                    dataType: 'json',
                    data:{id:id},
                    success: function(data){
                    	$.openTip(data.message,true,function(dialog) {
                       		$(dialog).dialog('close');
                       		window.location.href = '${ctx}/system/module/list'
                       	});
                        
                    },
                    error:function(data) {
                        console.log(data.message);
                    },
                });
        	});
        }
        function datadel() {
			var ids = $.getCheckboxIds('chk');
			if(!ids) {
				$.openTip("请选择一项再进行操作.",true,function() {
					$.closeLoading();
					return;
				})
			} else {
				$.openTip('确定删除吗？',false, function(dialogConfirm) {
					$(dialogConfirm).dialog( "close" );
					$.openLoading('正在删除，请稍等...');
					$.ajax({
		                url: '${ctx}/system/module/delete',
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
									window.location.href = "${ctx}/system/module/list"
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
<jsp:include page="/parent_page/parent.jsp"/>