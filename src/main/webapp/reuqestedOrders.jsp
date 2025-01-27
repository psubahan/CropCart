<%@page import="com.cropcart.dto.Farmer"%>
<%@page import="com.cropcart.DAO.OrdersDAOIpml"%>
<%@page import="com.cropcart.DAO.OrderDAO"%>
<%@page import="com.cropcart.dto.Orders"%>
<%@page import="com.cropcart.DAO.ProductDAOImp"%>
<%@page import="com.cropcart.DAO.ProductDAO"%>
<%@page import="com.cropcart.dto.ProductDetails"%>
<%@ page import="java.util.ArrayList, java.util.Iterator" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Requested Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        td img {
            max-width: 100px;
            height: auto;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        
        .button {
            text-decoration: none;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            padding: 15px 25px;
            background-color: #008000;
            margin-top: 15px;
            display: inline-block;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .button:hover {
            background-color: #177526;
            cursor: pointer; 
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container" style="margin: 50px 0px;">
    <% Orders o = new Orders();
       OrderDAO odao = new OrdersDAOIpml();
       Farmer f = (Farmer)session.getAttribute("farmer"); %>

    <% if (request.getAttribute("success") != null) { %>
        <div style="color: green; text-align: center;">
            <%= request.getAttribute("success") %>
        </div>
    <% } %>

    <% if (request.getAttribute("error") != null) { %>
        <div style="color: red; text-align: center;">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Image</th>
                <th>₹ Cost</th>
                <th>Quantity</th>
                <th>Customer Name</th>
                <th>Address</th>
                <th>State</th>
                <th>City</th>
                <th>Date</th>
                <th>Payment</th>
                <th>Accept</th>
                <th>Decline</th>
            </tr>
        </thead>
        <tbody>
        <% ArrayList<Orders> al = odao.getAllorders(f.getFarmer_id());
           Iterator<Orders> itr = al.iterator();
           while (itr.hasNext()) {
               o = itr.next(); %>
            <tr>
                <td><%= o.getProduct_Name() %></td>
                <td><img src="<%= o.getProduct_Image() %>" height="150px" width="150px"></td>
                <td>₹<%= o.getCart_Cost() %></td>
                <td><%= o.getQuantity() %></td>
                <td><%= o.getCustomer_Name() %></td>
                <td><%= o.getOrder_Address() %></td>
                <td><%= o.getOrder_State() %></td>
                <td><%= o.getOrder_city() %></td>
                <td><%= o.getOrder_date() %></td>
                <td><%= o.getPaymet_mode() %></td>
                <td>
                    <form action="farmeraction" method="post">
                        <input type="hidden" name="orderid" value="<%= o.getCart_Id() %>">
                        <input class="button" type="submit" name="accept" value="Accept">
                    </form>
                </td>
                <td>
                   <form action="farmeraction" method="post">
                        <input type="hidden" name="orderid" value="<%= o.getCart_Id() %>">
                        <input class="button" type="submit" name="decline" value="Decline">
                    </form>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>
