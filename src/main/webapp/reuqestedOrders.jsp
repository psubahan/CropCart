<%@page import="com.cropcart.dto.Farmer"%>
<%@page import="com.cropcart.DAO.OrdersDAOIpml"%>
<%@page import="com.cropcart.DAO.OrderDAO"%>
<%@page import="com.cropcart.dto.Orders"%>
<%@page import="com.cropcart.DAO.ProductDAOImp"%>
<%@page import="com.cropcart.DAO.ProductDAO"%>
<%@page import="com.cropcart.dto.ProductDetails"%>
<%@ page import="java.util.ArrayList, java.util.Iterator" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Requested Orders</title>
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
        
        .button {
            text-decoration: none;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            padding: 15px 25px;
            background-color: #008000;
            margin-top: 15px;
            display: inline-block;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .button:hover {
            background-color: #177526;
            cursor: pointer; 
        }
    </style>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container" style="margin: 50px 0px;">
    <% Orders o = new Orders();
       OrderDAO odao = new OrdersDAOIpml();
       Farmer f = (Farmer)session.getAttribute("farmer"); %>

    <% if (request.getAttribute("success") != null) { %>
        <div style="color: green; text-align: center;">
            <%= request.getAttribute("success") %>
        </div>
    <% } %>

    <% if (request.getAttribute("error") != null) { %>
        <div style="color: red; text-align: center;">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>
    <table>
        <thead>
            <tr>
            	<th>OrderId</th>
                <th>Product Name</th>
                <th>Image</th>
                <th>₹ Cost</th>
                <th>Quantity</th>
                <th>Customer Name</th>
                <th>Address</th>
                <th>State</th>
                <th>City</th>
                <th>Date</th>
                <th>Payment</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <% ArrayList<Orders> al = odao.getAllorders(f.getFarmer_id());
           Iterator<Orders> itr = al.iterator();
           while (itr.hasNext()) {
               o = itr.next(); %>
            <tr>
            	<td><%= o.getOrder_Id() %></td>
                <td><%= o.getProduct_Name() %></td>
                <td><img src="<%= o.getProduct_Image() %>" height="150px" width="150px"></td>
                <td>₹<%= o.getCart_Cost() %></td>
                <td><%= o.getQuantity() %></td>
                <td><%= o.getCustomer_Name() %></td>
                <td><%= o.getOrder_Address() %></td>
                <td><%= o.getOrder_State() %></td>
                <td><%= o.getOrder_city() %></td>
                <td><%= o.getOrder_date() %></td>
                <td><%= o.getPaymet_mode() %></td>
                <td>
                    <form action="farmeraction" method="post">
                        <input type="hidden" name="orderid" value="<%=o.getOrder_Id()%>">
                        <input class="button" type="submit" name="accept" value="Accept">
                    </form>
                    <form id="declineForm_<%= o.getOrder_Id() %>" action="farmeraction" method="post">
					    <input type="hidden" name="orderid" value="<%= o.getOrder_Id() %>">
					    <input type="hidden" id="declineReason_<%= o.getOrder_Id() %>" name="declineReason">
					    <input type="hidden" name="decline" value="Decline">
					    <input class="button" type="button" onclick="showDeclinePopup('<%= o.getOrder_Id() %>')"name="declineb" value="Decline">
					</form>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>


<script>
// JavaScript to handle decline pop-up functionality

let requestedOrderId;
function showDeclinePopup(orderId) {
	requestedOrderId = orderId;
    const modal = document.createElement('div');
    modal.id = 'declineModal';
    modal.style.position = 'fixed';
    modal.style.left = '0';
    modal.style.top = '0';
    modal.style.width = '100%';
    modal.style.height = '100%';
    modal.style.backgroundColor = 'rgba(0,0,0,0.5)';
    modal.style.display = 'flex';
    modal.style.justifyContent = 'center';
    modal.style.alignItems = 'center';
    modal.style.zIndex = '1000';

    modal.innerHTML = `
        <div style="background: white; padding: 20px; border-radius: 10px; width: 400px; text-align: center;">
            <h3>Reason for Decline</h3>
            <textarea id="reasonInput" style="width: 100%; height: 100px; margin-bottom: 20px;" name="declineReason" placeholder="Enter your reason..."></textarea>
            <br>
            <button onclick="submitDecline('')" name="decline" value="Decline"style="padding: 10px 20px; background-color: #f44336; color: white; border: none; border-radius: 5px; cursor: pointer;">Submit</button>
            <button onclick="closeModal()" style="padding: 10px 20px; margin-left: 10px; background-color: #ddd; border: none; border-radius: 5px; cursor: pointer;">Cancel</button>
        </div>
    `;
    document.body.appendChild(modal);
}

function closeModal() {
    const modal = document.getElementById('declineModal');
    if (modal) {
        modal.remove();
    }
}

function submitDecline() {
    const reason = document.getElementById('reasonInput').value;
    if (!reason) {
        alert('Please provide a reason for declining the order.');
        return;
    }
    
    // Retrieve the hidden input field for the decline reason
    const reasonInput = document.getElementById("declineReason_" + requestedOrderId);
    if (reasonInput) {
        reasonInput.value = reason; // Set the decline reason
        document.getElementById("declineForm_" + requestedOrderId).submit(); // Submit the form
    }
    
    closeModal();
} 
</script>
<%@ include file="footer.jsp"%>
</body>
</html>
