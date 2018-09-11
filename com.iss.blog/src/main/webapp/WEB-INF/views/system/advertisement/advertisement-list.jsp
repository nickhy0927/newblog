<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="javascript">
	<script type="text/javascript">
		function initData() {
			$("#dataGridList").dataGrid({
                url: ctx + '/system/advertisement/advertisement-list.json',
                title: '轮播图列表',
                method: 'POST',
                checkbox: true,
                pageSize: 6,
                orderField: 'createTime',
                sort: 'desc',
                searchButtonId: '#searchButton',
                queryParamsId: ['#realName', "#loginName"],
                tableId: '#dataGridList',
                columns: [
                    {field: 'id', className: 'text-c'},
					{field: 'attachment.path', className: 'text-l', description: '图片', sort: true, paramFormatter: function (row) {
                        return '<img alt="" style="width: 40px;height: 40px;" src="${server}/${advertisement.attachment.path }">';
                    }},
					{field: 'title', className: 'text-l', description: '标题 ', sort: true},
					{field: 'url', className: 'text-l', description: '访问地址', sort: true},
					{field: 'attachment.name', className: 'text-c', description: '文件名称 '},
					{field: 'attachment.fileSize', className: 'text-l', description: '文件大小', sort: true, paramFormatter: function (row) {}},
					{field: 'shows', className: 'text-l', description: '是否显示', sort: true, paramFormatter: function (row) {
                        return row.shows == 0 ? '否' : '是';
                    }},
					{field: 'attachment.fileSize', className: 'text-l', description: '文件大小', sort: true, paramFormatter: function (row) {}},
                    {field: 'operate', className: 'text-c', description: '操作', paramFormatter: function (row) {
                        return "<a href=\"#\" title=\"修改\" onclick=\"edit('" + row.id + "')\">"
                                + "<i class=\"Hui-iconfont\">&#xe60c;</i>"
                             + "</a>&nbsp;&nbsp;"
                             + "<a href=\"#\" title=\"删除\" onclick=\"del('" + row.id + "', true)\">"
                                + "<i class=\"Hui-iconfont\">&#xe609;</i>"
                             + "</a>";
                    }}
                ]
            });
		}
        $(document).ready(function () {
            initData();
        })
        /*资讯-添加*/
        function add() {
            $.openWindow('添加轮播图', "100%", '100%', '${ctx}/system/advertisement/advertisement-add.do');
        }
        /*资讯-编辑*/
        function icon_edit(id) {
            var url = '${ctx}/system/icon/edit'
            url = url + "?id=" + id
            layer_show('修改图标', url, 600, 400);
        }

        function datadel(id, single) {
            $.datadel({
                url: "${basePath}/platform/user/user-delete/"+ id +".json",
                type:"post",
                data:{id: id},
                success:function(data){
                    if(data.code == 200) {
                        $.openTip(data.msg, true, function () {
                            initData();
                        });
                    }
                },
                error:function(e){
                    $.openTip('删除用户信息失败，请稍后再试.');
                }
            }, single)
        }
    </script>
</pgs:extends>
<pgs:extends name="body">
    <div class="page-container">
        <form name="listForm">
            <div class="text-l cl">
                <ul class="sel-list">
                    <li>图标名称：
                         <input type="text" name="name_li" placeholder="" id="logmin" class="input-text"
                                   style="width:260px;">
                    </li>
                    <li>
                        <button type="button" class="btn btn-success radius" id="searchButton" name=""><i
                                class="Hui-iconfont">&#xe665;</i> 搜索
                        </button>
                        <button type="reset" class="btn btn-danger radius" id="searchButton" name="">&nbsp;&nbsp; 重置&nbsp;&nbsp;</button>
                    </li>
                </ul>
            </div>
        </form>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
            <span class="l">
                <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                    <i class="Hui-iconfont">&#xe6e2;</i>
                    	批量删除
                </a>
                <a class="btn btn-primary radius" data-title="添加轮播图" data-href="article-add.html"
                   onclick="add()" href="javascript:;">
                    <i class="Hui-iconfont">&#xe600;</i>
                    	添加轮播图
                </a>
            </span>
        </div>
        <div class="mt-20">
            <table id="dataGridList" class="table table-border table-bordered table-hover table-bg table-sort"></table>
        </div>
    </div>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>