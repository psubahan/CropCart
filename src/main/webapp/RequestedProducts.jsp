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
            background-color: #f9f9f9;
        }
        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
        }
        .list-item {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 15px;
        }
        .list-item img {
            width: 80px;
            height: 80px;
            border-radius: 8px;
            margin-right: 20px;
        }
        .item-details {
            flex: 1;
        }
        .item-details h3 {
            margin: 0;
            color: #333;
        }
        .item-details p {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }
        .item-details .price {
            font-weight: bold;
            color: #4caf50;
        }
        .back-button {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            background-color: #008000;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .psy-btn
        {
        	background-color: #008000;
        	color: white;
        	border: none;
        	width: 80px;
        	height: 25px;
        	border-radius: 50px;
        	cursor: pointer;
        	margin: 5px;
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
        <% for (Orders order : ordersList) { %>
        <div class="list-item">
            <img src="<%= order.getProduct_Image() %>" alt="Product Image">
            <div class="item-details">
                <h3><%= order.getProduct_Name() %></h3>
                <p class="price">&#8377;<%= order.getCart_Cost() %></p>
                <p>Status: <%= order.getStatus() %></p>
                <p>Order Date: <%= order.getOrder_date()%></p>
                <%if(order.getStatus().equalsIgnoreCase("declined")){ %>
                <p>delivered by: --//-- </p>
                <%}else if(order.getDelivary_Date()==null){ %>
                <p>delivered by: Waiting For The Update </p>
                <%}else{ %>
                <p>delivered by:<%=order.getDelivary_Date() %> </p>
                <%} %>
                <%if(order.getStatus().equalsIgnoreCase("declined")){ %>
                <p>Order_Declined: <%=order.getDecline_reason() %></p>
                <%} %>
            </div>
            <a href="doPayment.jsp?id=<%=order.getFarmer_id()%>&cid=<%=order.getCustomer_Id()%>&cost=<%=order.getCart_Cost()%>"><button class="psy-btn">Pay</button></a>
            <a href="delete"><button class="psy-btn">Cancel</button></a>
        </div>
        
        <% } %>

        <div class="back-button">
            <a href="ViewProductDetails.jsp" class="btn">Back</a>
        </div>

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
