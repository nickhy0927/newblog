<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="page" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://hy.premission.com" prefix="premission" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>
<page:extends name="javascript">
    <script type="text/javascript">

        function initData() {
            $("#dataGridTable").dataGrid({
                url: ctx + '/system/module/module-list.json',
                title: '菜单列表',
                checkbox: true,
                pageSize: 7,
                searchButtonId: '#searchButton',
                queryParamsId: ['#name_li', "#alias_li", "#url_li"],
                tableId: '#dataGridTable',
                columns: [
                    {field: 'id', className: 'text-c'},
                    {field: 'name', className: 'text-l', description: '菜单名称'},
                    {field: 'url', className: 'text-l', description: '菜单地址'},
                    {field: 'alias', className: 'text-l', description: '菜单别名'},
                    {field: 'module.name', className: 'text-l', description: '上级菜单'},
                    {field: 'icon.className', className: 'text-c', description: '菜单图标'},
                    {
                        field: 'operate', className: 'text-c', description: '操作', paramFormatter: function (row) {
                            return "<a href=\"#\" title=\"修改\" onclick=\"moduleEdit('" + row.id + "')\">"
                                + "<i style='color: #ff9900' class=\"fa fa-pencil fa-fw\"></i>"
                                + "</a>&nbsp;&nbsp;"
                                + "<a style='color: #00B83F' href=\"#\" title=\"查看\" onclick=\"moduleView('" + row.id + "')\">"
                                + "<i class=\"fa fa-eye\"></i>"
                                + "</a>&nbsp;&nbsp;"
                                + "<a style='color: #ff5847' href=\"#\" title=\"删除\" onclick=\"datadel('" + row.id + "',true)\">"
                                + "<i class=\"Hui-iconfont\">&#xe609;</i>"
                                + "</a>";
                        }
                    }
                ]
            })
        }

        $(function () {
            initData();
        });

        /*资讯-添加*/
        function moduleAdd() {
            var title = '添加菜单', url = '${ctx}/system/module/module-add.do', w = "70%", h = "80%";
            $.openWindow(title, w, h, url, function () {
                initData();
                console.log('12345')
            });
        }

        /*资讯-编辑*/
        function moduleEdit(id) {
            var  w = "70%", h = "80%";
            var url = '${ctx}/system/module/module-edit/' + id + '.do';
            $.openWindow('修改菜单', w, h, url, function () {
                initData()
            });
        }

        function moduleView(id) {
            var url = '${ctx}/system/module/module-view/' + id + '.do';
            $.openWindow('修改菜单', '70%', '90%', url, function () {
                initData()
            });
        }

        /* 删除*/
        function datadel(id, single) {
            var option = {url: '${ctx}/system/module/module-delete.json', data: {id: id}};
            $.datadel(option, function (res) {
                $.openTip(res.msg, true, function () {
                    initData();
                });
            }, function (err) {

            }, single);
        }

        function datadel(id, single) {
            $.datadel({
                url: "${ctx}/system/module/module-delete/" + id + ".json",
                type: "POST",
                data: {id: id},
                success: function (data) {
                    if (data.code == 200) {
                        $.openTip(data.msg, true, function () {
                            initData();
                        });
                    }
                },
                error: function (e) {
                    $.openTip('删除菜单信息失败，请稍后再试.');
                    return;
                }
            }, single)
        }
    </script>
</page:extends>
<page:extends name="body">
    <form method="post" id="queryForm" name="queryForm">
        <div class="pd-20">
            <div class="text-l cl">
                <ul class="sel-list">
                    <li>
                        菜单名称：
                        <input type="text" id="name_li" name="name_li" placeholder="菜单名称" class="input-text"
                               style="width:auto;" placeholder="输入菜单名称">
                    </li>
                    <li>
                        菜单地址：<input type="text" class="input-text" name="url_li" id="url_li" placeholder="菜单地址"
                                    style="width:auto;" placeholder="输入菜单地址">
                    </li>
                    <li>
                        菜单别名：<input type="text" class="input-text" name="alias_li" id="alias_li" placeholder="菜单地址"
                                    style="width:auto;" placeholder="输入菜单别名">
                        <button type="button" class="btn btn-success radius" id="searchButton" name="searchButton"><i
                                class="Hui-iconfont">&#xe665;</i> 搜菜单
                        </button>
                    </li>
                </ul>
            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
	    		<span class="l">
	    			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
	    				<i class="Hui-iconfont">&#xe6e2;</i> 
	    				批量删除
	    			</a>
			    	<a href="javascript:;" onclick="moduleAdd()" class="btn btn-primary radius">
			    		<i class="Hui-iconfont">&#xe600;</i> 
			    		添加菜单
			    	</a>
			    </span>
            </div>
            <div class="mt-20">
                <div class="mt-20">
                    <table id="dataGridTable"
                           class="table table-border table-bordered table-bg table-hover table-sort table-responsive"></table>
                </div>
            </div>
        </div>
    </form>
</page:extends>
<jsp:include page="/parent_page/parent.jsp"/>