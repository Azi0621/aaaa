<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册 - 网上衣橱</title>
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

        .register-container {
            width: 100%;
            max-width: 420px;
            padding: 20px;
        }

        .register-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .register-title {
            font-size: 56px;
            font-weight: bold;
            color: #000;
            letter-spacing: 12px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            font-family: 'STKaiti', 'KaiTi', 'STXingkai', serif;
            margin: 0;
        }

        .form-group {
            margin-bottom: 22px;
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

        textarea.form-control {
            resize: vertical;
            min-height: 70px;
        }

        .btn-register {
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

        .btn-register:hover {
            background: #000;
            color: white;
        }

        .login-link {
            text-align: center;
            margin-top: 30px;
            color: rgba(0, 0, 0, 0.7);
            font-size: 14px;
        }

        .login-link a {
            color: #000;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            border-bottom: 1px solid transparent;
        }

        .login-link a:hover {
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
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h1 class="register-title">网上衣橱</h1>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <input type="text" name="username" class="form-control" required
                       placeholder="用户名">
            </div>

            <div class="form-group">
                <input type="password" name="password" class="form-control" required
                       placeholder="密码">
            </div>

            <div class="form-group">
                <input type="tel" name="phone" class="form-control" required
                       placeholder="手机号">
            </div>

            <div class="form-group">
                <textarea name="address" class="form-control" rows="3" required
                          placeholder="地址"></textarea>
            </div>

            <button type="submit" class="btn-register">
                注 册
            </button>
        </form>

        <div class="login-link">
            已有账号？<a href="${pageContext.request.contextPath}/login.jsp">立即登录</a>
        </div>
    </div>
</body>
</html>
