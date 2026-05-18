<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录 - 网上衣橱</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container" style="max-width: 500px; margin-top: 100px;">
        <div class="card">
            <h2 style="text-align: center; color: #ff6b9d; margin-bottom: 30px;">✨ 欢迎回来</h2>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <% if (request.getAttribute("success") != null) { %>
                <div class="alert alert-success">
                    <%= request.getAttribute("success") %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label>用户名 / 手机号</label>
                    <input type="text" name="username" class="form-control" required placeholder="请输入用户名或手机号">
                </div>

                <div class="form-group">
                    <label>密码</label>
                    <input type="password" name="password" class="form-control" required placeholder="请输入密码">
                </div>

                <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 20px;">
                    登录
                </button>
            </form>

            <p style="text-align: center; margin-top: 20px; color: #666;">
                还没有账号？<a href="${pageContext.request.contextPath}/register.jsp" style="color: #ff6b9d;">立即注册</a>
            </p>
        </div>
    </div>
</body>
</html>

