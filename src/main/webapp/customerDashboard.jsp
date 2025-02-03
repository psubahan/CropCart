<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cropcart.dto.Customer" %>
<%@ page import="com.cropcart.dto.ProductDetails" %>
<%@ page import="com.cropcart.DAO.ProductDAOImp" %>
<%@ page import="com.cropcart.DAO.ProductDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Customer Dashboard</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
 <!-- Chart.js for Graph -->
 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <style>
     body {
         background-color: #F4F6F9;
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
     }

     .card {
         border-radius: 0px;
         box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
         border : 0.5px solid #008000;
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

     table th, table td {
         text-align: center;
         vertical-align: middle;
     }

     table {
         width: 100%;
         background-color: white;
         border-radius: 8px;
         box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
     }

     table th {
         background-color: #007bff;
         color: white;
     }

     .footer {
         background-color: #007bff;
         color: white;
         text-align: center;
         padding: 15px 0;
         font-size: 1rem;
     }

     .container {
         max-width: 1130px;
         margin: 0 auto;
         padding: 2rem;
     }

     .product-card {
         margin-bottom: 1rem;
     }

     .product-card h4,h5 {
         font-size: 1.2rem;
     }

     .update-link {
         margin-top: 5px;
         text-align: center;
         color: white;
     }

     .update-link a {
         font-size: 1.1rem;
         font-weight: bold;
         color: white;
         text-decoration: none;
     }

    /* .update-link a:hover {
         color: red ;
         text-decoration: underline;
     } */
 </style>
</head>
<body>
 <jsp:include page="header.jsp" />

 <div class="container">
     <!-- Customer Details Card -->
     <div class="card mb-4">
         <div class="card-header" style="display : flex; justify-content : space-between;">
                <h4>Your Details</h4>
            
            </div>
         <div class="card-body">
             <% Customer c = (Customer) session.getAttribute("customer"); %>
             <div class="row">
                 <div class="col-md-6">
                     <h5><strong>Name:</strong> <%= c.getName() %></h5>
                     <h5><strong>Email:</strong> <%= c.getMail() %></h5>
                     <h5><strong>Phone:</strong> <%= c.getPhone() %></h5>
                     <h5><strong>Address:</strong> <%= c.getAddress() %></h5>
                     <h5><strong>City:</strong> <%= c.getCity() %></h5>
                 </div>
                 <div class="col-md-6">
                     <h5><strong>State:</strong> <%= c.getState() %></h5>
                     <h5><strong>Pincode:</strong> <%= c.getPincode() %></h5>
                     <h5><strong>Customer Type:</strong> <%= c.getCustomer_type() %></h5>
                 </div>
             </div>
         </div>
     </div>

     <!-- Products Bought and Graph -->
     <div class="row">
         <!-- Product List Column -->
         <div class="col-md-6">
             <div class="card mb-4">
    <div class="card-header" style="display: flex; justify-content: space-between;">
        <h4>Products Bought</h4>
        <a href="CustomerProductsBought.jsp" class="update-link">View All</a>
    </div>
    <div class="card-body">
        <%
            Customer customer = (Customer) session.getAttribute("customer");
            if (customer != null) {
                int customerId = customer.getCustomer_id(); // Use correct getter method

                ProductDAO pdao = new ProductDAOImp();
                List<ProductDetails> purchasedProducts = pdao.getPurchasedProducts(customerId);
        %>
        <!-- Table displaying purchased products -->
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (purchasedProducts != null && !purchasedProducts.isEmpty()) {
                        for (ProductDetails product : purchasedProducts) {
                %>
                <tr>
                    <td><%= product.getProduct_id() %></td>
                    <td><%= product.getTitle() %></td>
                    <td><%= product.getCategoty() %></td>
                    <td><%= product.getQuantity() %> <%= product.getQuantity_type() %></td>
                    <td>₹<%= product.getPrice() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">No products purchased yet.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <p>Please log in to view purchased products.</p>
        <%
            }
        %>
    </div>
</div>
             
         </div>

         <!-- Graph Column -->
         <div class="col-md-6 graph-container">
             <h4>Products Bought by Category</h4>
             <canvas id="productGraph" width="400" height="200"></canvas>
         </div>
     </div>
 </div>

 <jsp:include page="footer.jsp" />

 <script>
     // Chart.js for displaying product statistics
     const ctx = document.getElementById('productGraph').getContext('2d');
     const productGraph = new Chart(ctx, {
         type: 'bar',
         data: {
             labels: ['Category 1', 'Category 2', 'Category 3'], // Categories to be dynamically fetched
             datasets: [{
                 label: 'Products Bought',
                 data: [5, 3, 2], // Number of products bought per category (This data should be dynamically calculated)
                 backgroundColor: ['#007bff', '#28a745', '#ff5733'],
                 borderColor: ['#007bff', '#28a745', '#ff5733'],
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

</body>
</html>
