<%@ page import="com.cropcart.DAO.CustomerDAOImp" %>
<%@ page import="com.cropcart.DAO.CustomerDAO" %>
<%@ page import="com.cropcart.dto.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customer Details</title>
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
            String customerIdParam = request.getParameter("customer_id");

            if (customerIdParam != null && !customerIdParam.trim().isEmpty()) {
                int customer_id = Integer.parseInt(customerIdParam);

                // Create the DAO object and fetch the customer details
                CustomerDAO cdao = new CustomerDAOImp();
                Customer customer = cdao.getCustomer(customer_id);

                if (customer != null) {
    %>
                    <h2>Customer Details</h2>
                    <table class="details">
                        <tr>
                            <th>Customer ID</th>
                            <td><%= customer.getCustomer_id() %></td>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <td><%= customer.getName() %></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><%= customer.getMail() %></td>
                        </tr>
                        <tr>
                            <th>Phone</th>
                            <td><%= customer.getPhone() %></td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td><%= customer.getAddress() %></td>
                        </tr>
                        <tr>
                            <th>State</th>
                            <td><%= customer.getState() %></td>
                        </tr>
                        <tr>
                            <th>City</th>
                            <td><%= customer.getCity() %></td>
                        </tr>
                        <tr>
                            <th>Pincode</th>
                            <td><%= customer.getPincode() %></td>
                        </tr>
                        <tr>
                            <th>Customer Type</th>
                            <td><%= customer.getCustomer_type() %></td>
                        </tr>
                    </table>
                    <button onclick="window.history.back();">Back</button>
    <%
                } else {
    %>
                    <p>Customer details not found. Please check the Customer ID and try again.</p>
                    <button onclick="window.history.back();">Back</button>
    <%
                }
            } else {
    %>
                <p>Invalid or missing Customer ID. Please go back and provide a valid ID.</p>
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
