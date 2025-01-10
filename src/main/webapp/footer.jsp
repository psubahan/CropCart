<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="footer.css">
    <title></title>
    <style>
        .bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    margin-top: 70px;
    background-color: #f9f9f9;
    border-top: 1px solid #ddd;
    flex-wrap: wrap; /* Ensures wrapping on smaller screens */
}

.info, .services, .social-media {
    flex: 1; /* Distribute space equally */
    margin-right: 20px;
}

.social-media {
    text-align: center;
}

.social-icon {
    display: inline-block;
    margin-bottom: 10px;
    color: #008000;
    text-decoration: none;
    font-weight: bold;
    margin: 10px 40px;
}

.social-icon:hover {
    color: #004d00;
}

.services a {
    display: block;
    margin-bottom: 10px;
    color: #008000;
    text-decoration: none;
    font-weight: bold;
}

.services a:hover {
    color: #004d00;
}

.info p {
    margin: 5px 0;
    color: #333;
}

.footer-bottom {
    text-align: center;
    padding: 10px 0;
    background-color: #f1f1f1; /* Slightly darker background */
    font-size: 0.9rem;
    color: #666;
}

.footer-bottom p {
    margin: 0;
}
    </style>
</head>
<body>
    <div class="bottom">
        <div class="info">
            <p>Bangalore, Karnataka</p>
            <p>India</p>
            <p>Phone : +91 7023107456</p>
            <p>Email : CropCart@gmail.com</p>
        </div>
        <div class="services">
            <a href="#top">Home</a>
            <a href="#center">About Us</a>
            <a href="">Articles</a>
            <a href="">Contact</a>
            <a href="">Terms & Conditions</a>
            <a href="">Privacy Policy</a>
        </div>
        <div class="social-media">
            <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i> Facebook</a>
            <a href="#" class="social-icon"><i class="fab fa-twitter"></i> Twitter</a>
            <a href="#" class="social-icon"><i class="fab fa-instagram"></i> Instagram</a>
            <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i> LinkedIn</a>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 CropCart. All rights reserved.</p>
    </div>
    

</body>
</html>