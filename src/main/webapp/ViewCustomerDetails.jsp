<%@page import="java.util.List"%>
<%@ page import="com.cropcart.DAO.CustomerDAOImp" %>
<%@ page import="com.cropcart.DAO.CustomerDAO" %>
<%@ page import="com.cropcart.dto.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #f4f7f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .card-header {
            background-color: #008000;
            color: white;
            text-align: center;
            font-weight: bold;
            padding: 15px;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .card-body {
            background-color: white;
            padding: 20px;
        }

        .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .back-btn, .delete-btn {
            background-color: #008000;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .back-btn:hover, .delete-btn:hover {
            background-color: #388e3c;
        }

        .delete-btn {
            margin-top: 10px;
        }

        /* Responsiveness */
        @media (max-width: 576px) {
            .card-header {
                font-size: 16px;
            }

            .card-body {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container my-5">
    <%
        try {
            // Create the DAO object and fetch the customer details
            CustomerDAO cdao = new CustomerDAOImp();
            List<Customer> customers = cdao.getAllCoustomers();

            if (customers != null && !customers.isEmpty()) {
                int count = 0; // Counter to track cards
    %>
                <div class="row justify-content-center">
                    <% for (Customer c : customers) { 
                        if (count % 3 == 0 && count != 0) { %>
                            </div><div class="row justify-content-center mt-4">
                        <% } %>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-header"><%= c.getCustomer_id() %></div>
                                <div class="card-body text-center">
                                    <i class="fa-solid fa-user" class="profile-img"></i>
                                    <h4><%= c.getName() %></h4>
                                    <p><strong>Customer Type:</strong> <%= c.getCustomer_type() %></p>
                                    <p><strong>Email:</strong> <%= c.getMail() %></p>
                                    <p><strong>Phone:</strong> <%= c.getPhone() %></p>
                                    <p><strong>Address:</strong> <%= c.getAddress() %></p>
                                    <p><strong>State:</strong> <%= c.getState() %></p>
                                    <p><strong>City:</strong> <%= c.getCity() %></p>
                                    <p><strong>Pincode:</strong> <%= c.getPincode() %></p>
                                </div>
                                
                                <div class="card-footer text-center">
								    <div class="d-inline-block mx-2">
								        <a href="adminDashboard.jsp"><button class="back-btn">Back</button></a>
								    </div>
								    <div class="d-inline-block mx-2">
								        <form action="DeleteCustomerServlet" method="post">
								            <input type="hidden" name="customer_id" value="<%= c.getCustomer_id() %>">
								            <button type="submit" class="delete-btn">Delete</button>
								        </form>
								    </div>
								</div>
                            </div>
                        </div>
                    <%
                        count++; // Increment the counter
                    } %>
                </div>
    <%
            } else {
    %>
                <p>Customer details not found. Please check the Customer ID and try again.</p>
                <button class="back-btn" onclick="window.history.back();">Back</button>
    <%
            }
        } catch (Exception e) {
    %>
            <p>An error occurred while processing the request: <%= e.getMessage() %></p>
            <button class="back-btn" onclick="window.history.back();">Back</button>
    <%
        }
    %>
</div>

<jsp:include page="footer.jsp" />
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>