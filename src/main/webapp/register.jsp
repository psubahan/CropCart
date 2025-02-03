<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2c7a7b;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .otp-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .otp-group input {
            flex: 1;
        }

        .otp-group button {
            white-space: nowrap;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease-in-out;
            background-color: #008000;
            color: white;
        }

        .otp-group button:hover {
            transform: scale(1.02);
        }

        .message {
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
    <script>
        function sendOTP() {
            var email = document.getElementById("email").value;
            if(email === "") {
                alert("Please enter an email address");
                return;
            }
            fetch("sendOTP", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "email=" + encodeURIComponent(email)
            }).then(response => response.text())
              .then(data => alert(data));
        }

        function verifyOTP() {
            var email = document.getElementById("email").value;
            var otp = document.getElementById("otp").value;
            var userRegister = "<%= request.getParameter("userRegister") %>"; // Get user type

            if (otp === "") {
                alert("Please enter the OTP");
                return;
            }

            fetch("verifyOTP", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "email=" + encodeURIComponent(email) + "&otp=" + encodeURIComponent(otp)
            }).then(response => response.text())
              .then(data => {
                  if (data.includes("success")) {
                      alert("OTP verified successfully!");
                      window.location.href = "registerForm.jsp?userRegister=" + userRegister + "&email=" + encodeURIComponent(email);
                  } else {
                      alert("Invalid OTP. Please try again.");
                  }
              });
        }
    </script>
</head>
<body>
    <%@ include file="header.jsp"%>
    <%
    String userRegister = request.getParameter("userRegister");
    String message = (String) request.getAttribute("message");
    Boolean success = (Boolean) request.getAttribute("success");

    if (message != null) {
        if (success != null && success) {
    %>
            <div class="container">
                <div class="message success">
                    <%= message %>
                </div>
            </div>
    <%
        } else {
    %>
            <div class="container">
                <div class="message error">
                    <%= message %>
                </div>
            </div>
    <%
        }
    }
    %>

    <% if ("Farmer".equalsIgnoreCase(userRegister)) { %>
    <div class="container" style="margin-top: 50px;">
        <div class="image-section">
            <div class="title" style="font-size: 20px; font-weight: bold; text-align: center; margin: 15px; color: #008000;">FARMER REGISTRATION</div>
        </div>

        <form action="register" method="POST">
            <div class="form-group">
                <label for="email">Email</label>
                <div class="otp-group">
                    <input type="email" id="email" name="email" required>
                    <button type="button" onclick="sendOTP()">Send OTP</button>
                </div>
            </div>
            <div class="form-group">
                <label for="otp">Enter OTP</label>
                <div class="otp-group">
                    <input type="text" id="otp" name="otp" required>
                    <button type="button" onclick="verifyOTP()">Verify OTP</button>
                </div>
            </div>
        </form>
    </div>
    <% } else if ("Customer".equalsIgnoreCase(userRegister)) { %>
    <div class="container" style="margin-top: 50px;">
        <div class="image-section">
            <div class="title" style="font-size: 20px; font-weight: bold; text-align: center; margin: 15px; color: #008000;">CUSTOMER REGISTRATION</div>
        </div>

        <form action="register" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <div class="otp-group">
                    <input type="email" id="email" name="email" required>
                    <button type="button" onclick="sendOTP()">Send OTP</button>
                </div>
            </div>
            <div class="form-group">
                <label for="otp">Enter OTP</label>
                <div class="otp-group">
                    <input type="text" id="otp" name="otp" required>
                    <button type="button" onclick="verifyOTP()">Verify OTP</button>
                </div>
            </div>
        </form>
    </div>
    <% } %>

    <%@ include file="footer.jsp"%>
</body>
</html>
