<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.cropcart.DAO.OrdersDAOIpml"%>
<%@ page import="com.cropcart.dto.Orders"%>
<%@ page import="com.cropcart.dto.Customer"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Requested Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 1000px;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #2e7d32;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        table th {
            background-color: #4caf50;
            color: white;
        }
        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .message {
            text-align: center;
            color: #999;
            margin-top: 20px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="container">
        <% 
            // Fetch the logged-in customer from the session
            Customer c = (Customer) session.getAttribute("customer");
            if (c != null) {
                OrdersDAOIpml ordersDAO = new OrdersDAOIpml();
                List<Orders> ordersList = ordersDAO.getOrders(c.getCustomer_id());
                if (ordersList != null && !ordersList.isEmpty()) {
        %>
        <h2>Requested Products</h2>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product Name</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <th>Order Date</th>
                </tr>
            </thead>
            <tbody>
                <% for (Orders order : ordersList) { %>
                <tr>
                    <td><%= order.getOrder_Id() %></td>
                    <td><%= order.getProduct_Name()%></td>
                    <td>&#8377;<%= order.getCart_Cost() %></td>
                    <td><%= order.getStatus() %></td>
                    <td><%= order.getOrder_date() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <div class="message">No requested products found.</div>
        <% } %>
        <% } else { %>
        <div class="message">Please log in to view your requested products.</div>
        <% } %>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
