<%@page import="com.cropcart.DAO.FarmerDAOImp"%>
<%@page import="com.cropcart.DAO.FarmerDAO"%>
<%@page import="com.cropcart.dto.Farmer"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmer Information</title>
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
<% 
    Farmer f = (Farmer) session.getAttribute("farmer"); 
    if (f == null) {
        out.println("<p>No farmer session found!</p>");
        return;
    }
%>
<%@ include file="header.jsp"%>

<div class="container" style="margin: 50px 0px;">
    <table>
        <thead>
            <tr>
                <th>farmer_id</th>
                <th>name</th>
                <th>email</th>
                <th>phone</th>
                <th>address</th>
                <th>state</th>
                <th>city</th>
                <th>pincode</th>
                <th>bank_name</th>
                <th>ifsc</th>
                <th>acc_no</th>
            </tr>
        </thead>
        <tbody>
        <% 
            FarmerDAO fdao = new FarmerDAOImp();
            f = fdao.getFarmer(f.getFarmer_id());
            if (f != null) {
        %>
            <tr>
                <td><%= f.getFarmer_id() %></td>
                <td><%= f.getName() %></td>
                <td><%= f.getEmail() %></td>
                <td><%= f.getPhone() %></td>
                <td><%= f.getAddress() %></td>
                <td><%= f.getState() %></td>
                <td><%= f.getCity() %></td>
                <td><%= f.getPincode() %></td>
                <td><%= f.getBank_name() %></td>
                <td><%= f.getIfsc() %></td>
                <td><%= f.getAcc_no() %></td>
            </tr>
        <% 
            } else {
                out.println("<tr><td colspan='11'>Farmer data not found!</td></tr>");
            }
        %>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp"%>

</body>
</html>
