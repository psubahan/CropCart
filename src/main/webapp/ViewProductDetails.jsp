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
    <title>View Product Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            margin-bottom: 20px;
        }

        table.details {
            width: 80%;
            max-width: 600px;
            border-collapse: collapse;
            margin: 20px 0;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        table.details th, table.details td {
            padding: 10px 15px;
            text-align: left;
        }

        table.details th {
            background-color: #008000;
            color: white;
            font-weight: bold;
        }

        table.details td {
            border-bottom: 1px solid #ddd;
        }

        table.details tr:last-child td {
            border-bottom: none;
        }

        p {
            color: #d32f2f;
            font-size: 16px;
            margin-top: 20px;
        }

        button {
            background: linear-gradient(145deg, #008000, #66ff66);
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        button:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        button:active {
            transform: scale(1);
            box-shadow: none;
        }
    </style>
</head>
<body>
    <%
        ProductDAO pdao = new ProductDAOImp();
        List<ProductDetails> products = pdao.getAllproducts();

        if (products != null && !products.isEmpty()) {
    %>
            <h2>All Products</h2>
            <table class="details">
                <tr>
                    <th>Product ID</th>
                    <th>Category</th>
                    <th>Title</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Description</th>
                    <th>Quantity Type</th>
                    <th>Price</th>
                    <th>Status</th>
                </tr>
                <%
                    for (ProductDetails product : products) {
                %>
                    <tr>
                        <td><%= product.getProduct_id() %></td>
                        <td><%= product.getCategoty() %></td>
                        <td><%= product.getTitle() %></td>
                        <td><%= product.getImage() %></td>
                        <td><%= product.getQuantity() %></td>
                        <td><%= product.getDescription() %></td>
                        <td><%= product.getQuantity_type() %></td>
                        <td><%= product.getPrice() %></td>
                        <td><%= product.getStatus() %></td>
                    </tr>
                <%
                    }
                %>
            </table>
            <button onclick="window.history.back();">Back</button>
    <%
        } else {
    %>
            <p>No products found.</p>
            <button onclick="window.history.back();">Back</button>
    <%
        }
    %>
</body>
</html>
