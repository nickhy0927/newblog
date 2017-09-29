<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="file" uri="http://file-upload.upload" %>


<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.css">
<pgs:extends name="css">
    <style type="text/css">
        .page-container {
        }
    </style>
</pgs:extends>
<pgs:extends name="javascript">
    <script type="text/javascript">
        $(function () {

        })

        function uploadFile(obj) {
            var id = $(obj).parent().parent().attr('data-id');
            $('input[name="file_' + id + '"]').click();
            $('input[name="file_' + id + '"]').unbind('change').bind('change',function (data) {
                alert($(this).val());
                console.log(data);

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
        }
        function createTrDom(obj) {
            var tr = $(obj).parent().parent();
            var trHtml = '<tr>'
                + '<td>'
                    + '<input class="form-control" data-name="title" name="title" type="text">'
                + '</td>'
                + '<td>'
                    + '<input class="form-control" data-name="url" name="url" type="text">'
                + '</td>'
                + '<td>'
                    + '<input class="form-control" data-name="sort" name="sort" type="text">'
                + '</td>'
                + '<td>'
                + '</td>'
                + '<td style="text-align: center">'
                    + '<input class="form-control" style="display: none" data-name="file" name="file" type="file">'
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
                    $(this).attr('name', name + "_" + (num + 1))

                });
            })
        }
    </script>
</pgs:extends>
<pgs:extends name="body">
    <article class="page-container">
        <form class="form form-horizontal" id="form-article-add">
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
                            <input class="form-control" data-name="title" name="title_1" type="text">
                        </td>
                        <td>
                            <input class="form-control" data-name="url" name="url_1" type="text">
                        </td>
                        <td>
                            <input class="form-control" data-name="sort" name="sort_1" type="text">
                        </td>
                        <td>

                        </td>
                        <td style="text-align: center">
                            <input class="form-control" style="display: none;" data-name="file" name="file_1" type="file">
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
                <button class="btn btn-success" type="submit">
                    <i class="Hui-iconfont Hui-iconfont-save"></i>
                    &nbsp;保存图标
                </button>
            </div>
        </form>
    </article>
    <script type="text/javascript" src="${ctx}/static/admin/lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/h-ui.admin/js/H-ui.admin.js"></script>
    <!--/_footer /作为公共模版分离出去-->

    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="${ctx}/static/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
    <script type="text/javascript">


        $(function () {

        });
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>
