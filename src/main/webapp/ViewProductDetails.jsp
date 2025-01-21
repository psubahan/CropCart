<%@page import="com.cropcart.DAO.ProductDAOImp"%>
<%@ page import="com.cropcart.DAO.ProductDAOImp" %>
<%@ page import="com.cropcart.DAO.ProductDAO" %>
<%@ page import="com.cropcart.dto.ProductDetails" %>
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
        try {
            String productIdParam = request.getParameter("product_id");

            if (productIdParam != null && !productIdParam.trim().isEmpty()) {
                int product_id = Integer.parseInt(productIdParam);

                // Create the DAO object and fetch the customer details
                ProductDAO pdao = new ProductDAOImp();
                ProductDetails product = pdao.getProduct(product_id);

                if (product != null) {
    %>
                    <h2>Product Details</h2>
                    <table class="details">
                        <tr>
                            <th>Product ID</th>
                            <td><%= product.getProduct_id() %></td>
                        </tr>
                        <tr>
                            <th>Category</th>
                            <td><%= product.getCategoty() %></td>
                        </tr>
                        <tr>
                            <th>Title</th>
                            <td><%= product.getTitle() %></td>
                        </tr>
                        <tr>
                            <th>Image</th>
                            <td><%= product.getImage() %></td>
                        </tr>
                        <tr>
                            <th>Quantity</th>
                            <td><%=product.getQuantity() %></td>
                        </tr>
                        <tr>
                            <th>Description</th>
                            <td><%= product.getDescription() %></td>
                        </tr>
                        <tr>
                            <th>Quantity type</th>
                            <td><%= product.getQuantity_type() %></td>
                        </tr>
                        <tr>
                            <th>Price</th>
                            <td><%= product.getPrice() %></td>
                        </tr>
                        <tr>
                            <th>Status</th>
                            <td><%= product.getStatus() %></td>
                        </tr>
                        
                        
                        
                    </table>
                    <button onclick="window.history.back();">Back</button>
    <%
                } else {
    %>
                    <p>Product details not found. Please check the Product ID and try again.</p>
                    <button onclick="window.history.back();">Back</button>
    <%
                }
            } else {
    %>
                <p>Invalid or missing Product ID. Please go back and provide a valid ID.</p>
                <button onclick="window.history.back();">Back</button>
    <%
            }
        } catch (Exception e) {
    %>
            <p>An error occurred while processing the request: <%= e.getMessage() %></p>
            <button onclick="window.history.back();">Back</button>
    <%
        }
    %>
</body>
</html>
