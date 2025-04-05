<%@page import="com.cropcart.dto.Customer"%>
<%@page import="com.cropcart.DAO.CustomerDAOImp"%>
<%@page import="com.cropcart.DAO.CustomerDAO"%>
<%@page import="com.cropcart.DAO.FarmerDAOImp"%>
<%@page import="com.cropcart.DAO.FarmerDAO"%>
<%@page import="com.cropcart.dto.Farmer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .payment-section, .card-section {
      height: 500px;
      display: flex;
      justify-content: center;
      align-items: center;
      box-sizing: border-box;
    }

    .card-section {
      width: 600px;
      padding: 40px;
      box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
      border-radius: 0px 5px 5px 0px;
      flex-direction: column;
      justify-content: space-between;
      display: flex;
    }

    .payment-section {
      width: 300px;
      background: linear-gradient(145deg, #00d100, #82fc82);
      border-radius: 5px 0px 0px 5px;
    }

    h2, h3 {
      text-align: center;
    }

    label {
      display: block;
      margin: 10px 0 5px;
      font-weight: bold;
    }

    .input {
      width: 500px;
      padding: 8px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      transition: border-color 0.2s, box-shadow 0.2s;
    }

    .input:focus {
      border-color: #008000;
      box-shadow: 0 0 15px rgba(0, 128, 0, 0.4);
      outline: none;
    }

    .button {
      padding: 10px;
      width: 100%;
      background: #008000;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }

    .btn {
      width: 100%;
      display: flex;
      justify-content: center;
    }

    .failure {
      color: red;
      text-align: center;
    }

    /* Modal Styles */
    .modal {
      display: none;
      position: fixed;
      z-index: 999;
      padding-top: 100px;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
      background-color: #fefefe;
      margin: auto;
      padding: 30px;
      border: 1px solid #888;
      width: 400px;
      border-radius: 10px;
      text-align: center;
    }

    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
      cursor: pointer;
    }

    .close:hover {
      color: black;
    }
  </style>
</head>
<body>
<%@ include file="header.jsp" %>

<%
  int Fid = request.getAttribute("id") != null ? (int)request.getAttribute("id") : Integer.parseInt(request.getParameter("id"));
  int Cid = request.getAttribute("cid") != null ? (int)request.getAttribute("cid") : Integer.parseInt(request.getParameter("cid"));
  int Cost = request.getAttribute("cost") != null ? (int)request.getAttribute("cost") : Integer.parseInt(request.getParameter("cost"));

  FarmerDAO fdao = new FarmerDAOImp();
  Farmer f = fdao.getFarmer(Fid);
  CustomerDAO cdao = new CustomerDAOImp();
  Customer c = cdao.getCustomer(Cid);
%>

<div class="container">
  <div class="payment-section">
    <div class="payment-box">
      <h3 style="margin: 20px">Payment</h3>
      <p><strong>Amount to pay: <%=Cost%></strong></p>
      <label>Online Payment Only</label>
    </div>
  </div>

  <div class="card-section">
    <h3>Payment Details</h3>

    <% if(request.getAttribute("failure") != null) { %>
      <h2 class="failure"><%= request.getAttribute("failure") %></h2>
    <% } %>

    <form action="doPayment2" method="post">
      <input type="hidden" name="id" value="<%=Fid%>">
      <input type="hidden" name="cid" value="<%=Cid%>">
      <input type="hidden" name="cost" value="<%=Cost%>">

      <label>Paying From</label>
      <input type="text" value="<%= c.getName() %>" readonly class="input">

      <label>Paying to</label>
      <input type="text" value="<%= f.getName() %>" readonly class="input">

      <label>Farmer's Account Number</label>
      <input type="text" value="<%= f.getAcc_no() %>" readonly class="input">

      <label>Enter Your Account Number</label>
      <input type="text" placeholder="*" name="customerAccNo" required class="input">

      <div class="btn">
        <input type="submit" value="Pay Now" class="button">
      </div>
    </form>
  </div>
</div>
<!-- Success Modal -->
<div id="successModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="redirectToRequested()">&times;</span>
    <h2>Payment Successful 🎉</h2>
    <p><%= request.getAttribute("success") %></p>
    <button class="button" onclick="redirectToRequested()">Close</button>
  </div>
</div>

<script>
  window.onload = function () {
    var successMessage = '<%= request.getAttribute("success") != null ? request.getAttribute("success") : "" %>';
    if (successMessage !== "") {
      document.getElementById("successModal").style.display = "block";

      // Automatically redirect after 5 seconds
      setTimeout(function () {
        window.location.href = "RequestedProducts.jsp";
      }, 5000);
    }
  };

  function redirectToRequested() {
    window.location.href = "RequestedProducts.jsp";
  }
</script>


<%@ include file="footer.jsp" %>
</body>
</html>
