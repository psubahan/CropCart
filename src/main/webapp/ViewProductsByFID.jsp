<%@ page import="java.util.List" %>
<%@ page import="com.cropcart.dto.ProductDetails" %>
<%@ page import="com.cropcart.DAO.ProductDAOImp" %>
<%@ page import="com.cropcart.DAO.ProductDAO" %>
<%@ page import="com.cropcart.dto.Farmer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmer Products</title>
    <%@ include file="header.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h4 {
            text-align: center;
            margin-bottom: 20px;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin: 50px auto;
            max-width: 1300px;
        }
        .card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 310px;
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }
        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .card-body {
            padding: 15px;
        }
        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin: 10px 0;
        }
        .card-details {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 10px;
        }
        .card-price {
            font-size: 1rem;
            font-weight: bold;
            color: #4CAF50;
            margin-bottom: 10px;
        }
        .card-status {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            font-size: 0.9rem;
            display: inline-block;
        }
        .card-status.unavailable {
            background-color: red;
        }
    </style>
</head>
<body>
    <%
        // Retrieve Farmer object from session
        Farmer f = (Farmer) session.getAttribute("farmer");

        if (f != null) {
            ProductDAO pdao = new ProductDAOImp();
            List<ProductDetails> productList = pdao.getProducts(f.getFarmer_id());

            if (productList != null && !productList.isEmpty()) {
    %>
        <!--<h4>Farmer Name: <%= f.getName() %></h4>-->
        <div class="card-container">
            <%
                for (ProductDetails pd : productList) {
            %>
                <div class="card">
					    <a href="EditProductDetails.jsp?product_id=<%= pd.getProduct_id() %>">
					        <img alt="Image of <%= pd.getTitle() %>" src="<%= pd.getImage() %>" />
					    </a>
					    <div class="card-body">
					        <div class="card-title"><%= pd.getTitle() %></div>
					        <div class="card-details">Category: <%= pd.getCategoty() %></div>
					        <div class="card-details">Quantity: <%= pd.getQuantity() %> <%= pd.getQuantity_type() %></div>
					        <div class="card-price">₹<%= pd.getPrice() %> / Kg</div>
					        <div class="card-status <%= pd.getStatus().equalsIgnoreCase("Unavailable") ? "unavailable" : "" %>">
					            <%= pd.getStatus() %>
					        </div>
					    </div>
					</div>

            <%
                }
            %>
        </div>
    <%
            } else {
    %>
        <h4 style="text-align: center; color: red;">No products found for this farmer.</h4>
    <%
            }
        } else {
            // Redirect to home page if Farmer is not found in session
            response.sendRedirect("homePage.jsp");
        }
    %>
    <%@ include file="footer.jsp" %>
</body>
</html>
