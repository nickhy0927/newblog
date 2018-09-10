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