<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmer Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        

        h1 {
            text-align: center;
            color: #2c7a7b;
            margin-bottom: 20px;
        }

        .icon {
            display: block;
            margin: 0 auto 20px; /* Centers the icon and adds space below it */
            width: 70px; /* Adjust size */
            height: auto;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, select {
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
        }

    </style>
</head>
<body>
    <%@ include file="header.jsp"%>
    <%
    String userRegister = request.getParameter("userRegister");
    %> 
    <%if ("Farmer".equalsIgnoreCase(userRegister)) { %>
    <div class="container" style="margin-top : 50px;">
        <div class="image-section">
            <div class="title" style="font-size:20px; font-weight : bold; text-align : center; margin : 15px; color : #008000;">FARMER REGISTRATION</div>
        </div>

        <form action="farmerRegistration" method="POST">
            <div class="form-group">
                <label for="name">Name</label> <!-- Removed the asterisk -->
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label> <!-- Removed the asterisk -->
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label> <!-- Removed the asterisk -->
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirm Password</label> <!-- Removed the asterisk -->
                <input type="password" id="confirm-password" name="confirm-password" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label> <!-- Removed the asterisk -->
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="state">State</label> <!-- Removed the asterisk -->
                <input type="text" id="state" name="state" required>
            </div>
            <div class="form-group">
                <label for="city">City</label> <!-- Removed the asterisk -->
                <input type="text" id="city" name="city" required>
            </div>
            <div class="form-group">
                <label for="pincode">Pincode</label> <!-- Removed the asterisk -->
                <input type="number" id="pincode" name="pincode" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile Number</label> <!-- Removed the asterisk -->
                <input type="tel" id="mobile" name="mobile" required>
            </div>
            <div class="form-group">
                <label for="customer-type">Customer Type</label> <!-- Removed the asterisk -->
                <select id="customer-type" name="customer-type" required>
                    <option value="">Select</option>
                    <option value="farmer">Farmer</option>
                    <option value="buyer">Buyer</option>
                </select>
            </div>
            <div class="form-group">
                <label for="bank-name">Bank Name</label> <!-- Removed the asterisk -->
                <input type="text" id="bank-name" name="bank-name">
            </div>
            <div class="form-group">
                <label for="branch">Branch</label> <!-- Removed the asterisk -->
                <input type="text" id="branch" name="branch">
            </div>
            <div class="form-group">
                <label for="ifsc">IFSC</label> <!-- Removed the asterisk -->
                <input type="text" id="ifsc" name="ifsc">
            </div>
            <div class="form-group">
                <label for="account-number">Account Number</label> <!-- Removed the asterisk -->
                <input type="text" id="account-number" name="account-number">
            </div>
            <input type="submit" class = "btn button" value="Click here to Register">
        </form>
    </div>
    <%} 
    
    else if ("Customer".equalsIgnoreCase(userRegister)) { %>
    <div class="container" style="margin-top : 50px;">
        <div class="image-section">
            <div class="title" style="font-size:20px; font-weight : bold; text-align : center; margin : 15px; color : #008000;">CUSTOMER REGISTRATION</div>
        </div>
        <form action="customerRegistration" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <div class="form-group">
                <label for="contactNumber">Contact Number:</label>
                <input type="text" id="contactNumber" name="contactNumber" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="state">State:</label>
                <select id="state" name="state" required>
                    <option value="">Select</option>
                    <option value="Andhra Pradesh">Andhra Pradesh</option>
                    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                    <option value="Assam">Assam</option>
                    <option value="Bihar">Bihar</option>
                    <option value="Chhattisgarh">Chhattisgarh</option>
                    <option value="Goa">Goa</option>
                    <option value="Gujarat">Gujarat</option>
                    <option value="Haryana">Haryana</option>
                    <option value="Himachal Pradesh">Himachal Pradesh</option>
                    <option value="Jharkhand">Jharkhand</option>
                    <option value="Karnataka">Karnataka</option>
                    <option value="Kerala">Kerala</option>
                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                    <option value="Maharashtra">Maharashtra</option>
                    <option value="Manipur">Manipur</option>
                    <option value="Meghalaya">Meghalaya</option>
                    <option value="Mizoram">Mizoram</option>
                    <option value="Nagaland">Nagaland</option>
                    <option value="Odisha">Odisha</option>
                    <option value="Punjab">Punjab</option>
                    <option value="Rajasthan">Rajasthan</option>
                    <option value="Sikkim">Sikkim</option>
                    <option value="Tamil Nadu">Tamil Nadu</option>
                    <option value="Telangana">Telangana</option>
                    <option value="Tripura">Tripura</option>
                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                    <option value="Uttarakhand">Uttarakhand</option>
                    <option value="West Bengal">West Bengal</option>
                    <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                    <option value="Chandigarh">Chandigarh</option>
                    <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                    <option value="Ladakh">Ladakh</option>
                    <option value="Lakshadweep">Lakshadweep</option>
                    <option value="Puducherry">Puducherry</option>
                </select>
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" required>
            </div>
            <div class="form-group">
                <label for="pincode">Pincode:</label>
                <input type="text" id="pincode" name="pincode" required>
            </div>

            <div class="form-group">
                <label for="customerType">Customer Type:</label>
                <select id="customerType" name="customerType" required>
                    <option value="">Select</option>
                    <option value="Farmer">WholeSale</option>
                    <option value="Retailer">Retailer</option>
                </select>
            </div>
            <input type="submit" class="btn button" value="Click Here to Register">
        </form>
    </div>
    <%} %>
    <%@ include file="footer.jsp"%>
</body>
</html>
