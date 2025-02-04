<%@page import="com.cropcart.dto.Orders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cropcart.DAO.OrderDAO" %>
    <%@ page import="com.cropcart.DAO.OrdersDAOIpml" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delivered Orders</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        img {
            width: 50px;
            height: 50px;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Delivered Orders</h2>
    <%
        OrderDAO ordersDAO = new OrdersDAOIpml();
        List<Orders> deliveredOrders = ordersDAO.getDeliveredOrders();
        System.out.println(deliveredOrders);
    %>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Cart Cost</th>
            <th>Product Image</th>
            <th>Product Name</th>
            <th>Order Address</th>
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Farmer ID</th>
        </tr>
        <%
            if (deliveredOrders != null && !deliveredOrders.isEmpty()) {
                for (Orders order : deliveredOrders) {
        %>
        <tr>
            <td><%= order.getOrder_Id() %></td>
            <td><%= order.getCart_Cost() %></td>
            <td><img src="<%= order.getProduct_Image() %>" alt="Product"></td>
            <td><%= order.getProduct_Name() %></td>
            <td><%= order.getOrder_Address() %></td>
            <td><%= order.getCustomer_Id() %></td>
            <td><%= order.getCustomer_Name() %></td>
            <td><%= order.getFarmer_id() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="8">No delivered orders found</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>