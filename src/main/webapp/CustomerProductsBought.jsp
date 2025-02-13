<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cropcart.dto.Orders" %>
<%@ page import="com.cropcart.DAO.OrdersDAOIpml" %>
<%@ page import="com.cropcart.DAO.OrderDAO" %>
<%@ page import="com.cropcart.dto.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchased Products</title>
    <%@ include file="header.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h4 {
            text-align: center;
            margin-bottom: 20px;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin: 50px auto;
            max-width: 1100px;
        }
        .card {
            background-color: white;
            border: 0.5px solid #008000;
            border-radius: 8px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            width: 310px;
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }
        .card:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }
        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .card-body {
            padding: 15px;
        }
        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin: 10px 0;
        }
        .card-details {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 10px;
        }
        .card-price {
            font-size: 1rem;
            font-weight: bold;
            color: #4CAF50;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <%
        Customer c = (Customer) session.getAttribute("customer");
        if (c != null) {
            int customerId = c.getCustomer_id();
            OrderDAO orderDAO = new OrdersDAOIpml();
            List<Orders> orderList = orderDAO.getOrders(customerId);
    %>
        <!--<h4>Customer Name: <%= c.getName() %></h4>-->
        <div class="card-container">
            <%
                if (orderList != null && !orderList.isEmpty()) {
                    for (Orders order : orderList) {
            %>
                <div class="card">
                    <img alt="Image of <%= order.getProduct_Name() %>" src="<%= order.getProduct_Image() %>" />
                    <div class="card-body">
                        <div class="card-title"><%= order.getProduct_Name() %></div>
                        <div class="card-details">Quantity: <%= order.getQuantity() %></div>
                        <div class="card-details">Order Date: <%= order.getOrder_date() %></div>
                        <div class="card-details">Delivery Date: <%= order.getDelivary_Date() %></div>
                        <div class="card-details">Status: <%= order.getStatus() %></div>
                        <div class="card-price">₹<%= order.getCart_Cost() %></div>
                    </div>
                </div>
            <%
                    }
                } else {
            %>
                <h4 style="text-align: center; color: red;">No orders found.</h4>
            <%
                }
            %>
        </div>
    <%
        } else {
            response.sendRedirect("homePage.jsp");
        }
    %>
    <%@ include file="footer.jsp" %>
</body>
</html>