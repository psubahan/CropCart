<%@page import="com.cropcart.DAO.ProductDAOImp"%>
<%@ page import="com.cropcart.DAO.ProductDAO" %>
<%@ page import="com.cropcart.dto.ProductDetails" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #fdf6e3;
            margin: 0;
            padding: 0;
        }
        .container {
            padding: 20px;
            text-align: center;
        }
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .product-card {
            background-color: #ffffff;
            border: 2px solid #008000;
            border-radius: 15px;
            margin: 20px;
            padding: 20px;
            width: 300px;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }
        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }
        .product-image img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }
        .product-title {
            font-size: 1.5em;
            font-weight: bold;
            margin: 15px 0;
        }
        .price {
            color: #008000;
            font-size: 1.2em;
            font-weight: bold;
        }
        .product-description {
            font-size: 0.9em;
            color: #555;
            margin: 10px 0;
        }
        .button-container {
            margin-top: 15px;
        }
        .quantity-input {
            width: 60px;
            padding: 5px;
            font-size: 1em;
            border: 2px solid #008000;
            border-radius: 5px;
        }
        .add-to-cart {
            background-color: #008000;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .add-to-cart:hover {
            background-color: #66cc66;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <div class="product-container">
        <%
            ProductDAO pdao = new ProductDAOImp();
            List<ProductDetails> products = pdao.getAllproducts();

            if (products != null && !products.isEmpty()) {
                for (ProductDetails product : products) {
        %>
                    <div class="product-card">
                        <div class="product-image">
                            <img src="<%= product.getImage() %>" alt="<%= product.getTitle() %>">
                        </div>
                        <h2 class="product-title"><%= product.getTitle() %></h2>
                        <p class="price">₹<%= product.getPrice() %></p>
                        <p class="product-description"><%= product.getDescription() %></p>
                        <form action="addToCart" method="post">
                            <input type="hidden" name="product_id" value="<%= product.getProduct_id() %>">
                            <div class="button-container">
                                <input type="number" name="quantity" class="quantity-input" placeholder="Qty" min="1" required>
                              <button type="submit" class="add-to-cart">Add to Cart</button>  
                            </div>
                            
                        </form>
                    </div>
        <%
                }
            } else {
        %>
            <p>No products available.</p>
        <%
            }
        %>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
