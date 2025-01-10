<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="header.css">
    <title></title>
    <style>
       * {
    margin: 0;
    padding: 0;
}

body {
    font-family: sans-serif;
}

.containers{
    width: 100%;
    margin-top : 50px;
}

/* TOP */
.top {
    height: 580px;
}



.nav {
    width: 80%; /* Center the nav block horizontally */
    margin: 10px auto; 
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
                    <li><a href="">NEWS AND ARTICLES</a></li>
                    <li><a href="">MY ACCOUNT</a></li>
                    <li><a href="">CONTACT</a></li>
                </ul>
    </div>
</body>
</html>