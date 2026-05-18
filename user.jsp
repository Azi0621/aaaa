<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页 - 网上衣橱</title>
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

    <div class="container" style="margin-top: 40px;">
        <div class="card" style="text-align: center; padding: 60px 30px;">
            <h1 style="font-size: 48px; margin-bottom: 20px; background: linear-gradient(45deg, #ff6b9d, #c44569); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                欢迎来到你的专属衣橱 💕
            </h1>
            <p style="font-size: 18px; color: #666; margin-bottom: 40px;">
                发现属于你的时尚风格
            </p>
            <a href="${pageContext.request.contextPath}/clothesList" class="btn btn-primary" style="font-size: 16px; padding: 15px 40px;">
                开始探索 ✨
            </a>
        </div>

        <div style="margin-top: 40px;">
            <h2 style="text-align: center; color: #333; margin-bottom: 30px;">热门分类</h2>
            <div class="product-grid">
                <div class="card" style="text-align: center; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/clothesList?category=上衣'">
                    <div style="font-size: 64px; margin-bottom: 15px;">👕</div>
                    <h3>上衣</h3>
                </div>
                <div class="card" style="text-align: center; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/clothesList?category=裤子'">
                    <div style="font-size: 64px; margin-bottom: 15px;">👖</div>
                    <h3>裤子</h3>
                </div>
                <div class="card" style="text-align: center; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/clothesList?category=裙子'">
                    <div style="font-size: 64px; margin-bottom: 15px;">👗</div>
                    <h3>裙子</h3>
                </div>
                <div class="card" style="text-align: center; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/clothesList?category=外套'">
                    <div style="font-size: 64px; margin-bottom: 15px;">🧥</div>
                    <h3>外套</h3>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

