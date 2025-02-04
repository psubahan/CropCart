<%@ page import="com.cropcart.dto.ProductDetails" %>
<%@ page import="com.cropcart.DAO.ProductDAOImp" %>
<%@ page import="com.cropcart.DAO.ProductDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <%@ include file="header.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
             background: url('https://plus.unsplash.com/premium_photo-1661900547591-80ee79e20d1c?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
          background-size: cover;
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.2);
            color: #240c0c;
           
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group textarea, .form-group select {
            width: 95%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            // Retrieve product ID from query parameters
            String productId = request.getParameter("product_id");
            ProductDAO pdao = new ProductDAOImp();
            ProductDetails product = pdao.getProduct(Integer.parseInt(productId));

            if (product != null) {
        %>
        <h2>Product Details</h2>
        <form action="UpdateProductServlet" method="post">
            <!-- Hidden field to pass product ID -->
            <input type="hidden" name="product_id" value="<%= product.getProduct_id() %>">
            
            <div class="form-group">
                <label for="image">Product Image:</label>
                <!-- Display the current image -->
                <img src="<%= product.getImage() %>" alt="Product Image" style="width: 100%; max-height: 300px; object-fit: cover; margin-bottom: 10px;">
                
               
            </div>
            
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" readonly value="<%= product.getTitle() %> ">
            </div>
            
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" readonly value="<%= product.getCategoty() %>">
            </div>
            
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="text" id="quantity" name="quantity" value="<%= product.getQuantity() %>">
            </div>
            
            <div class="form-group">
                <label for="price">Price (₹/Kg):</label>
                <input type="text" id="price" name="price" value="<%= product.getPrice() %>">
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description"><%= product.getDescription() %></textarea>
            </div>
            
            <div class="form-group">
                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="Available" <%= product.getStatus().equalsIgnoreCase("Available") ? "selected" : "" %>>Available</option>
                    <option value="Unavailable" <%= product.getStatus().equalsIgnoreCase("Unavailable") ? "selected" : "" %>>Unavailable</option>
                </select>
            </div>
            
            <div class="form-group">
                <button type="submit">Update Product</button>
                 <a href="ViewProductsByFID.jsp"><button type="submit">Back</button></a>
            </div>
             
        </form>
        <% } else { %>
        <h4 style="color: red;">Product not found.</h4>
        <% } %>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
