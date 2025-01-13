<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="index.css">
    <title>CropCart</title>
    <style>
        * {
    margin: 0;
    padding: 0;
}

body{
   font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

html {
    scroll-behavior: smooth; 
}

html {
    scroll-behavior: smooth;
    scroll-padding-top: 100px; 
}


body {
    font-family: sans-serif;
}

.containers{
    width: 100%;
}

/* TOP */
.top {
    background-image: url("images/homepageImg.jpg");
    height: 580px;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center -100px;
    display: flex;
    flex-direction: column;
    align-items: center;
    
}



.nav {
    width: 80%; /* Center the nav block horizontally */
    margin: 50px auto; 
    /* padding: 10px 20px;  */
    display: flex;
    align-items: center;
    justify-content: space-between; /* Distribute items (h3 and ul) */
    background: rgba(255, 255, 255, 0.8); /* Semi-transparent background for contrast */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow for elevation */
}

.nav h3 {
    margin: 0;
    padding: 10px 20px; /* Add padding around the text */
    background-color: #007BFF; /* Set the background color */
    color: white; /* Text color for contrast */
    font-size: 24px;
}


ul {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
}

ul li {
    margin: 0 10px; 
}

a {
    text-decoration: none;
    color: #333;
    font-size: 16px;
    font-weight: bold;
    transition: color 0.3s;
}


a:hover {
    color: #008000; 
}

.content {
    text-align: center;
    height: 200px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 70px;
    color: black;
    opacity: 0; /* Initially hidden */
    transform: translateY(30px) scale(0.95); 
    animation: enhancedFadeIn 1s ease-out 1s forwards;
}

@keyframes enhancedFadeIn {
    0% {
        opacity: 0;
        transform: translateY(30px) scale(0.95); /
    }
    50% {
        opacity: 0.5;
        transform:  scale(1); 
    }
    100% {
        opacity: 1;
        transform: translateY(0) scale(1); 
    }
}


/* ============CENTER====================== */
.center {
    display: flex;
    justify-content: space-between; 
    align-items: stretch; /* Ensures both image and content have equal height */
    height: 450px; /* Set the height of the center div */
    gap: 20px; /* Add spacing between the image and content */
    padding: 20px;
    margin-top: 40px;
    
}

.image-container {
    flex: 1; /* Ensures equal width for the image and content */
    overflow: hidden; /* Ensures any cropped parts of the image are hidden */
    
}
        
.image-container img {
    width: 100%; /* Fills the container's width */
    height: 100%; /* Fills the container's height */
    object-fit: cover; /* Ensures the image fills the space while maintaining proportions */
    object-position: top; /* Crops the image from the top */
    animation: fadeIn 4s ease-in-out;
}

@keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

.center-content {
    flex: 1; /* Equal width for content */
    display: flex;
    flex-direction: column; /* Align items vertically */
    justify-content: flex-start; /* Align items at the top */
    align-items: flex-start; /* Align content to the left */
    padding: 20px;
    text-align: justify; /* Aligns the text neatly */
    overflow: hidden; /* Prevents scrolling and hides overflow */
    word-break: break-word; /* Ensures long words break to fit within the container */
}


.center-content h3 {
    margin: 0 0 10px 0; /* Add spacing below the heading */
    font-size: 1.5rem; /* Adjust size of the heading */
    font-weight: bold; /* Make the heading bold */
}

.center-content p {
    font-size: 1rem;
    line-height: 1.6;
}

/* =============DETAILS=============== */
.details {
    display: flex;
    justify-content: space-around;
    gap: 20px; /* Space between items */
    width: 100%; /* Full width container */
    margin: 40px auto; /* Center the container */
    height: 160px;
    background-color: #008000;
    color: white;
    align-items: center;
}

.item {
    display: flex;
    flex-direction: column; /* Stack the number and data vertically */
    align-items: center;
    width: 100%; /* Ensures each item occupies full width */
    max-width: 150px; /* Limit the width of each item */
}

.number {
    font-size: 2.5rem;
    font-weight: bold;
}

.data {
    font-size: 1rem;
    text-align: center;
    margin-top: 10px; /* Space between number and data */
}

/* =======LOGIN============ */
.login {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    gap: 40px; /* Space between the boxes */
    margin: 70px auto;
    width: 80%;
}

.box {
    background-color: #ffffff; /* Clean white background */
    padding: 30px; /* Added padding for better spacing */
    height: 300px; /* Slightly increased height */
    border-radius: 15px; /* Rounded corners */
    width: 30%; /* Keep at 30% width for desktop view */
    text-align: center;
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1); /* Larger shadow for more depth */
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    transition: all 0.3s ease-in-out; /* Smooth transition for the hover effect */
    margin-bottom: 20px; /* Space between boxes */
}

