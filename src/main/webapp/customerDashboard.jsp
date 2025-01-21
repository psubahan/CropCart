<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cropcart.dto.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initialscale=1.0">
 <title>Customer Dashboard</title>
 <link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<% Customer c=(Customer)session.getAttribute("customer");%>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
 <div class="container-fluid">
 <a class="navbar-brand" href="#">Welcome <%=c.getName()%>
</a>
<button class="navbar-toggler" type="button" data-bstoggle="collapse" data-bs-target="#navbarNav" ariacontrols="navbarNav" aria-expanded="false" aria-label="Toggle
navigation">
 <span class="navbar-toggler-icon"></span>
 </button>
 <div class="collapse navbar-collapse" id="navbarNav">
 <ul class="navbar-nav ms-auto">
 
 
 <li class="nav-item">
 <a class="nav-link" href="#">Reset Password</a>
 </li>

 
 <li class="nav-item">
 <form action="logout" method="POST">
 <input class="btn btn-danger" name="logout" type="submit" value="logout" >
 </form>
 </li>
 
 <!--  <a class="nav-link" href="#">Logout</a>-->
 
 
 </ul>
 </div>
 </div>
 </nav>
 <div class="container mt-4">
 <h1 class="text-center mb-4">Dashboard</h1>
</div>
<!-- User Section -->
 <div class="row">
 <div class="col-md-12">
 
 <h3>View Customer Data</h3>
 <table class="table table-hover">
 
 <thead>
 <tr>
 <th>Customer_Id</th>
 <th>Name</th>
 <th>phone</th>
 <th>mail</th>
 <th>password</th>
<th>Address</th>
<th>State</th>
<th>City</th>
<th>pincode</th>
<th>customer_type</th>
 </tr>
 </thead>
 
 <tbody>
 <tr>
 <td><%=c.getCustomer_id()%></td>
 <td><%=c.getName()%></td>
 <td><%=c.getPhone()%></td>
 <td><%=c.getMail() %></td>
 <td><%=c.getPassword()%></td>
 <td><%=c.getAddress()%></td>
 <td><%=c.getState() %></td>
 <td><%=c.getCity() %></td>
 <td><%=c.getPincode()%></td>
 <td><%=c.getCustomer_type() %></td>
 </tr>
 </tbody>

 </table>
 </div>
 </div>
</body>
</html>