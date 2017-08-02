<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="psg" uri="http://www.commons.page" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>
<psg:extends name="title">
    用户登录
</psg:extends>
<psg:extends name="css">
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/public/login/css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/public/login/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/public/login/css/animate-custom.css"/>
</psg:extends>
<psg:extends name="body">
    <div class="container">
        <section>
            <div id="container_demo">
                <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                <a class="hiddenanchor" id="toregister"></a>
                <a class="hiddenanchor" id="tologin"></a>
                <div id="wrapper">
                    <div id="login" class="animate form">
                        <form action="${ctx}/login" method="post" autocomplete="on">
                            <h1>账户登录</h1>
                            <p>
                                <label for="username" class="uname" data-icon="u">登录账户</label>
                                <input id="username" name="username" required="required" type="text"
                                       placeholder="请输入邮箱或登录名称"/>
                            </p>
                            <p>
                                <label for="password" class="youpasswd" data-icon="p">登录密码</label>
                                <input id="password" name="password" required="required" type="password"
                                       placeholder="请输入密码，例如. X8df!90EO"/>
                            </p>
                            <p class="keeplogin">
                                <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping"/>
                                <label for="loginkeeping">记住密码</label>
                            </p>
                            <p class="login button">
                                <span style="color: red;margin-right: 100px;text-align: center">${msg}</span><input type="submit" value="登录"/>
                            </p>
                            <p class="change_link">
                                还不是会员 ?
                                <a href="#toregister" class="to_register">加入我们</a>
                            </p>
                        </form>
                    </div>

                    <div id="register" class="animate form">
                        <form action="mysuperscript.php" autocomplete="on">
                            <h1> 账户注册 </h1>
                            <p>
                                <label for="usernamesignup" class="uname" data-icon="u">真实姓名</label>
                                <input id="usernamesignup" name="usernamesignup" required="required" type="text"
                                       placeholder="请输入真实姓名"/>
                            </p>
                            <p>
                                <label for="emailsignup" class="youmail" data-icon="e">登录账户</label>
                                <input id="emailsignup" name="emailsignup" required="required" type="email"
                                       placeholder="请输入登录账户"/>
                            </p>
                            <p>
                                <label for="passwordsignup" class="youpasswd" data-icon="p">登录密码</label>
                                <input id="passwordsignup" name="passwordsignup" required="required" type="password"
                                       placeholder="请输入密码，例如. X8df!90EO"/>
                            </p>
                            <p>
                                <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">确认密码</label>
                                <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required"
                                       type="password" placeholder="请确认输入密码，例如. X8df!90EO"/>
                            </p>
                            <p class="signin button">
                                <input type="submit" value="注册"/>
                            </p>
                            <p class="change_link">
                                已有账户 ?
                                <a href="#tologin" class="to_register"> 登录 </a>
                            </p>
                        </form>
                    </div>

                </div>
            </div>
        </section>
    </div>
</psg:extends>
<jsp:include page="/parent_page/parent.jsp"/>