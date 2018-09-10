<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>

<pgs:extends name="javascript">
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
        /*资讯-审核*/
        function article_shenhe(id) {
            layer.confirm('审核文章？', {
                    btn: ['通过', '不通过', '取消'],
                    shade: false,
                    closeBtn: 0
                },
                function () {
                    submitApproval(layer, id, 1)
                },
                function () {
                    submitApproval(layer, id, 2)
                });
        }

        function submitApproval(layer, id, approvalStatus) {
            var url = '${ctx}/content/article/approval'
            openLoading();
            $.ajax({
                url: url,
                type: 'post',
                dataType: 'JSON',
                data: {id: id, approvalStatus: approvalStatus},
                success: function (data) {
                    closeLoading();
                    layer.msg('审核通过', {icon: 6, time: 2000});
                    setInterval(function(){
                        window.location.href = "${ctx}/content/article/approvalList"
                    },2000)

                },
                error: function (err) {
                    layer.msg('审核失败', {icon: 5, time: 1000});
                    window.location.href = "${ctx}/content/article/approvalList"
                }
            })
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
<pgs:extends name="body">
    <form action="${ctx}/content/article/approvalList" method="post" id="queryForm" name="queryForm">
        <div class="page-container">
            <div class="text-l">
                <table class="search-table">
                    <tr>
                        <td class="td-w">文章标题</td>
                        <td colspan="3">
                            <input type="text" value="${objectMap.title_li}" id="title_li" name="title_li"
                                   placeholder="文章标题" class="input-text" style="width:260px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
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
                        <th>文章标题</th>
                        <th>文章内容</th>
                        <th>栏目名称</th>
                        <th class="text-c">审核状态</th>
                        <th class="text-c">是否显示</th>
                        <th style="width: 50px;" class="text-c">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${tools.entities}" var="art">
                        <tr class="text-l">
                            <td><input type="checkbox" value="" name=""></td>
                            <td class="text-l" title="${art.title}">
                                <a href="#"><pgs:string content="${art.title}" len="20"/></a>
                            </td>
                            <td>
                                <pgs:string content="${art.content}" len="40"/>
                            </td>
                            <td>
                                    ${art.category.name}
                            </td>
                            <td class="text-c">
                                <c:if test="${art.approvalStatus == 0}">
                                    <span class="label label-default radius">
                                        未审核
                                    </span>
                                </c:if>
                                <c:if test="${art.approvalStatus == 1}">
                                    <span class="label label-success radius">
                                        审核通过
                                    </span>
                                </c:if>
                                <c:if test="${art.approvalStatus == 2}">
                                    <span class="label label-danger radius">
                                        审核拒绝
                                    </span>
                                </c:if>
                            </td>
                            <td class="td-status text-c">
                                <c:if test="${art.shows == true}">
                                    <span class="label label-success radius">
                                        已发布
                                    </span>
                                </c:if>
                                <c:if test="${art.shows == false}">
                                    <span class="label label-warning radius">
                                        未发布
                                    </span>
                                </c:if>

                            </td>
                            <td class="f-14 td-manage text-c">
                                <a style="text-decoration:none" class="ml-5" onclick="article_shenhe('${art.id}')"
                                   href="javascript:;" title="审核"><i class="Hui-iconfont">&#xe6df;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
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
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>