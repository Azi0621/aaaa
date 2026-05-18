<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改密码 - 网上衣橱</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <a href="${pageContext.request.contextPath}/user/home.jsp" class="logo">👗 网上衣橱</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/clothesList">全部服装</a></li>
                <li><a href="${pageContext.request.contextPath}/cart">购物车</a></li>
                <li><a href="${pageContext.request.contextPath}/order?action=list">我的订单</a></li>
                <li><a href="${pageContext.request.contextPath}/user/profile.jsp">个人中心</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
            </ul>
        </div>
    </nav>

    <div class="container" style="max-width: 500px; margin-top: 50px;">
        <div class="card">
            <h2 style="text-align: center; color: #ff6b9d; margin-bottom: 30px;">🔐 修改密码</h2>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/changePassword" method="post">
                <div class="form-group">
                    <label>原密码</label>
                    <input type="password" name="oldPassword" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>新密码</label>
                    <input type="password" name="newPassword" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>确认新密码</label>
                    <input type="password" name="confirmPassword" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-primary" style="width: 100%;">
                    确认修改
                </button>
            </form>

            <p style="text-align: center; margin-top: 20px;">
                <a href="${pageContext.request.contextPath}/user/profile.jsp" style="color: #ff6b9d;">返回个人中心</a>
            </p>
        </div>
    </div>
</body>
</html>
