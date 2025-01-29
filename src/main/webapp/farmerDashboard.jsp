<!DOCTYPE html>
<%@page import="com.cropcart.dto.Orders"%>
<%@page import="com.cropcart.DAO.OrdersDAOIpml"%>
<%@page import="com.cropcart.DAO.OrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cropcart.dto.ProductDetails"%>
<%@page import="com.cropcart.DAO.FarmerDAOImp"%>
<%@page import="com.cropcart.DAO.FarmerDAO"%>
<%@page import="com.cropcart.dto.Farmer"%>
<%@page import="com.cropcart.DAO.ProductDAOImp"%>
<%@page import="com.cropcart.DAO.ProductDAO"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmer Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Chart.js for Graphs -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            background-color: #F4F6F9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
           
        }

        .card {
            border-radius: 0px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border : 2px solid #008000;
        }

        .card-body {
            padding: 1rem;
        }

        .card-header {
            background-color: #008000;
            color: white;
        }

        .graph-container {
            margin-top: 3rem;
            text-align: center;
        }

        .container {
            max-width: 1130px;
            margin: 0 auto;
            padding: 2rem;
        }

        h4, h5 {
            font-size: 1.2rem; /* Adjust size as needed */
        }

        .product-list {
            margin-top: 2rem;
        }

        .product-card {
            margin-bottom: 1rem;
        }

        .product-card h5 {
            font-size: 1.25rem;
        }

        .update-link {
            margin-top: 5px;
            text-align: center;
            color: white;
        }

        /* Improved link hover effect */
        .update-link a {
            font-size: 1.1rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }

        .update-link a:hover {
            color: red !important; /* Ensure hover color applies */
            text-decoration: underline;
        }

        /* Table styling for product listing */
        table {
            width: 100%;
            margin-top: 20px;
        }

        table th, table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #f8f9fa;
        }

        /* Farmer Details Layout */
        .farmer-details h5 {
            margin-bottom: 1rem;
        }

        .farmer-details .col-md-6 {
            margin-bottom: 1rem;
        }
    </style>
</head>

<body>
    <%@ include file="header.jsp"%>
	<%
	Farmer f = (Farmer) session.getAttribute("farmer");
	FarmerDAO fdao = new FarmerDAOImp();
	f = fdao.getFarmer(f.getFarmer_id());
	ProductDAO pdao1=new ProductDAOImp();
	List<ProductDetails>p4=pdao1.getProducts(f.getFarmer_id());
	OrderDAO odao=new OrdersDAOIpml();
	List<Orders>ol=odao.getAllorders(f.getFarmer_id());
	%>
	<div class="container">
        <!-- Farmer Details Card -->
        <div class="card mb-4">
            <div class="card-header" style="display : flex; justify-content : space-between;">
                <h4>Your Details</h4>
                
            </div>
            <div class="card-body">
                
                <!-- Farmer Profile Information -->
                <div class="row farmer-details">
                    <div class="col-md-6">
                        <h5><strong>Name:</strong> <%=f.getName() %></h5>
                        <h5><strong>Email:</strong> <%=f.getEmail() %></h5>
                        <h5><strong>Phone:</strong> <%=f.getPhone() %></h5>
                        <h5><strong>Address:</strong><%=f.getAddress() %></h5>
                        <h5><strong>City:</strong><%=f.getCity() %></h5>
                    </div>
                    <div class="col-md-6">
                         <h5><strong>State:</strong> <%=f.getState() %></h5>
                        <h5><strong>Pincode:</strong><%=f.getPincode() %></h5>
                        <h5><strong>Bank Name:</strong><%=f.getBank_name() %></h5>
                        <h5><strong>Branch:</strong><%=f.getBranch() %></h5>
                        <h5><strong>Account Number:</strong><%=f.getAcc_no() %></h5>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product List and Graph Side by Side -->
        <div class="row">
            <!-- Product List Column -->
            <div class="col-md-6">
                <div class="card product-list">
                    <div class="card-header" style="display : flex; justify-content : space-between;">
                        <h4>Products Added</h4>
                        <a href="ViewProductsByFID.jsp" class="update-link">View All</a>
                    </div>
                    <div class="card-body">
                        <% 
                            ProductDetails p = new ProductDetails();
                            ProductDAO pdao = new ProductDAOImp();
                            List<ProductDetails> products = pdao.getProducts(f.getFarmer_id()); 
                            
                        %>
                        <!-- Table displaying Product ID, Category, and Status -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Category</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    // Loop through the products and display their details
                                    for(ProductDetails product : products) {
                                %>
                                <tr>
                                    <td><%= product.getProduct_id()%></td>
                                    <td><%= product.getCategoty() %></td>
                                    <td><%= product.getStatus() %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Graph Column -->
            <div class="col-md-6 graph-container">
                <h4>Product Upload vs Purchases</h4>
                <canvas id="productGraph" width="400" height="200"></canvas>
            </div>
        </div>

    </div>

    <script>
        // Chart.js code for the graph
        const ctx = document.getElementById('productGraph').getContext('2d');
        const productGraph = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Uploaded Products', 'Bought Products'],
                datasets: [{
                    label: 'Product Statistics',
                    data: [3, 2], // Sample data (3 uploaded, 2 bought)
                    backgroundColor: ['#007bff', '#28a745'],
                    borderColor: ['#007bff', '#28a745'],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <%@ include file="footer.jsp"%> 
</body>

</html>
