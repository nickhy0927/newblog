<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
<pgs:extends name="body">
    <article class="page-container">
        <form class="form form-horizontal" id="form-article-add" method="post" action="">
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>真实姓名：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="" placeholder="请输入真实姓名" id="realName" name="realName">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>用户名：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" value="" placeholder="请输入登录账户" id="loginName"
                           name="loginName">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>用户密码：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="password" class="input-text" value="" placeholder="请输入用户密码" id="password"
                           name="password">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>确认密码：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="password" class="input-text" value="" placeholder="请输入确认密码" id="repassword"
                           name="repassword">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>证件类型：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" value="身份证" style="background: darkgrey" class="input-text" placeholder="请输入证件类型"
                           readonly="readonly" id="cartType" name="cartType">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>证件号码：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" placeholder="请输入证件号码" id="idCard" name="idCard">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>电话号码：</label>
                <div class="formControls col-xs-9 col-sm-10">
                    <input type="text" class="input-text" placeholder="请输入电话号码" id="phoneNumber" name="phoneNumber">
                </div>
            </div>
            <div class="row cl" style="text-align: right;margin-right: 2px">
                <button class="btn btn-success" type="submit">
                    <i class="Hui-iconfont Hui-iconfont-save"></i>
                    &nbsp;保存
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
            //表单验证
            $("#form-article-add").validate({
                rules: {
                    realName: {required: true,},
                    loginName: {
                        required: true, rangelength: [6, 20],
                        remote: {
                            type: "POST",
                            url: "${ctx}/platform/user/checkLoginName.json",
                            data: {
                                loginName: function () {
                                    return $("#loginName").val();
                                }
                            }
                        }
                    },
                    password: {required: true, minlength: 6},
                    repassword: {
                        required: true, minlength: 6, equalTo: "#password"
                    },
                    idCard: {required: true,},
                    phoneNumber: {required: true, maxlength: 13, number: true}
                },
                messages: {
                    loginName: {
                        required: "用户名不能为空！",
                        rangelength: "用户名位数必须在6~20字符之间！",
                        remote: "用户名已经被注册"
                    },
                    password: {required: "密码不能为空！", minlength: "密码位数必须大于等于6个字符！"},
                    repassword: {required: "确认密码不能为空！", equalTo: "确认密码和密码不一致！"},
                    veryCode: {required: "请输入验证码", remote: "验证码错误"}
                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    openLoading();
                    jQuery.ajax({
                        type: "POST",
                        url: "${ctx}/platform/user/save",
                        data: $(form).serialize(),
                        error: function (XMLHttpRequest, error, errorThrown) {
                            alert(error);
                            alert(errorThrown);
                        },
                        success: function (response) {
                            var data = eval("(" + response + ")");
                            if (data.resposecode == 200) {
                                alert(data.message);
                                parent.window.location.href = '${ctx}/platform/user/list';
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            }

                        }
                    });
                }
            });
        });
    </script>
</pgs:extends>
<jsp:include page="/parent_page/parent.jsp"/>
