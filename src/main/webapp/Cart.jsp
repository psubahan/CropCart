
<%@page import="java.util.Iterator"%>
<%@page import="com.cropcart.dto.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.cropcart.DAO.CartDAOImpl"%>
<%@page import="com.cropcart.DAO.CartDAO"%>
<%@page import="com.cropcart.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f9f6;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 77%;
            margin: 50px auto;
            border : 1px solid white;
            border-radius: 2px;
            padding: 20px;
            
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
           
        }

        h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
            color : #008000;
            border: 1px solid #e0e0e0;
            background-color : white;
            padding : 20px;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 15px;
            border: 1px solid #e0e0e0;
            margin-top : 10px;
            background-color : white;
            
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .item-details {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .item-details img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
        }

        .item-info h2 {
            font-size: 16px;
            margin: 0;
        }

        .item-info p {
            font-size: 14px;
            margin: 5px 0 0;
            color: #666;
        }

        .quantity {
    display: inline-flex;
    flex-direction: row; /* Change from column to row */
    align-items: center; /* Align items horizontally */
    background-color: #008000;
    border-radius: 5px;
    overflow: hidden;
    padding: 2px 0;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
}

.quantity button {
    width: 30px; 
    height: 30px; 
    font-size: 18px;
    background-color: #008000;
    border: none;
    color: white;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background-color 0.2s ease, transform 0.2s ease;
}

.quantity input {
    width: 40px; 
    height: 30px; 
    text-align: center;
    font-size: 14px;
    border: none;
    background-color: white;
    color: black;
    outline: none;
    box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);
    margin: 0 5px; 
    transition: all 0.2s ease;
}

.quantity input:focus {
    box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.2);
}

.quantity button:active {
    transform: scale(0.95);
}


        .price {
            font-size: 16px;
            font-weight: bold;
        }

        .remove {
            color: #ff4d4d;
            font-size: 22px;
            cursor: pointer;
        }

        .remove:hover {
            text-decoration: underline;
        }

        .subtotal {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            border: 1px solid #e0e0e0;
            background-color : white;
            padding : 20px;
        }

        .back-link {
            color: #008000;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
        
        .btn{
           background : none;
           border : none;
        }
    </style>
</head>
<body>

  <%@include file="header.jsp" %>
    <% 
    String message = (String) session.getAttribute("message");
    if (message != null) { 
    %>
    <div style="color: green; text-align: center; margin-bottom: 10px;"><%= message %></div>
    <%
        session.removeAttribute("message");
    } 
    %>
    
    <div class="container">
    <% Customer c = (Customer) session.getAttribute("customer"); %>
        <%if (c != null) { %>
        <h1>YOUR CROP CART</h1>
        <% 
                        int tcost = 0;
                        CartDAO cdao = new CartDAOImpl();
                        List<Cart> ar = cdao.getCartInfo(c.getCustomer_id());
                        Iterator<Cart> itr = ar.iterator();
                        while (itr.hasNext()) {
                            Cart s = itr.next();
                            int itemTotalCost = Integer.parseInt(s.getProduct_Cost()) * Integer.parseInt(s.getQuantity());
                            tcost += itemTotalCost;  
                    %>
        <div class="cart-item">
            <div class="item-details">
                <img src="<%=s.getProduct_Image()%>" alt="Product Image">
                <div class="item-info">
                    <h2><%=s.getProduct_Title()%></h2>
                    <p><%=s.getProduct_Category() %></p>
                </div>
            </div>
            <!--<div class="quantity">
                <button>-</button>
                <input type="text" value="1">
                <button>+</button>
            </div> -->
			
			<div class="item-info">
                    <h2>Quantity</h2>
                    <span><%=s.getQuantity()%></span>
            </div>
            
            <div class="item-info">
                    <h2>Total Cost</h2>
                    <span><%=itemTotalCost%></span>
                </div>
            <!--<span class="price"><%=itemTotalCost%></span>-->
         
            <form action="addToCart" method="post" style="display:inline;">
                <input type="hidden" name="cart_id" value="<%=s.getCart_Id()%>"/>
            	<button type="submit" name="delete" class="btn">
                   <span class="remove">×</span>   
                </button>
            </form>
            
        </div>
        
        
         <% } %>
        <div class="subtotal">
            <a href="ViewProductDetails.jsp" class="back-link">Back to Shop</a>
            <a href="RequestingProducts.jsp" class="back-link">Proceed to Request</a>
            <span>Subtotal: <%=tcost%></span>
        </div>
        <% } else { %>
            <h2>Please log in to view your cart.</h2>
        <% } %>
    </div>
    <% 
        // Clear the session attribute to prevent duplicate additions
        session.removeAttribute("lastAddedProductId"); 
    %>
    <%@include file="footer.jsp" %>
</body>
</html>
