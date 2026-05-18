<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心 - 网上衣橱</title>
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

    <div class="container" style="margin-top: 30px;">
        <div class="profile-card">
            <div class="profile-avatar">
                ${currentUser.username.substring(0, 1)}
            </div>

            <h2 style="text-align: center; margin-bottom: 30px; color: #333;">
                ${currentUser.username}
            </h2>

            <% if (request.getAttribute("success") != null) { %>
                <div class="alert alert-success">
                    <%= request.getAttribute("success") %>
                </div>
            <% } %>

            <div style="max-width: 600px; margin: 0 auto;">
                <h3 style="margin-bottom: 20px; color: #ff6b9d;">基本信息</h3>

                <form action="${pageContext.request.contextPath}/updateProfile" method="post">
                    <div class="form-group">
                        <label>用户名</label>
                        <input type="text" class="form-control" value="${currentUser.username}" disabled>
                    </div>

                    <div class="form-group">
                        <label>手机号</label>
                        <input type="tel" name="phone" class="form-control" value="${currentUser.phone}" required>
                    </div>

                    <div class="form-group">
                        <label>地址</label>
                        <textarea name="address" class="form-control" rows="3" required>${currentUser.address}</textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">保存修改</button>
                </form>

                <hr style="margin: 40px 0; border: none; border-top: 2px solid #ffe0ec;">

                <h3 style="margin-bottom: 20px; color: #ff6b9d;">安全设置</h3>
                <a href="${pageContext.request.contextPath}/user/changePassword.jsp" class="btn btn-secondary">
                    修改密码
                </a>
            </div>
        </div>
    </div>
</body>
</html>

