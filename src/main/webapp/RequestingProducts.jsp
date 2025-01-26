<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.cropcart.DAO.CartDAOImpl"%>
<%@page import="com.cropcart.DAO.CartDAO"%>
<%@page import="com.cropcart.dto.Cart"%>
<%@page import="com.cropcart.dto.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Requesting Products</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        color: #2e7d32;
        background-color: #f5f9f6;
        margin: 0;
        padding: 0;
    }

    .container {
        padding: 20px;
        margin: 40px auto;
        max-width: 77%;
        background-color: #ffffff;
        border-radius: 2px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .h2 {
        color: #008000;
        text-align: center;
        margin:10px;
    }

    

    .btn {
    display: inline-block;
    text-decoration: none; /* Ensures no underline for <a> */
    background-color: #008000;
    color: white;
    padding: 9px 24px; /* Make sure padding is same as the "Back to Cart" button */
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #388e3c;
}

.btn i {
    margin-right: 5px;
}


    .btn i {
        margin-right: 5px;
    }

    .total-cost {
        margin-top: 20px;
        font-size: 20px;
        font-weight: bold;
        text-align: right;
        color: #2e7d32;
    }

    .request-button {
        text-align: center;
        margin-top: 20px;
        display : flex;
        justify-content: space-between;
    }
    
    .request-button a{
        text-align: center;
        margin-top: 20px;
        padding : 9px 24px;
    }

    .input-group {
        margin-top: 20px;
    }

    .input-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #2e7d32;
    }

    .input-group input,
.input-group select,
.input-group textarea {
    width: 100%;  /* Ensure all fields take full available width */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    box-sizing: border-box;  /* Include padding and border in width */
}


    .input-group textarea {
        resize: vertical;
    }
    
    .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 15px;
            border: 1px solid #e0e0e0;
            margin-top : 10px;
            background-color: #f5f9f6;
            
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
        
        
</style>
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="container">
        <% Customer c = (Customer) session.getAttribute("customer"); %>
        <% if (c != null) { %>
            <h2 class="h2">REQUEST YOUR PRODUCT</h2>
            <form action="RequestServlet" method="post">
                <h3 style="text-align : center;">Customer: <%= c.getName() %></h3>
                <div class="containers">
                    <% 
                            int totalCost = 0;
                            CartDAO cdao = new CartDAOImpl();
                            List<Cart> cartItems = cdao.getCartInfo(c.getCustomer_id());
                            Iterator<Cart> itr = cartItems.iterator();
                            while (itr.hasNext()) {
                                Cart cartItem = itr.next();
                                int itemTotalCost = Integer.parseInt(cartItem.getProduct_Cost()) * Integer.parseInt(cartItem.getQuantity());
                                totalCost += itemTotalCost;
                        %>
							<div class="cart-item">
					            <div class="item-details">
					                <img src="<%= cartItem.getProduct_Image() %>" alt="Product Image">
					                <div class="item-info">
					                    <h2 style="color : black;"><%= cartItem.getProduct_Title() %></h2>
					                    <p><%=cartItem.getProduct_Category()%></p>
					                </div>
					            </div>
					
								<div class="item-info">
					                    <h2  style="color : black;">Quantity</h2>
					                    <span><%= cartItem.getQuantity() %></span>
					            </div>
					            
					            <div class="item-info">
					                    <h2 style="color : black;">Cost</h2>
					                    <span>₹<%= itemTotalCost %></span>
					           </div>
					           <input type="hidden" value="<%=cartItem.getCart_Id()%>">
			               </div>
			               <input type="hidden" name="farmerid" value="<%= cartItem.getFarmer_Id() %>">
                        <input type="hidden" name="customerid" value="<%= c.getCustomer_id() %>">
                        <input type="hidden" name="customerName" value="<%= c.getName() %>">
                        <input type="hidden" name="cartId" value="<%= cartItem.getCart_Id() %>">
                        <input type="hidden" name="productImage" value="<%= cartItem.getProduct_Image() %>">
                        <input type="hidden" name="ProductName" value="<%= cartItem.getProduct_Title() %>"> 
			            <%} %>
			     </div>         
       
                <div class="total-cost">Total: &#8377;<%= totalCost %></div>
                
                <!-- Input Fields for Payment Mode, Address, State, and City -->
                <div class="input-group">
                    <label for="paymentMode">Payment Mode</label>
                    <select name="paymentMode" id="paymentMode" required>
                        <option value="">--Select Payment Mode--</option>
                        <option value="Cash on Delivery">Cash on Delivery</option>
                        <option value="Online Payment">Online Payment</option>
                    </select>
                </div>

                <div class="input-group">
                    <label for="deliveryAddress">Delivery Address</label>
                    <textarea name="deliveryAddress" id="deliveryAddress" rows="4" placeholder="Enter your delivery address" required></textarea>
                </div>

                <div class="input-group">
                    <label for="state">State</label>
                    <input type="text" name="state" id="state" placeholder="Enter your state" required>
                </div>

                <div class="input-group">
                    <label for="city">City</label>
                    <input type="text" name="city" id="city" placeholder="Enter your city" required>
                </div>

                <div class="request-button">
				    <a href="Cart.jsp" class="btn">Back to Cart</a>
				    <button type="submit" class="btn">
				        <i class="fas fa-paper-plane"></i> Place Request
				    </button>
				</div>

            </form>
        <% } else { %>
            <%RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
            	rd.forward(request, response);
            %>
        <% } %>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>