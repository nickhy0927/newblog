<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="page" uri="http://www.page.com" %>
<%@ taglib uri="http://hy.premission.com" prefix="premission" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="javascript">
	<script type="text/javascript" src="${ctx}/static/js/module/user/user-list.js"></script>
	<script type="text/javascript">
        $(function () {
            $("#dataGridTable").dataGrid({
                url : ctx + '/system/user/list.json',
                title:'菜单列表',
                checkbox : true,
                pageSize: 7,
                searchButtonId: '#searchButton',
                queryParamsId:['#realName_li',"#realName_li"],
                tableId: '#dataGridTable',
                columns:[
                    { field : 'id', className:'text-c'},
                    { field : 'realName',className:'text-l',description : '姓名'},
                    { field : 'loginName',className:'text-l',description : '登录账号'},
                    { field : 'cardType',className:'text-l',description : '证件类型', paramFormatter : function(row) {
                            return '身份证';
                        }
                    },
                    { field : 'idCard',className:'text-l',description : '证件号码'},
                    { field : 'phoneNumber',className:'text-l',description : '电话号码'},
                    { field : 'locked',className:'text-c',description : '锁定状态' , paramFormatter : function(row) {
                            var val = row.locked == true ? '是' : '否';
                            return val;
                        }
                    },
                    { field : 'lastLoginTime',className:'text-c',description : '上次登录时间', paramFormatter : function(row) {
                            return new Date(row.lastLoginTime).format('yyyy-MM-dd hh:mm:ss');
                        }
                    },
                    { field : 'operate',className:'text-c',description : '操作', paramFormatter : function(row) {
                            return "<a href=\"#\" title=\"修改\" onclick=\"user_edit('" + row.id + "')\">"
                                + "<i class=\"Hui-iconfont\">&#xe60c;</i>"
                                + "</a>&nbsp;&nbsp;"
                                + "<a href=\"#\" title=\"删除\" onclick=\"datadel('" + row.id + "',true)\">"
                                + "<i class=\"Hui-iconfont\">&#xe609;</i>"
                                + "</a>";
                        }
                    }
                ]
            })
        })

        function datadel() {
            var ids = $.getCheckboxIds('chk');
            if(!ids) {
                $.openTip("请选择一项再进行操作.",true,function() {
                    $.closeLoading();
                })
                return;
            } else {
                $.openTip('你确定删除吗？',false, function() {
                    $.closeLoading();
                    $.openLoading();
                    $.ajax({
                        url: '${ctx}/system/user/delete',
                        type: 'post',
                        dataType: 'JSON',
                        data: {id: ids},
                        success: function (data) {
                            $.closeLoading();
                            if(data.resposecode == 200) {
                                $.openTip('删除成功',true, function(dialogAlert) {
                                    $.openLoading();
                                    window.location.href = "${ctx}/system/user/list"
                                });
                            } else {
                                $.closeLoading();
                                $.openTip('删除失败',true, function(dialogAlert) {
                                    $.closeLoading();
                                });
                                return;
                            }
                        },
                        error: function (err) {
                            $.closeLoading();
                            $.openTip('删除失败',true, function(dialogAlert) {
                                $.closeLoading();
                            });
                            return;
                        }
                    });
                });
            }
        }

        function user_add(title,url,w,h){
            layer_show(title,url,w,h);
        }

        function user_edit(id){
            var url = ctx + "/system/user/edit?id=" + id;
            var index = layer.open({
                type: 2,
                title: '修改用户信息',
                content: url
            });
            layer.full(index);
        }
	</script>
</pgs:extends>
<pgs:extends name="body">
	<div class="pd-20">
	  	<div class="text-l cl">
			<ul class="sel-list">
				<li>
					真实姓名：<input type="text" value="${objectMap.realName_li}" id="realName_li" name="realName_li" class="input-text" style="width:auto;" placeholder="输入真实姓名">
				</li>
				<li>
					登录账号：<input type="text" class="input-text" value="${objectMap.loginName_li}" name="loginName_li" id="loginName_li" style="width:auto;" placeholder="输入登录账号">
					<button type="button" class="btn btn-success radius" id="searchButton" name="searchButton"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
				</li>
			</ul>
		</div>
  		<div class="cl pd-5 bg-1 bk-gray mt-20">
    		<span class="l">
    			<premission:tag alias="system-user-delete">
                 	<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                      	<i class="Hui-iconfont">&#xe6e2;</i>
                      	批量删除
                  	</a>
                </premission:tag>
		    	<premission:tag alias="system-user-add">
                   	<a class="btn btn-primary radius" data-title="添加菜单" onclick="user_add('添加用户','${ctx}/system/user/add',600,550)" href="javascript:;">
                        <i class="Hui-iconfont">&#xe600;</i>
                        添加用户
                    </a>
                  </premission:tag>
		    </span>
	  	</div>
	  	<div class="mt-20">
  			<div class="mt-20">
                <table id="dataGridTable" class="table table-border table-bordered table-bg table-hover table-sort table-responsive"></table>
            </div>
  		</div>
	</div>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp" />