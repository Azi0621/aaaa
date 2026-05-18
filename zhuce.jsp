<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册 - 网上衣橱</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container" style="max-width: 500px; margin-top: 80px;">
        <div class="card">
            <h2 style="text-align: center; color: #ff6b9d; margin-bottom: 30px;">🌸 创建账号</h2>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-group">
                    <label>用户名</label>
                    <input type="text" name="username" class="form-control" required placeholder="请输入用户名">
                </div>

                <div class="form-group">
                    <label>密码</label>
                    <input type="password" name="password" class="form-control" required placeholder="请输入密码">
                </div>

                <div class="form-group">
                    <label>手机号</label>
                    <input type="tel" name="phone" class="form-control" required placeholder="请输入手机号">
                </div>

                <div class="form-group">
                    <label>地址</label>
                    <textarea name="address" class="form-control" rows="3" required placeholder="请输入详细地址"></textarea>
                </div>

                <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 20px;">
                    注册
                </button>
            </form>

            <p style="text-align: center; margin-top: 20px; color: #666;">
                已有账号？<a href="${pageContext.request.contextPath}/login.jsp" style="color: #ff6b9d;">立即登录</a>
            </p>
        </div>
    </div>
</body>
</html>