.box:hover {
        transform: scale(1.05); /* Slightly enlarge the button */
    box-shadow: 0 18px 40px rgba(0, 0, 0, 0.2); /* Darker shadow on hover */
}

.box h4 {
    font-size: 1.2rem; /* Slightly larger font for the title */
    font-weight: 600; /* Bold heading */
    color: #333; /* Darker color for better readability */
    margin-bottom: 20px;
}

.box i {
    margin: 20px;
    font-size: 2rem; /* Bigger icon size for emphasis */
    color: #008000; /* Green icon to match the theme */
}

.box a {
    text-decoration: none;
    color: white;
    font-weight: bold;
    border-radius: 8px;
    padding: 15px 25px; /* Larger padding for the button */
    background-color: #008000;
    margin-top: 15px;
    display: inline-block;
    transition: all 0.3s ease; /* Smooth transition */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Button shadow */
}

.box a:hover {
    background-color: #006400; /* Darker green for the hover effect */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15); /* Shadow effect on hover */
}

@media (max-width: 768px) {
    .box {
        width: 100%; /* Full width for smaller screens */
        margin-bottom: 20px; /* Space between boxes */
    }
}

@media (max-width: 480px) {
    .box {
        width: 100%; /* Full width for very small screens */
        padding: 20px; /* Adjust padding for mobile devices */
    }
}


/*=========== BOTTOM ===============*/
.bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    margin-top: 120px;
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
    <div class="containers">
        <div class="top" id="top">
            <div class="nav">
                <h3 style="background-color: green;">CROP CART</h3>
                <ul>
                    <li><a href="#top">HOME</a></li>
                    <li><a href="#center">FARMER'S MARKET</a></li>
                    <li><a href="articles.jsp">NEWS AND ARTICLES</a></li>
                    <li><a href="">MY ACCOUNT</a></li>
                    <li><a href="">CONTACT</a></li>
                </ul>
            </div>
                <div class="content">
                    <h1 style="font-size: 2.7rem;">Crop Cart - From Field to Market, A Greener Future</h1>
                    <h3 style="margin-top: 20px;">Where the wisdom of the land meets the tools of tomorrow for a more sustainable agriculture</h3>
                </div>   
        </div>

        <div id="center" class="center">
            <div class="image-container">
               <img src="images/tomatoes.avif" alt="vegetables">
            </div>
            <div class="center-content">
                <h3>Learn About Us</h3>
                <p>At <b>CropCart</b>, we believe in the power of sustainable agriculture and the connection between farmers, consumers, and the environment. Our mission is to create a platform that bridges the gap between the wisdom of traditional farming and the innovations of modern technology.
                <br>
                <br>
                <b>From Field to Market</b>, A Greener Future is not just our tagline; it represents our commitment to empowering farmers with the tools of tomorrow while preserving the natural beauty and resources of our planet. We aim to revolutionize the way agricultural products reach markets, ensuring fairness, sustainability, and quality at every step.Our platform connects farmers directly with consumers, ensuring that fresh, locally-grown produce is delivered efficiently and at fair prices.
                <br>
                <br>
                We are driven by the belief that sustainable agriculture is the key to a healthier planet, and we are proud to be part of a movement that reimagines the future of farming.Join us in cultivating a greener, more sustainable world, one crop at a time.</p>
            </div>
        </div>

        <div class="details">
            <div class="item">
                <p class="number">1</p>
                <p class="data">Farmers Registered</p>
            </div>
            <div class="item">
                <p class="number">1</p>
                <p class="data">Customers</p>
            </div>
            <div class="item">
                <p class="number">1</p>
                <p class="data">Total Products</p>
            </div>
            <div class="item">
                <p class="number">1</p>
                <p class="data">Articles Published</p>
            </div>
        </div>
        
        <div class="login">
            <div class="box">
                <h4>Farmer</h4>
                <i class="fa-solid fa-user"></i>
                <h4>Login/Register as a Farmer to sell your Produce</h4>
                <a href="login.jsp?userType=Farmer">Click Here</a>
            </div>
            <div class="box">
                <h4>Customer</h4>
                <i class="fa-solid fa-user"></i>
                <h4>Login/Register as a Customer to purchase the Produce</h4>
                <a href="login.jsp?userType=Customer">Click Here</a>
            </div>
            <div class="box">
                <h4>Admin</h4>
                <i class="fa-solid fa-user"></i>
                <h4>Access Restricted to Admin Only</h4>
                <a href="login.jsp?userType=Admin">Click Here</a>
            </div>
        </div>
        
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
        

    </div>
</body>
</html>