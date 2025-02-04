<%@page import="com.cropcart.dto.Farmer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 77%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 3px;
            box-shadow: 0 0 5px #008000;
            
        }

        h2 {
            text-align: center;
            color: #008000;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group input:focus {
            border-color: #008000;
            box-shadow: 0 0 15px rgba(0, 128, 0, 0.4);
            outline: none;
        }
        
        .form-group select:focus {
            border-color: #008000;
            box-shadow: 0 0 15px rgba(0, 128, 0, 0.4);
            outline: none;
        }
        
        .form-group textarea:focus {
            border-color: #008000;
            box-shadow: 0 0 15px rgba(0, 128, 0, 0.4);
            outline: none;
        }
        
        

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .button {
            background-color: #008000;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            margin: 20px auto;
            width: 100%;
            
        }

        
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <%Farmer f = (Farmer)session.getAttribute("farmer");%>
    
    <div class="container" style="margin-top : 50px;">
        <h2>ADD NEW PRODUCT</h2>
        <%if(request.getAttribute("message")!=null){ %>
         <h2 style= " margin:10px; color : blue; text-align : center;"><%=request.getAttribute("message")%></h2>
         <%} %>
          
        <form action="AddProduct" method="post">
            <div class="form-group">
                <label for="category">Category</label>
                <select id="category" name="category" required>
                    <option value="">Select Category</option>
                    <option value="Fruits">Fruits</option>
                    <option value="Vegetables">Vegetables</option>
                    <option value="Grains">Grains</option>
                    <option value="Dairy">Dairy</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" id="title" name="title" placeholder="Enter product title" required>
            </div>
            <div class="form-group">
                <label for="image">Image</label>
                <input type="text" id="image" name="image" placeholder="Enter image URL or path" required>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" id="quantity" name="quantity" placeholder="Enter quantity" required>
            </div>
            <div class="form-group">
                <label for="quantityType">Quantity Type</label>
                <select id="quantityType" name="quantityType" required>
                    <option value="">Select Quantity Type</option>
                    <option value="Kg">Kg</option>
                    <option value="Liters">Liters</option>
                    <option value="Units">Units</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" rows="3" placeholder="Enter product description" required></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" id="price" name="price" placeholder="Enter price" required>
            </div>
            <div class="form-group">
                <label for="status">Status</label>
                <select id="status" name="status" required>
                    <option value="">Select Status</option>
                    <option value="Available">Available</option>
                    <option value="Out of Stock">Out of Stock</option>
                </select>
            </div>
            <input type="hidden" value=<%=f.getFarmer_id()%> name="farmerid">
            <button type="submit" class="btn button">Add Product</button>
        </form>
    </div>
   
    <jsp:include page="footer.jsp" />
</body>
</html>
