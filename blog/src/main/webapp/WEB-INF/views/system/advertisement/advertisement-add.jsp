<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="css">
	<link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.css">
    <style type="text/css">
        .page-container {
        }
    </style>
</pgs:extends>
<pgs:extends name="javascript">
    <script type="text/javascript">
        $(function () {
			$('#saveSubmit').click(function() {
				openLoading();
                jQuery.ajax({
                    type: "POST",
                    url: "${ctx}/system/advertisement/save",
                    data: $('#form-adver-add').serialize(),
                    error: function (XMLHttpRequest, error, errorThrown) {
                        alert(error);
                        alert(errorThrown);
                    },
                    success: function (response) {
                        var data = eval("(" + response + ")");
                        console.log(data);
                        if (data.resposecode == 200) {
                            alert(data.message);
                            parent.window.location.href = '${ctx}/system/advertisement/list';
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        }

                    }
                });
			});
        })

        function uploadFile(obj) {
            var id = $(obj).parent().parent().attr('data-id');
            $('#adverFile').click();
            $('#adverFile').unbind('change').bind('change',function (data) {
                console.log(data);
                _fileUpload($(obj).parent().parent());
            });
        }
        
        function _fileUpload(trObj) {
        	var pic = $('#adverFile')[0].files[0];
        	var fd = new FormData();
	       	fd.append('file', pic);
	        $.ajax({
	            url:"${ctx}/attachment/copy",
	            type:"post",
	            data: fd,
	            cache: false,
	            contentType: false,
	            processData: false,
	            success:function(data){
	                data = eval("(" + data + ")");
	                $(trObj).find('td.file').text(data[0].name);
	                var id =  $(trObj).attr('data-id');
	                var n = 'myfiles_' + id;
	                $('input[name="'+ n + '"]').val(data[0].path)
	            }
	        });
        }
        
        function deleteTrDom(obj) {
            var tr = $(obj).parent().parent();
            var dataId = $(tr).attr('data-id');
            if (dataId) {
                if (dataId == 1) {
                    alert('第一行无法删除');
                    return;
                }
            }
            $(tr).remove();
            $('#createSlider tbody tr').each(function (index) {
                var num = index;
                $(this).attr('data-id', (index + 1));
                $(this).find('td>input').each(function () {
                    var name = $(this).attr('data-name');
                    if (name == 'sort') {
                        $(this).val(num + 1);
                    }
                    if (name != 'title') {
                    	$(this).attr('name', name + "_" + (num + 1)) 
                    }
                    /* $(this).attr('name', name + "_" + (num + 1)) */
                });
            })
        }
        function createTrDom(obj) {
            var tr = $(obj).parent().parent();
            var trHtml = '<tr>'
                + '<td>'
                    + '<input class="form-control" data-name="title" name="title" type="text">'
                + '</td>'
                + '<td>'
                    + '<input class="form-control" value="#" data-name="url" name="url" type="text">'
                + '</td>'
                + '<td>'
                    + '<input class="form-control" data-name="sort" name="sort" type="text">'
                + '</td>'
                + '<td class="file"></td>'
                + '<td style="text-align: center">'
                    + '<input class="form-control" style="display: none" data-name="myfiles" name="myfiles" type="text">'
                    + '<a href="#" class="btn btn-secondary" onclick="uploadFile(this)">选择文件</a>'
                + '</td>'
                + '<td style="text-align: center">'
                    + '<a href="#" title="删除当前数据" onclick="deleteTrDom(this)" style="cursor: pointer"><i class="fa fa-close"></i></a>&nbsp;'
                    + '<a href="#" title="新增一行数据" style="cursor: pointer" onclick="createTrDom(this)"><i class="fa fa-plus-circle"></i></a>'
                + '</td>'
                + '</tr>"';
            $(tr).after(trHtml);
            $('#createSlider tbody tr').each(function (index) {
                var num = index;
                $(this).attr('data-id', (index + 1));
                $(this).find('td>input').each(function () {
                    var name = $(this).attr('data-name');
                    if (name == 'sort') {
                        $(this).val(num + 1);
                    }
                    if (name != 'title') {
                    	$(this).attr('name', name + "_" + (num + 1)) 
                    }
                    /* */
                });
            })
        }
    </script>
</pgs:extends>
<pgs:extends name="body">
	<form action="${ctx}/attachment/copy" enctype="multipart/form-data" id="uploadForm" style="display: none;" method="post">
		<input type="file" name="adverFile" id="adverFile" >
	</form>
    <article class="page-container">
        <form class="" action="" id="form-adver-add">
            <div class="row cl">
                <table id="createSlider" class="table table-bordered">
                    <thead>
                    <tr>
                        <th>标题</th>
                        <th>访问地址</th>
                        <th style="width: 50px;">排序编号</th>
                        <th>文件名称</th>
                        <th style="text-align: center">选择文件</th>
                        <th style="text-align: center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr id="first" data-id="1">
                        <td>
                            <input class="form-control" data-name="title" name="title" type="text">
                        </td>
                        <td>
                            <input class="form-control" value="#" data-name="url" name="url" type="text">
                        </td>
                        <td>
                            <input class="form-control" data-name="sort" name="sort_1" type="text">
                        </td>
                        <td class="file"></td>
                        <td style="text-align: center">
                            <input class="form-control" style="display: none;" data-name="myfiles" name="myfiles_1" type="text">
                            <a href="#" class="btn btn-secondary" onclick="uploadFile(this)">选择文件</a>
                        </td>
                        <td style="text-align: center">
                            <a onclick="deleteTrDom(this)" title="删除当前数据">
                                <i style="cursor: pointer"
                                   class="fa fa-close"></i>
                            </a>
                            <a onclick="createTrDom(this)">
                                <i title="新增一行数据" style="cursor: pointer"
                                   class="fa fa-plus-circle"></i>
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row cl" style="text-align: right;margin-right: 2px">
                <button class="btn btn-success" type="button" id="saveSubmit">
                    <i class="Hui-iconfont Hui-iconfont-save"></i>
                    &nbsp;保存提交
                </button>
            </div>
        </form>
    </article>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>
