<%@page import="com.cropcart.DAO.ProductCatDAOImp"%>
<%@page import="com.cropcart.DAO.ProductCatDAO"%>
<%@page import="com.cropcart.dto.ProductCategory"%>
<%@ page import="java.util.ArrayList, java.util.Iterator" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Category</title>
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
            <%
                ProductCategory pc = new ProductCategory();
                ProductCatDAO pdao = new ProductCatDAOImp();
                ArrayList<ProductCategory> al = pdao.getProductCategory();
                
                if (al != null && !al.isEmpty()) { 
                    Iterator<ProductCategory> itr = al.iterator();
                    while(itr.hasNext()){
                        pc = itr.next();
            %>
            <tbody>
                <tr>
                    <td><%= pc.getProductCategory_id() %></td>
                    <td><%= pc.getCategory() %></td>
                    <td><img src="<%=pc.getImg()%>"></td>
                    <td><%= pc.getDescription() %></td>
                    <td><%= pc.getStatus() %></td>
                </tr>
            </tbody>
            <%
                    }
                } else {
            %>
            <tbody>
                <tr>
                    <td colspan="5">No product categories found!</td>
                </tr>
            </tbody>
            <%
                }
            %>
        </table>
    </div>
<%@ include file="footer.jsp"%>
</body>
</html>
