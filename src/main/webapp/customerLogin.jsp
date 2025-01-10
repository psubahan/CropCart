<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login - Krishi Mitra</title>
    <style>
        /* General Reset */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .logo {
            text-align: center;
            margin-bottom: 10px;
        }
        .logo h1 {
            color: #fff;
            background-color: #007b5e;
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header h2 {
            font-size: 24px;
            color: #333;
        }
        .header a {
            text-decoration: none;
            font-size: 16px;
            color: #007b5e;
        }
        .login-panel {
            display: flex;
            justify-content: space-around;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .login-panel div {
            flex: 1;
            margin: 0 10px;
        }
        .login-panel .login-info {
            text-align: center;
        }
        .login-panel .login-info img {
            width: 200px;
            margin-bottom: 10px;
        }
        .login-panel .login-info h2 {
            font-size: 20px;
            color: #333;
        }
        .login-panel .login-form {
            text-align: left;
        }
        .login-panel .login-form label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .login-panel .login-form input[type="email"],
        .login-panel .login-form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .login-panel .login-form a {
            text-decoration: none;
            color: #007b5e;
            font-size: 14px;
        }
        .login-panel .login-form button {
            background-color: #007b5e;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .login-panel .signup {
            text-align: center;
        }
        .login-panel .signup button {
            background-color: #ffa500;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Logo Section -->
        <div class="logo">
            
        </div>

        <!-- Header with Customer Login and Home -->
        <div class="header">
            <h2>Customer Login</h2>
            <a href="home.jsp">Home</a>
        </div>

        <!-- Login Panel -->
        <div class="login-panel">
            <div class="login-info">
                <img src="https://th.bing.com/th/id/OIP.kCNMzRvb-QmjpvH1UPWUDQHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Customer Icon">
                <h2>Customer Login</h2>
            </div>
            <div class="login-form">
                <h2>Login Panel</h2>
                <form action="loginProcess.jsp" method="post">
                    <label for="email">Email address</label>
                    <input type="email" id="email" name="email" placeholder="Enter email" required>
                    
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                    
                    <a href="#">Forgot Password?</a><br><br>
                    <button type="submit">Click here to Login</button>
                </form>
            </div>
            <div class="signup">
                <h2>New User</h2>
                <button onclick="window.location.href='signup.jsp'">Sign Up (It's Free)</button>
            </div>
        </div>
    </div>
</body>
</html>

