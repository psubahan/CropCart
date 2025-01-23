<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Cart</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="container">
        <% if (session.getAttribute("customer") != null) { %>
            <h2>Your Pet's Shopping Cart</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Cost (&#8377;)</th>
                        <th>Quantity</th>
                        <th>Total (&#8377;)</th>
                        <th>Action</th>
                    </tr>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                </thead>
                <tbody>
					
	
	
				</tbody>
				</table>
	<%}else { %>
    <h2>Please log in to view your cart.</h2>
	<% } %>
	}
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>