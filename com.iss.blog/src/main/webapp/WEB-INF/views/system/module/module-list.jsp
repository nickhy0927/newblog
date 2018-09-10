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
		$(function () {
			$("#dataGridTable").dataGrid({
				url : ctx + '/system/module/moduleList.json',
				title:'菜单列表',
				checkbox : true,
				pageSize: 7,
		        searchButtonId: '#searchButton',
				queryParamsId:['#name_li',"#alias_li","#url_li"],
				tableId: '#dataGridTable',
				columns:[
		            { field : 'id', className:'text-c'},
					{ field : 'name',className:'text-l',description : '菜单名称'},
					{ field : 'url',className:'text-l',description : '菜单地址'},
					{ field : 'alias',className:'text-l',description : '菜单别名'},
					{ field : 'module.name',className:'text-l',description : '上级菜单'},
					{ field : 'icon.className',className:'text-c',description : '菜单图标'},
					{ field : 'operate',className:'text-c',description : '操作', paramFormatter : function(row) {
						return "<a href=\"#\" title=\"修改\" onclick=\"data_edit('" + row.id + "')\">"
									+ "<i class=\"Hui-iconfont\">&#xe60c;</i>"
							 + "</a>&nbsp;&nbsp;"
							 + "<a href=\"#\" title=\"删除\" onclick=\"datadel('" + row.id + "',true)\">"
									+ "<i class=\"Hui-iconfont\">&#xe609;</i>"
							 + "</a>";
					}}
				]
			})
		})
	</script>
</pgs:extends>
<pgs:extends name="body">
    <form method="post" id="queryForm" name="queryForm">
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
						菜单别名：<input type="text" class="input-text" value="${objectMap.alias_li}" name="alias_li" id="alias_li" placeholder="菜单地址" style="width:auto;" placeholder="输入菜单别名">
						<button type="button" class="btn btn-success radius" id="searchButton" name="searchButton"><i class="Hui-iconfont">&#xe665;</i> 搜菜单</button>
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
	                <table id="dataGridTable" class="table table-border table-bordered table-bg table-hover table-sort table-responsive"></table>
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