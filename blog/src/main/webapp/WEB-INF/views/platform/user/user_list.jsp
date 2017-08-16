<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>

<pgs:extends name="javascript">
	<script type="text/javascript">
	
	</script>
</pgs:extends>
<pgs:extends name="body">
    <form action="${ctx}/platform/user/list" method="post" id="queryForm" name="queryForm">
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
                            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                                批量删除
                            </a>
                            <a class="btn btn-primary radius" data-title="添加菜单" data-href="article-add.html" onclick="user_add('添加用户','${ctx}/platform/user/add',600,550)" href="javascript:;">
                                <i class="Hui-iconfont">&#xe600;</i>
                                添加用户
                            </a>
                            <button name="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i>搜索</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
                    <thead>
                    <tr class="text-l">
                        <th width="25"><input type="checkbox" name="" value=""></th>
                        <th>真实姓名</th>
                        <th>用户名</th>
                        <th>证件类型</th>
                        <th>证件号码</th>
                        <th>电话号码</th>
                        <th class="text-c">锁定状态</th>
                        <th>上次登录时间</th>
                        <th width="120" class="text-c">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${tools.entities}" var="user">
                            <tr class="text-l">
                                <td><input type="checkbox" value="" name=""></td>
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
                                    <a style="text-decoration:none" onClick="article_stop(this,'10001')" href="javascript:;" title="下架">
                                        <i class="fa fa-save"></i>
                                    </a>
                                    <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除">
                                        <i class="Hui-iconfont">&#xe6e2;</i>
                                    </a>
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
        /*资讯-添加*/
        function user_add(title,url,w,h){
            layer_show(title,url,w,h);
        }
        /*资讯-编辑*/
        function article_edit(title,url,id,w,h){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*资讯-删除*/
        function article_del(obj,id){
            layer.confirm('确认要删除吗？',function(index){
                $.ajax({
                    type: 'POST',
                    url: '',
                    dataType: 'json',
                    success: function(data){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{icon:1,time:1000});
                    },
                    error:function(data) {
                        console.log(data.msg);
                    },
                });
            });
        }

        /*资讯-审核*/
        function article_shenhe(obj,id){
            layer.confirm('审核文章？', {
                    btn: ['通过','不通过','取消'],
                    shade: false,
                    closeBtn: 0
                },
                function(){
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                    $(obj).remove();
                    layer.msg('已发布', {icon:6,time:1000});
                },
                function(){
                    $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                    $(obj).remove();
                    layer.msg('未通过', {icon:5,time:1000});
                });
        }
        /*资讯-下架*/
        function article_stop(obj,id){
            layer.confirm('确认要下架吗？',function(index){
                $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                $(obj).remove();
                layer.msg('已下架!',{icon: 5,time:1000});
            });
        }

        /*资讯-发布*/
        function article_start(obj,id){
            layer.confirm('确认要发布吗？',function(index){
                $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                $(obj).remove();
                layer.msg('已发布!',{icon: 6,time:1000});
            });
        }
        /*资讯-申请上线*/
        function article_shenqing(obj,id){
            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
            $(obj).parents("tr").find(".td-manage").html("");
            layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
        }
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp" />