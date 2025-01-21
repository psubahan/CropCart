<%@ page import="com.cropcart.DAO.FarmerDAOImp" %>
<%@ page import="com.cropcart.DAO.FarmerDAO" %>
<%@ page import="com.cropcart.dto.Farmer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Farmer Details</title>
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
            String farmerIdParam = request.getParameter("farmer_id");

            if (farmerIdParam != null && !farmerIdParam.trim().isEmpty()) {
                int farmer_id = Integer.parseInt(farmerIdParam);

                // Create the DAO object and fetch the customer details
                FarmerDAO cdao = new FarmerDAOImp();
                Farmer farmer = cdao.getFarmer(farmer_id);

                if (farmer != null) {
    %>
                    <h2>Farmer Details</h2>
                    <table class="details">
                        <tr>
                            <th>Customer ID</th>
                            <td><%= farmer.getFarmer_id() %></td>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <td><%= farmer.getName() %></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><%= farmer.getEmail() %></td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td><%= farmer.getAddress() %></td>
                        </tr>
                        <tr>
                            <th>State</th>
                            <td><%= farmer.getState() %></td>
                        </tr>
                        <tr>
                            <th>City</th>
                            <td><%= farmer.getCity() %></td>
                        </tr>
                        <tr>
                            <th>Phone</th>
                            <td><%= farmer.getPhone() %></td>
                        </tr>
                        <tr>
                            <th>Pincode</th>
                            <td><%= farmer.getPincode() %></td>
                        </tr>
                        <tr>
                            <th>Bank Name</th>
                            <td><%= farmer.getBank_name() %></td>
                        </tr>
                        
                        <tr>
                            <th>Branch</th>
                            <td><%= farmer.getBranch() %></td>
                        </tr>
                        
                        <tr>
                            <th>Ifsc</th>
                            <td><%= farmer.getIfsc() %></td>
                        </tr>
                        
                        <tr>
                            <th>Acc no</th>
                            <td><%= farmer.getAcc_no() %></td>
                        </tr>
                        
                    </table>
                    <button onclick="window.history.back();">Back</button>
    <%
                } else {
    %>
                    <p>Farmer details not found. Please check the Farmer ID and try again.</p>
                    <button onclick="window.history.back();">Back</button>
    <%
                }
            } else {
    %>
                <p>Invalid or missing Farmer ID. Please go back and provide a valid ID.</p>
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
