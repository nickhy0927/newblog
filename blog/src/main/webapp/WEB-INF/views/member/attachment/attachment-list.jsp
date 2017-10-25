<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>

<pgs:extends name="javascript">
	<script type="text/javascript">
	
	</script>
</pgs:extends>
<pgs:extends name="body">
    <form action="" method="post" id="queryForm" name="queryForm">
        <div class="page-container">
            <div class="text-l">
                <table class="search-table">
                    <tr>
                        <td class="td-w">图标名称</td>
                        <td colspan="3">
                            <input type="text" name="name_li" placeholder="菜单名称" id="logmin" class="input-text"
                                   style="width:260px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                                	批量删除
                            </a>
                            <a class="btn btn-primary radius" data-title="添加菜单" data-href="article-add.html"
                               onclick="icon_add('添加图标','${ctx}/system/icon/add',600,400)" href="javascript:;">
                                <i class="Hui-iconfont">&#xe600;</i>
                                	添加图标
                            </a>
                            <button class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i>搜索</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
                    <thead>
                    <tr class="text-l">
                        <th width="15"><input type="checkbox" name="chks" value=""></th>
                        <th style="width: 160px;">图标名称</th>
                        <th>图标样式</th>
                        <th style="width: 50px;" class="text-c">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${tools.entities}" var="icon">
                        <tr class="text-l">
                            <td><input type="checkbox" data-id="${icon.id}" value="" name="chk"></td>
                            <td class="text-l">
                                ${icon.name}
                            </td>
                            <td>${icon.className}</td>
                            <td class="f-14 td-manage text-c">
                                <a style="text-decoration:none" class="ml-5" onclick="icon_edit('${icon.id}')"
                                   href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i>
                                </a>
                                <a style="text-decoration:none" class="ml-5" onClick="data_del('${icon.id}')"
                                   href="javascript:;" title="删除">
                                    <i class="Hui-iconfont">&#xe6e2;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="8">
                            <page:pageInfo currentPage="${currentPage}" pageInfo="${tools.pager}" formId="queryForm"></page:pageInfo>
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
    <script type="text/javascript" src="${ctx}/static/admin/h-ui.admin/js/H-ui.admin.js"></script>
    <!--/_footer 作为公共模版分离出去-->

    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="${ctx}/static/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript">
		
        /*资讯-添加*/
        function icon_add(title, url, w, h) {
            layer_show(title, url, w, h);
        }
        /*资讯-编辑*/
        function icon_edit(id) {
            var url = '${ctx}/system/icon/edit'
            url = url + "?id=" + id
            layer_show('修改图标', url, 600, 400);
        }
        
        /* 删除*/
        function data_del(obj,id){
        	$.openTip('确定删除吗？',false,function(d) {
        		$(d).dialog('close');
        		$.ajax({
                    type: 'POST',
                    url: '${ctx}/system/icon/delete',
                    dataType: 'json',
                    data:{id:id},
                    success: function(data){
                    	$.openTip(data.message,true,function(dialog) {
                       		$(dialog).dialog('close');
                       		window.location.href = '${ctx}/system/icon/list'
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
				$.openTip("请选择一项再进行操作.",true,function(dialog) {
					$(dialog).dialog('close');
					return;
				})
			} else {
				$.openTip('确定删除吗？',false, function(dialogConfirm) {
					$(dialogConfirm).dialog( "close" );
					$.openLoading('正在删除，请稍等...');
					$.ajax({
		                url: '${ctx}/system/icon/delete',
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
									window.location.href = "${ctx}/system/icon/list"
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