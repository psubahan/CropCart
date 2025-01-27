<%@page import="com.cropcart.dto.Admin"%>
<%@page import="com.cropcart.dto.Customer"%>
<%@page import="com.cropcart.dto.Farmer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
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
            border: 0.5px solid #008000;
            position: relative; /* This makes it a positioning reference */
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
            margin-bottom: 30px;
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
            box-shadow: 0 4px 10px rgba(0, 128, 0, 0.3);
        }

        button:hover {
            background-color: #005700;
            box-shadow: 0 6px 18px rgba(0, 128, 0, 0.4);
        }

        .readonly-tooltip {
            position: relative;
            display: inline-block;
            cursor: not-allowed; 
        }

        .readonly-tooltip:hover::after {
            content: attr(data-tooltip);
            position: absolute;
            top: -30px; /* Adjust positioning above the field */
            left: 0;
            padding: 5px;
            background-color: #ffcc00;
            color: black;
            font-size: 14px;
            border-radius: 5px;
            white-space: nowrap;
            visibility: visible;
            opacity: 1;
            transition: opacity 0.3s;
        }

        .readonly-tooltip::after {
            visibility: hidden;
            opacity: 0;
        }

        .success {
            color: green;
            margin-top: 10px;
            margin-bottom: 40px;
            text-align: center;
        }

        .failure {
            color: red;
            margin-top: 10px;
            margin-bottom: 40px;
            text-align: center;
        }
        
        .changePass {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 14px;
        }
        
        .changePass a {
            color: red;
            text-decoration: none;
        }
        
        .changePass a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%>

<% Farmer f = (Farmer) session.getAttribute("farmer"); %>
<% Customer c = (Customer) session.getAttribute("customer"); %>
<% Admin a = (Admin) session.getAttribute("Admin"); %>

<% if(f != null){ %>
    <div class="container">
        <div class="changePass">
            <a href="changePassword.jsp">Change Password?</a>
        </div>
        <h1>UPDATE YOUR PROFILE HERE</h1>
        <% if(request.getAttribute("updated") != null){ %>
        <h3 class="success"><%=request.getAttribute("updated")%></h3>
        <% } %>

        <% if(request.getAttribute("failed") != null){ %>
        <h3 class="failure"><%=request.getAttribute("failed") %></h3>
        <% } %>

        <form action="editProfile" method="POST">
            <div class="form-card">
                <div class="form-group">
                    <input type="text" id="name" name="name" value="<%=f.getName() %>" required>
                    <label for="name">Name</label>
                </div>
                <div class="form-group">
                    <input type="email" id="email" name="email" value="<%=f.getEmail() %>" required>
                    <label for="email">Email</label>
                </div>
                <div class="form-group">
                    <input type="text" id="address" name="address" value="<%=f.getAddress()%>" required>
                    <label for="address">Address</label>
                </div>
                <div class="form-group">
                    <input type="text" id="state" name="state" value="<%=f.getState() %>" required>
                    <label for="state">State</label>
                </div>
                <div class="form-group">
                    <input type="text" id="city" name="city" value="<%=f.getCity() %>" required>
                    <label for="city">City</label>
                </div>
                <div class="form-group">
                    <input type="text" id="phone" name="phone" value="<%=f.getPhone() %>" required>
                    <label for="phone">Phone</label>
                </div>
                <div class="form-group readonly-tooltip" data-tooltip="This field cannot be edited">
                    <input type="text" id="pincode" name="pincode" value="<%=f.getPincode() %>" readonly>
                    <label for="pincode">Pincode</label>
                </div>
                <div class="form-group">
                    <input type="text" id="bank_name" name="bank_name" value="<%=f.getBank_name() %>" required>
                    <label for="bank_name">Bank Name</label>
                </div>
                <div class="form-group">
                    <input type="text" id="branch" name="branch" value="<%=f.getBranch() %>" required>
                    <label for="branch">Branch</label>
                </div>
                <div class="form-group">
                    <input type="text" id="ifsc" name="ifsc" value="<%=f.getIfsc() %>" required>
                    <label for="ifsc">IFSC</label>
                </div>
                <div class="form-group">
                    <input type="text" id="acc_no" name="acc_no" value="<%=f.getAcc_no() %>" required>
                    <label for="acc_no">Account Number</label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit">Update</button>
            </div>
        </form>
    </div>
<%@ include file="footer.jsp"%>

<% } else if(c != null){ %>
    <div class="container">
        <div class="changePass">
            <a href="changePassword.jsp">Change Password?</a>
        </div>
        <h1>UPDATE YOUR PROFILE HERE</h1>
        <% if(request.getAttribute("updated") != null){ %>
        <h3 class="success"><%=request.getAttribute("updated")%></h3>
        <% } %>

        <% if(request.getAttribute("failed") != null){ %>
        <h3 class="failure"><%=request.getAttribute("failed") %></h3>
        <% } %>

        <form action="editProfile" method="POST">
            <div class="form-card">
                <div class="form-group">
                    <input type="text" id="name" name="name" value="<%=c.getName() %>" required>
                    <label for="name">Name</label>
                </div>
                <div class="form-group">
                    <input type="email" id="email" name="mail" value="<%=c.getMail() %>" required>
                    <label for="mail">Email</label>
                </div>
                <div class="form-group">
                    <input type="text" id="address" name="address" value="<%=c.getAddress() %>" required>
                    <label for="address">Address</label>
                </div>
                <div class="form-group">
                    <input type="text" id="state" name="state" value="<%=c.getState() %>" required>
                    <label for="state">State</label>
                </div>
                <div class="form-group">
                    <input type="text" id="city" name="city" value="<%=c.getCity() %>" required>
                    <label for="city">City</label>
                </div>
                <div class="form-group">
                    <input type="text" id="phone" name="phone" value="<%=c.getPhone() %>" required>
                    <label for="phone">Phone</label>
                </div>
                <div class="form-group readonly-tooltip" data-tooltip="This field cannot be edited">
                    <input type="text" id="pincode" name="pincode" value="<%=c.getPincode() %>" readonly>
                    <label for="pincode">Pincode</label>
                </div>
                <div class="form-group">
                    <input type="text" id="customer_type" name="customer_type" value="<%=c.getCustomer_type() %>" required>
                    <label for="customer_type">Customer Type</label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit">Update</button>
            </div>
        </form>
    </div>
<%@ include file="footer.jsp"%>

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
