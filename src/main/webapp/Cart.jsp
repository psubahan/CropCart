<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.cropcart.DAO.CartDAOImpl"%>
<%@page import="com.cropcart.DAO.CartDAO"%>
<%@page import="com.cropcart.dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cropcart.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Cart</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        color: #2e7d32; /* Darker green text */
        margin: 0;
        padding: 0;
    }

    .container {
        padding: 20px;
        margin: auto;
        max-width: 1000px;
        background-color: #ffffff; /* White background for the container */
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #008000; /* Grass green heading color */
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table th, table td {
        border: 2px solid #4caf50; /* Increased border thickness to 2px */
        padding: 12px;  /* Increased padding for better readability */
        text-align: center;
    }

    table th {
        background-color: #008000; /* Light green for headers */
        color: white;
    }

    table tr:nth-child(even) {
        background-color: #f1f8e9; /* Very light green for even rows */
    }

    .btn {
        display: inline-block;
        text-decoration: none;
        background-color: #008000; /* Grass green button background */
        color: white;
        padding: 12px 24px; /* Increased padding for buttons */
        border-radius: 5px;
        border: none;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease; /* Smooth transition effect */
    }

    .btn:hover {
        background-color: #388e3c; /* Darker green on hover */
    }

    .btn i {
        margin-right: 5px; /* Add some space between the icon and text */
    }

    .total-cost {
        margin-top: 20px;
        font-size: 20px;  /* Larger font size for better visibility */
        font-weight: bold;
        text-align: right;
        color: #2e7d32;
    }

    .checkout-button {
        text-align: center;
        margin-top: 20px;
    }

    .checkout-button a {
        margin: 0 10px;
    }
</style>
</head>
<body>
    <%@include file="header.jsp" %>
    <% 
    String message = (String) session.getAttribute("message");
    if (message != null) { 
%>
    <div style="color: green; text-align: center; margin-bottom: 10px;"><%= message %></div>
<%
        session.removeAttribute("message");
    } 
%>
    
    <div class="container">
        <% Customer c = (Customer) session.getAttribute("customer"); %>
        <% if (c != null) { %>
            <h2>Your Crop Cart</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Cost (&#8377;)</th>
                        <th>Quantity</th>
                        <th>Total (&#8377;)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        int tcost = 0;
                        CartDAO cdao = new CartDAOImpl();
                        List<Cart> ar = cdao.getCartInfo(c.getCustomer_id());
                        Iterator<Cart> itr = ar.iterator();
                        while (itr.hasNext()) {
                            Cart s = itr.next();
                            int itemTotalCost = Integer.parseInt(s.getProduct_Cost()) * Integer.parseInt(s.getQuantity());
                            tcost += itemTotalCost;  
                    %>
                    <tr>
                        <td><img src="<%=s.getProduct_Image()%>" alt="<%=s.getProduct_Title()%>" style="height: 80px; width: auto; border-radius: 10px;"></td>
                        <td><%=s.getProduct_Title()%></td>
                        <td>&#8377;<%=s.getProduct_Cost()%></td>
                        <td><%=s.getQuantity() %></td>
                        <td>&#8377;<%=itemTotalCost%></td>
                        <td>
                            <form action="addToCart" method="post" style="display:inline;">
                                <input type="hidden" name="cart_id" value="<%=s.getCart_Id()%>"/>
                                <button type="submit" name="delete" class="btn">
                                    <i class="fas fa-trash-alt"></i> <!-- Font Awesome Trash Icon -->
                                </button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <div class="total-cost">Total: &#8377;<%=tcost%></div>
            <div class="checkout-button">
                <a href="Request.jsp" class="btn">Proceed to Request</a>
                <a href="ViewProductDetails.jsp" class="btn">Back</a>
            </div>
        <% } else { %>
            <h2>Please log in to view your cart.</h2>
        <% } %>
    </div>
    <% 
        // Clear the session attribute to prevent duplicate additions
        session.removeAttribute("lastAddedProductId"); 
    %>
    <%@include file="footer.jsp" %>
</body>
</html>
