<%@ page import="java.util.List" %>
<%@ page import="com.cropcart.dto.Customer" %>
<%@ page import="com.cropcart.DAO.CustomerDAOImp" %>
<%@ page import="com.cropcart.DAO.CustomerDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
    <style>
        /* CSS Styles for the page */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        form {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
        }

        input {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background: linear-gradient(145deg, #008000, #66ff66);
            border: none;
            color: white;
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        button:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        table.articles {
            width: 90%;
            max-width: 1000px;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        table.articles thead {
            background: linear-gradient(145deg, #008000, #66ff66);
            color: white;
        }

        table.articles th, table.articles td {
            padding: 15px;
            text-align: left;
        }

        table.articles tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        table.articles tbody tr:nth-child(even) {
            background-color: #ffffff;
        }

        table.articles tbody tr:hover {
            background-color: #f1f9f1;
        }

        .no-data {
            text-align: center;
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>
    <form action="CustomerRecordsServlet" method="POST">
        <input type="text" id="customer_id" name="customer_id" placeholder="Customer ID" required>
        <input type="text" id="name" name="name" placeholder="Customer Name" required>
        <button type="submit">Search</button>
    </form>

    <table class="articles">
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Customer Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                CustomerDAO cdao = new CustomerDAOImp();
                List<Customer> customerList = cdao.getAllCoustomers();

                if (customerList != null && !customerList.isEmpty()) {
                    for (Customer customer : customerList) {
            %>
                        <tr>
                            <td><%= customer.getCustomer_id() %></td>
                            <td><%= customer.getName() %></td>
                            <td>
                                <form action="ViewCustomerDetails.jsp" method="get" style="display:inline;">
                                    <input type="hidden" name="customer_id" value="<%= customer.getCustomer_id() %>">
                                    <button type="submit">View Details</button>
                                </form>
                                <form action="DeleteCustomerServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="customer_id" value="<%= customer.getCustomer_id() %>">
                                    <button type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="3" class="no-data">No customers found.</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
