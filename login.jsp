<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录 - 网上衣橱</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Microsoft YaHei', 'PingFang SC', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: url('images/background.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .login-container {
            width: 100%;
            max-width: 380px;
            padding: 20px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .login-title {
            font-size: 56px;
            font-weight: bold;
            color: #000;
            letter-spacing: 12px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            font-family: 'STKaiti', 'KaiTi', 'STXingkai', serif;
            margin: 0;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-control {
            width: 100%;
            padding: 16px 20px;
            border: none;
            border-bottom: 2px solid rgba(0, 0, 0, 0.3);
            background: transparent;
            font-size: 16px;
            color: #000;
            transition: all 0.3s;
            box-sizing: border-box;
        }

        .form-control::placeholder {
            color: rgba(0, 0, 0, 0.5);
        }

        .form-control:focus {
            outline: none;
            border-bottom-color: #000;
            background: rgba(255, 255, 255, 0.1);
        }

        .btn-login {
            width: 100%;
            padding: 16px;
            border: 2px solid #000;
            border-radius: 0;
            background: transparent;
            color: #000;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 20px;
            letter-spacing: 4px;
        }

        .btn-login:hover {
            background: #000;
            color: white;
        }

        .register-link {
            text-align: center;
            margin-top: 30px;
            color: rgba(0, 0, 0, 0.7);
            font-size: 14px;
        }

        .register-link a {
            color: #000;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            border-bottom: 1px solid transparent;
        }

        .register-link a:hover {
            border-bottom-color: #000;
        }

        .alert {
            padding: 12px 18px;
            margin-bottom: 25px;
            font-size: 14px;
            background: rgba(255, 255, 255, 0.9);
            border-left: 3px solid;
        }

        .alert-error {
            color: #d63031;
            border-left-color: #d63031;
        }

        .alert-success {
            color: #00b894;
            border-left-color: #00b894;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1 class="login-title">网上衣橱</h1>
        </div>

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
                <input type="text" name="username" class="form-control" required
                       placeholder="用户名 / 手机号">
            </div>

            <div class="form-group">
                <input type="password" name="password" class="form-control" required
                       placeholder="密码">
            </div>

            <button type="submit" class="btn-login">
                登 录
            </button>
        </form>

        <div class="register-link">
            还没有账号？<a href="${pageContext.request.contextPath}/register.jsp">立即注册</a>
        </div>
    </div>
</body>
</html>

