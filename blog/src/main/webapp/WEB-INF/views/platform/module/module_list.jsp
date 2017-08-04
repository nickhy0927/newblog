<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>

<psg:extends name="javascript">
    <script type="text/javascript">

    </script>
</psg:extends>
<pgs:extends name="body">
    <form action="${ctx}/platform/module/list" method="post" id="queryForm" name="queryForm">
        <div class="page-container">
            <div class="text-l">
                <table class="search-table">
                    <tr>
                        <td class="td-w">菜单名称</td>
                        <td>
                            <input type="text" value="${objectMap.name_li}" id="name_li" name="name_li" placeholder="菜单名称" class="input-text" style="width:260px;">
                        </td>
                        <td class="td-w">菜单地址</td>
                        <td>
                            <input type="text" value="${objectMap.url_li}" name="url_li" id="url_li" placeholder="菜单地址" style="width:260px" class="input-text">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                                                                     批量删除
                            </a>
                            <a class="btn btn-primary radius" onclick="module_add()" href="javascript:;">
                                <i class="Hui-iconfont">&#xe600;</i>
                               	添加菜单
                            </a>
                            <input class="btn btn-success" type="submit" value="搜索">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
                    <thead>
                    <tr class="text-l">
                        <th width="15"><input type="checkbox" name="" value=""></th>
                        <th>菜单名称</th>
                        <th>菜单地址</th>
                        <th>菜单别名</th>
                        <th class="text-c">图标</th>
                        <th width="160">上级菜单</th>
                        <th width="160">菜单描述</th>
                        <th>是否显示</th>
                        <th style="width: 50px;" class="text-c">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${tools.entities}" var="menu">
                        <tr class="text-l">
                            <td><input type="checkbox" value="" name=""></td>
                            <td class="text-l">
                                ${menu.name}
                            </td>
                            <td>${menu.url}</td>
                            <td>${menu.alias}</td>
                            <td class="text-c"></td>
                            <td>
                                ${menu.module.name}
                            </td>
                            <td>${menu.descs}</td>
                            <td>
                                <c:if test="${menu.shows == 1}">显示</c:if>
                                <c:if test="${menu.shows != 1}">不显示</c:if>
                            </td>
                            <td class="f-14 td-manage text-c">
                                <a style="text-decoration:none" class="ml-5" onclick="module_edit('${menu.id}')"
                                   href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i>
                                </a>
                                <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')"
                                   href="javascript:;" title="删除">
                                    <i class="Hui-iconfont">&#xe6e2;</i>
                                </a>
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
    </form>
    <!--_footer 作为公共模版分离出去-->
    <script type="text/javascript" src="${ctx}/static/admin/lib/jquery/1.9.1/jquery.min.js"></script>
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
        function module_add() {
            var title = '添加菜单',url='${ctx}/platform/module/add',w = 600,h = 500;
            layer_show(title, url, w, h);
        }
        /*资讯-编辑*/
        function module_edit(id) {
            var url = '${ctx}/platform/module/edit'
            url = url + "?id=" + id
            layer_show('修改菜单', url, 600, 500);
        }
        /*资讯-删除*/
        function article_del(obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                $.ajax({
                    type: 'POST',
                    url: '',
                    dataType: 'json',
                    success: function (data) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    },
                    error: function (data) {
                        console.log(data.msg);
                    },
                });
            });
        }

        /*资讯-审核*/
        function article_shenhe(obj, id) {
            layer.confirm('审核文章？', {
                    btn: ['通过', '不通过', '取消'],
                    shade: false,
                    closeBtn: 0
                },
                function () {
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                    $(obj).remove();
                    layer.msg('已发布', {icon: 6, time: 1000});
                },
                function () {
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                    $(obj).remove();
                    layer.msg('未通过', {icon: 5, time: 1000});
                });
        }
        /*资讯-下架*/
        function article_stop(obj, id) {
            layer.confirm('确认要下架吗？', function (index) {
                $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                $(obj).remove();
                layer.msg('已下架!', {icon: 5, time: 1000});
            });
        }

        /*资讯-发布*/
        function article_start(obj, id) {
            layer.confirm('确认要发布吗？', function (index) {
                $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                $(obj).remove();
                layer.msg('已发布!', {icon: 6, time: 1000});
            });
        }
        /*资讯-申请上线*/
        function article_shenqing(obj, id) {
            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
            $(obj).parents("tr").find(".td-manage").html("");
            layer.msg('已提交申请，耐心等待审核!', {icon: 1, time: 2000});
        }
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>