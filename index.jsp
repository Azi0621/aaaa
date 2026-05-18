<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>网上衣橱 - 发现你的时尚风格</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Microsoft YaHei', 'PingFang SC', sans-serif;
            min-height: 100vh;
            color: #333;
            background-image: url('${pageContext.request.contextPath}/images/background.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        /* 导航栏样式 */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.08);
            padding: 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .navbar-container {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
            color: #2c3e50;
            text-decoration: none;
            letter-spacing: 3px;
            transition: all 0.3s ease;
        }

        .logo:hover {
            color: #e74c3c;
            transform: scale(1.05);
        }

        .nav-links {
            display: flex;
            gap: 15px;
            list-style: none;
            align-items: center;
        }

        .nav-links a {
            color: #555;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 25px;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 5px;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #e74c3c, #f39c12);
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 60%;
        }

        .nav-links a:hover {
            color: #e74c3c;
            background: rgba(231, 76, 60, 0.05);
        }

        .nav-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white !important;
            padding: 10px 25px !important;
            border-radius: 25px !important;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .nav-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }

        .nav-btn::after {
            display: none !important;
        }

        /* 主内容区域 */
        .hero-section {
            max-width: 1400px;
            margin: 0 auto;
            padding: 80px 40px;
            text-align: center;
        }

        .welcome-title {
            font-size: 56px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 20px;
            letter-spacing: 8px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            animation: fadeInDown 1s ease;
        }

        .welcome-subtitle {
            font-size: 20px;
            color: #666;
            margin-bottom: 50px;
            letter-spacing: 2px;
            animation: fadeInUp 1s ease 0.3s both;
        }

        .cta-button {
            display: inline-block;
            padding: 16px 50px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-size: 18px;
            font-weight: 600;
            letter-spacing: 2px;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            transition: all 0.3s ease;
            animation: fadeInUp 1s ease 0.6s both;
        }

        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
        }

        /* 分类区域 */
        .categories-section {
            max-width: 1400px;
            margin: 60px auto;
            padding: 0 40px 80px;
        }

        .section-title {
            text-align: center;
            font-size: 42px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 60px;
            letter-spacing: 5px;
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 2px;
        }

        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .category-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.4s ease;
            cursor: pointer;
            position: relative;
        }

        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.15);
        }

        .category-image {
            width: 100%;
            height: 320px;
            object-fit: cover;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 80px;
        }

        .category-info {
            padding: 25px;
            text-align: center;
        }

        .category-name {
            font-size: 24px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 10px;
            letter-spacing: 2px;
        }

        .category-desc {
            font-size: 14px;
            color: #999;
        }

        /* 动画 */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            .navbar-container {
                padding: 15px 20px;
            }

            .nav-links {
                gap: 8px;
            }

            .nav-links a {
                padding: 8px 12px;
                font-size: 14px;
            }

            .welcome-title {
                font-size: 36px;
                letter-spacing: 4px;
            }

            .welcome-subtitle {
                font-size: 16px;
            }

            .categories-section {
                padding: 0 20px 60px;
            }

            .section-title {
                font-size: 32px;
            }
        }
    </style>
</head>
<body>
    <!-- 导航栏 -->
    <nav class="navbar">
        <div class="navbar-container">
            <a href="#" class="logo">网上衣橱</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/clothesList">全部服装</a></li>
                <li><a href="#categories">热门分类</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp" class="nav-btn">登录</a></li>
                <li><a href="${pageContext.request.contextPath}/register.jsp" class="nav-btn">注册</a></li>
            </ul>
        </div>
    </nav>

    <!-- 主视觉区域 -->
    <section class="hero-section">
        <h1 class="welcome-title">发现你的时尚风格</h1>
        <p class="welcome-subtitle">精选优质服饰 · 打造专属衣橱 · 展现独特魅力</p>
        <a href="${pageContext.request.contextPath}/clothesList" class="cta-button">立即探索</a>
    </section>

    <!-- 分类展示区域 -->
    <section class="categories-section" id="categories">
        <h2 class="section-title">热门分类</h2>
        <div class="categories-grid">
            <!-- 上衣分类 -->
            <div class="category-card" onclick="location.href='${pageContext.request.contextPath}/clothesList?category=上衣'">
                <div class="category-image">
                    <img src="${pageContext.request.contextPath}/images/category-tops.jpg" alt="上衣" style="width: 100%; height: 100%; object-fit: cover;"
                         onerror="this.style.display='none'; this.parentElement.innerHTML='👕';">
                </div>
                <div class="category-info">
                    <h3 class="category-name">上衣</h3>
                    <p class="category-desc">时尚百搭 · 舒适透气</p>
                </div>
            </div>

            <!-- 裤子分类 -->
            <div class="category-card" onclick="location.href='${pageContext.request.contextPath}/clothesList?category=裤子'">
                <div class="category-image">
                    <img src="${pageContext.request.contextPath}/images/category-pants.jpg" alt="裤子" style="width: 100%; height: 100%; object-fit: cover;"
                         onerror="this.style.display='none'; this.parentElement.innerHTML='👖';">
                </div>
                <div class="category-info">
                    <h3 class="category-name">裤子</h3>
                    <p class="category-desc">修身显瘦 · 品质面料</p>
                </div>
            </div>

            <!-- 裙子分类 -->
            <div class="category-card" onclick="location.href='${pageContext.request.contextPath}/clothesList?category=裙子'">
                <div class="category-image">
                    <img src="${pageContext.request.contextPath}/images/category-dresses.jpg" alt="裙子" style="width: 100%; height: 100%; object-fit: cover;"
                         onerror="this.style.display='none'; this.parentElement.innerHTML='👗';">
                </div>
                <div class="category-info">
                    <h3 class="category-name">裙子</h3>
                    <p class="category-desc">优雅气质 · 浪漫唯美</p>
                </div>
            </div>

            <!-- 外套分类 -->
            <div class="category-card" onclick="location.href='${pageContext.request.contextPath}/clothesList?category=外套'">
                <div class="category-image">
                    <img src="${pageContext.request.contextPath}/images/category-coats.jpg" alt="外套" style="width: 100%; height: 100%; object-fit: cover;"
                         onerror="this.style.display='none'; this.parentElement.innerHTML='🧥';">
                </div>
                <div class="category-info">
                    <h3 class="category-name">外套</h3>
                    <p class="category-desc">保暖时尚 · 简约大方</p>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
