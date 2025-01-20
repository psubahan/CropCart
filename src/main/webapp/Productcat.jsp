<%@page import="com.cropcart.DAO.ProductCatDAOImp"%>
<%@page import="com.cropcart.DAO.ProductCatDAO"%>
<%@page import="com.cropcart.dto.ProductCategory"%>
<%@ page import="java.util.ArrayList, java.util.Iterator" %>
<%@ page import="java.util.*" %>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Category Table</title>
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
    </style>
</head>
<body>


<%@ include file="header.jsp"%>
    <div class="container" style="margin: 50px 0px;">
        <%
        
        
        
        // Fetching the list of product categories
        ProductCatDAO pdao = new ProductCatDAOImp();
        ArrayList<ProductCategory> productCategories = pdao.getProductCategory();
        
        // Checking if the list is not empty and displaying data
        if (productCategories != null && !productCategories.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Category ID</th>
                    <th>Category Name</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
            <%
            // Iterating over the list of product categories
            for (ProductCategory pc : productCategories) {
                int id = pc.getProductCategory_id();
                String category = pc.getCategory();
                String image = pc.getImg();
                String desc = pc.getDescription();
                String status = pc.getStatus();
            %>
                <tr>
                    <td><%= id %></td>
                    <td><%= category %></td>
                    <td><img src="<%= image %>" alt="<%= category %>"></td>
                    <td><%= desc %></td>
                    <td><%= status %></td>
                </tr>
            <%
            }
            %>
            </tbody>
        </table>
        <%
        } else {
        %>
        <p>No product categories available.</p>
        <%
        }
        %>
    </div>
    
    <%@ include file="footer.jsp"%>
</body>
</html>

        
       
        


