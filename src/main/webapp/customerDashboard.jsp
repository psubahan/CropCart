<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cropcart.dto.Customer" %>
<%@ page import="com.cropcart.dto.ProductDetails" %>
<%@ page import="com.cropcart.DAO.ProductDAOImp" %>
<%@ page import="com.cropcart.DAO.ProductDAO" %>
<%@ page import="com.cropcart.DAO.OrdersDAOIpml" %>
<%@ page import="com.cropcart.DAO.OrderDAO" %>
<%@ page import="com.cropcart.dto.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

         <style>
        
        .card {
            border-radius: 0px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: 2px solid #008000;
        }

        .card-body {
            padding: 1rem;
        }

        .card-header {
            background-color: #008000;
            color: white;
        }

        .graph-container {
            margin-top: 3rem;
            text-align: center;
        }

        .container {
            max-width: 1130px;
            margin: 0 auto;
            padding: 2rem;
        }

        h4, h5 {
            font-size: 1.2rem;
        }

        .product-list {
            margin-top: 2rem;
        }

        .product-card {
            margin-bottom: 1rem;
        }

        table {
            width: 100%;
            margin-top: 20px;
        }

        table th, table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #f8f9fa;
        }
    </style>
   
</head>
<body>
<%@ include file="header.jsp"%>


<div class="container">
    <div class="card mb-4">
        <div class="card-header">
            <h4>Your Details</h4>
        </div>
        
        <div class="card-body">
            <% Customer c = (Customer) session.getAttribute("customer"); %>
            <div class="row">
                <div class="col-md-6">
                    <h5><strong>Name:</strong> <%= c.getName() %></h5>
                    <h5><strong>Email:</strong> <%= c.getMail() %></h5>
                    <h5><strong>Phone:</strong> <%= c.getPhone() %></h5>
                    <h5><strong>Address:</strong> <%= c.getAddress() %></h5>
                    <h5><strong>City:</strong> <%= c.getCity() %></h5>
                </div>
                <div class="col-md-6">
                    <h5><strong>State:</strong> <%= c.getState() %></h5>
                    <h5><strong>Pincode:</strong> <%= c.getPincode() %></h5>
                    <h5><strong>Customer Type:</strong> <%= c.getCustomer_type() %></h5>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header">
                <div class="card-header" style="display: flex; justify-content:space-between;">
                        <h4>Purchased Products</h4>
                        <a href="CustomerProductsBought.jsp" class="update-link">View All</a>
                    </div>
                    </div>
                   <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
    <% 
        if (c != null) {
            int customerId = c.getCustomer_id();
            OrderDAO orderDAO = new OrdersDAOIpml();
            List<Orders> orderList = orderDAO.getOrders(customerId);
            
            if (orderList != null && !orderList.isEmpty()) {
                int count = 0;
                for (Orders order : orderList) { 
                    if (count >= 5) break; // Display only the first 5 products
    %>
                    <tr>
                        <td><%= order.getOrder_Id() %></td>
                        <td><%= order.getProduct_Name() %></td>
                        <td><%= order.getQuantity() %></td>
                        <td>₹<%= order.getCart_Cost() %></td>
                        <td><%= order.getStatus() %></td>
                    </tr>
    <%
                    count++;
                } 
            } else { 
    %>
                <tr>
                    <td colspan="5" class="text-center">No orders found.</td>
                </tr>
    <% 
            } 
        } else { 
    %>
        <tr>
            <td colspan="5" class="text-center">Please log in to view your orders.</td>
        </tr>
    <% } %>
</tbody>
                        
                    </table>
                </div>
            </div>
        </div>
        
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header">
                    <h4>Products Bought by Category</h4>
                </div>
                <div class="card-body">
                    <canvas id="productGraph" width="400" height="200"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>

<script>
    const ctx = document.getElementById('productGraph').getContext('2d');
    var categories = [];
    var counts = [];

    <% if (c != null) {
        int customerId = c.getCustomer_id();
        OrderDAO odao = new OrdersDAOIpml();
        Map<String, Integer> categoryCountMap = odao.getOrderCountByCategory(customerId);
        for (Map.Entry<String, Integer> entry : categoryCountMap.entrySet()) { %>
            categories.push('<%= entry.getKey() %>');
            counts.push(<%= entry.getValue() %>);
    <% } } %>

    const productGraph = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: categories,
            datasets: [{
                label: 'Products Bought',
                data: counts,
                backgroundColor: ['#007bff', '#28a745', '#ff5733', '#ffc107'],
                hoverOffset: 4
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>
