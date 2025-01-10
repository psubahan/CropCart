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
        }

        button {
            background-color: #2c7a7b;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            margin: 20px auto;
        }

        button:hover {
            background-color: #285e5e;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Farmer Icon centered above the title -->
        <img src="https://th.bing.com/th/id/OIP.-HGkHfieZckwIjguc5_mkQHaHa?w=204&h=204&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt="Farmer Icon" class="icon"> <!-- Replace with your farmer icon path -->
        
        <h1>FARMER REGISTRATION</h1>
        <form action="/submit_registration" method="POST">
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
            <button type="submit">Click here to Register</button>
        </form>
    </div>
</body>
</html>
