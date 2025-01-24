<%@page import="com.cropcart.dto.Farmer"%>
<%@page import="com.cropcart.dto.Customer"%>
<%@page import="com.cropcart.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            background-color: #f3f4f8;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15), 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 1000px;
            animation: fadeIn 1s ease-in-out;
            margin: 50px auto;
            border: 2px solid #008000;
            position: relative;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h1 {
            text-align: center;
            color: #008000;
            margin: 10px 0px 20px 0px;
            font-size: 24px;
            font-weight: bold;
            
        }

        .form-card {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .form-group {
            position: relative;
            flex: 1 1 calc(50% - 20px);
            margin-bottom: 20px;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
            color: #333;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .form-group input:focus {
            border-color: #008000;
            box-shadow: 0 0 15px rgba(0, 128, 0, 0.4);
            outline: none;
        }

        .form-group label {
            position: absolute;
            top: 12px;
            left: 12px;
            background-color: white;
            padding: 0 5px;
            color: #008000;
            transition: 0.2s;
            pointer-events: none;
            font-size: 16px;
            font-weight: bold;
        }

        .form-group input:focus + label,
        .form-group input:not(:placeholder-shown) + label {
            top: -10px;
            left: 12px;
            font-size: 14px;
            color: #008000;
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: #008000;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #005700;
        }

        .success {
            color: green;
            margin: 10px 0px 25px 0px;
            text-align: center;
        }

        .failure {
            color: red;
            margin: 10px 0px 25px 0px;
            text-align: center;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp"%>

<% 
    Farmer f = (Farmer) session.getAttribute("farmer");
    Customer c = (Customer) session.getAttribute("customer");
    Admin a = (Admin) session.getAttribute("Admin");
%>

<% if(f != null || c != null || a != null){ %>
    <div class="container">
        <h1>CHANGE YOUR PASSWORD HERE</h1>

        <!-- Success message -->
        <% if(request.getAttribute("passwordUpdated") != null){ %>
            <h3 class="success"><%= request.getAttribute("passwordUpdated") %></h3>
        <% } %>

        <!-- Failure messages -->
        <% if(request.getAttribute("passwordFailed") != null){ %>
            <h3 class="failure"><%= request.getAttribute("passwordFailed") %></h3>
        <% } %>
        
        <% if(request.getAttribute("IncorrectOldPassword") != null){ %>
            <h3 class="failure"><%= request.getAttribute("IncorrectOldPassword") %></h3>
        <% } %>
        
        <% if(request.getAttribute("EmailNotFound") != null){ %>
            <h3 class="failure"><%= request.getAttribute("EmailNotFound") %></h3>
        <% } %>
        
        <% if(request.getAttribute("Error") != null){ %>
            <h3 class="failure"><%= request.getAttribute("Error") %></h3>
        <% } %>

        <!-- Form for Farmer -->
        <% if(f != null) { %>
            <form action="changePassword" method="POST">
                <div class="form-card">
                    <div class="form-group">
                        <input type="email" id="email" name="email" value="<%= f.getEmail() %>" required>
                        <label for="email">Email</label>
                    </div>
                    <div class="form-group">
                        <input type="text" id="phoneNumber" name="phoneNumber" value="<%= f.getPhone() %>" required>
                        <label for="phoneNumber">Phone Number</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="oldPassword" name="oldPassword" required>
                        <label for="oldPassword">Enter Old Password</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="newPassword" name="newPassword" required>
                        <label for="newPassword">Enter New Password</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                        <label for="confirmPassword">Confirm Password</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit">Change Password</button>
                </div>
            </form>
        <% } %>

        <!-- Form for Customer -->
        <% if(c != null) { %>
            <form action="changePassword" method="POST">
                <div class="form-card">
                    <div class="form-group">
                        <input type="email" id="email" name="email" value="<%= c.getMail() %>" required>
                        <label for="email">Email</label>
                    </div>
                    <div class="form-group">
                        <input type="text" id="phoneNumber" name="phoneNumber" value="<%= c.getPhone() %>" required>
                        <label for="phoneNumber">Phone Number</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="oldPassword" name="oldPassword" required>
                        <label for="oldPassword">Enter Old Password</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="newPassword" name="newPassword" required>
                        <label for="newPassword">Enter New Password</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                        <label for="confirmPassword">Confirm Password</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit">Change Password</button>
                </div>
            </form>
        <% } %>

        <!-- Form for Admin -->
        <% if(a != null) { %>
            <form action="changePassword" method="POST">
                <div class="form-card">
                    <div class="form-group">
                        <input type="email" id="email" name="email" value="<%= a.getMail() %>" required>
                         <label for="email">Email</label>
                    </div>
                    <div class="form-group">
                        <input type="text" id="phoneNumber" name="phoneNumber" value="<%= a.getPhone() %>" required>
                        <label for="phoneNumber">Phone Number</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="oldPassword" name="oldPassword" required>
                        <label for="oldPassword">Enter Old Password</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="newPassword" name="newPassword" required>
                        <label for="newPassword">Enter New Password</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                        <label for="confirmPassword">Confirm Password</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit">Change Password</button>
                </div>
            </form>
        <% } %>

    </div>
<%@ include file="footer.jsp"%>

<% } else { %>
    <p>You need to log in first.</p>
<% } %>

<script type="text/javascript">
    window.onload = function() {
        var successMessage = document.querySelector('.success');
        var failureMessage = document.querySelector('.failure');
        
        if (successMessage) {
            setTimeout(function() {
                successMessage.style.display = 'none';
            }, 5000);
        }

        if (failureMessage) {
            setTimeout(function() {
                failureMessage.style.display = 'none';
            }, 5000);
        }
    };
</script>
</body>
</html>
