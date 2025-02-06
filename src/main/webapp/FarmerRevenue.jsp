<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.cropcart.DAO.FarmerDAOImp"%>
    <%@page import="com.cropcart.DAO.FarmerDAO"%>
    <%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Farmer Revenue</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
        }

        h2 {
            color: #27ae60;
            margin-bottom: 15px;
        }

        .input-group {
            margin-bottom: 15px;
        }

        input[type="text"] {
            width: 80%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .btn {
            padding: 10px 20px;
            background: #27ae60;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background: #219150;
        }

        .revenue {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
            background: #eafaf1;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Check Farmer Revenue</h2>
        
        <!-- Farmer ID Input Form -->
        <form action="FarmerRevenueServlet" method="GET">
            <div class="input-group">
                <input type="text" name="farmerId" placeholder="Enter Farmer ID" required>
            </div>
            <button type="submit" class="btn">Get Revenue</button>
        </form>

        <!-- Display Revenue If Available -->
        <% if (request.getAttribute("revenue") != null) { %>
            <p class="revenue">Total Revenue:  <%= request.getAttribute("revenue") %></p>
        <% } %>
    </div>

</body>
</html>