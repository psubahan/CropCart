<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <style>
       * {
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.containers{
    width: 100%;
    margin-top : 30px;
}

.top {
    height: 580px;
}



.nav {
    width: 80%; 
    margin: 10px auto; 
    /* padding: 10px 20px;  */
    display: flex;
    align-items: center;
    justify-content: space-between; 
    background: rgba(255, 255, 255, 0.8); 
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); 
}

.nav h3 {
    margin: 0;
    padding: 10px 20px; 
    background-color: #007BFF; 
    color: white; 
    font-size: 24px;
}


ul {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
}

ul li {
    position: relative; 
    margin: 0 10px;
}

a {
    text-decoration: none;
    color: #333;
    font-size: 16px;
    font-weight: bold;
    transition: color 0.3s;
}

.dropdown {
    position: absolute;
    top: 100%; 
    left: 0;
    display: none; /* Initially hidden */
    background: rgba(255, 255, 255, 0.9);
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    z-index: 10;
    padding: 10px 0;
    min-width: 150px; 
}



.dropdown a {
    display: block;
    padding: 10px 20px;
    color: #333;
    text-decoration: none;
    transition: background-color 0.3s;
}

.dropdown a:hover {
    background-color: #f0f0f0;
}

ul li:hover .dropdown {
    display: block; 
}

ul li a:hover{
    color : #008000;
    cursor: pointer; 
}

#lgbtn {
    background: none; 
    border: none; 
    color: red; 
    font-size: 16px;
    font-weight: bold;
    text-decoration: none; 
    padding: 0; 
    cursor: pointer; 
    transition: color 0.3s;
    margin : 0px 10px;
}

#lgbtn:focus {
    outline: none; 
}

    </style>
</head>
<body>
    <div class="containers">
        <div class="top" id="top">
            <div class="nav">
                <h3 style="background-color: green;">CROP CART</h3>
                
                <%if(session.getAttribute("Admin")!=null){ %>
                <ul>
                    <li><a href="adminDashboard.jsp">HOME</a></li>
                    <li><a href="">FARMER'S MARKET</a></li>
                    <li>
                        <a href="articlesList.jsp">NEWS AND ARTICLES</a>
                        <div class="dropdown">
                            <a href="AddArticles.jsp">ADD ARTICLES</a>
                            <a href="editArticles.jsp">EDIT ARTICLES</a>
                        </div>
                    </li>
                    <li><a href="changePassword.jsp">CHANGE PASSWORD</a></li>
                    <li><a href="">	QUERIES</a></li>
                    <form action="logout" method="post">
                       <input type="submit" name="logout" value="LOGOUT" class="logout" id="lgbtn">
                    </form> 
                </ul>
                <%}else if(session.getAttribute("farmer")!=null){ %>
                <ul>
                    <li><a href="farmerDashboard.jsp">HOME</a></li>
                    <li><a href="addProduct.jsp">ADD PRODUCT</a></li>
                    <li><a href="reuqestedOrders.jsp">ORDERS</a></li>
                    <li><a href="articles.jsp">NEWS & ARTICLES</a></li>
                    <li><a href="editProfile.jsp">EDIT PROFILE</a></li>
                    <li><a href="">CONTACT</a></li>
                    <form action="logout" method="post">
                       <input type="submit" name="logout" value="LOGOUT" class="logout" id="lgbtn">
                    </form>   
                </ul>
                <%}else if(session.getAttribute("customer")!=null){ %>
                <ul>
                    <li><a href="customerDashboard.jsp">HOME</a></li>
                    <li><a href="ViewProductDetails.jsp">VIEW PRODUCTS</a></li>
                    <li><a href="articles.jsp">NEWS & ARTICLES</a></li>
                    <li><a href="editProfile.jsp">EDIT PROFILE</a></li>
                    <li><a href="">CONTACT</a></li>
                    <form action="logout" method="post">
                       <input type="submit" name="logout" value="LOGOUT" class="logout" id="lgbtn">
                    </form> 
                </ul>
                <%}else{ %>
                <ul>
                    <li><a href="homePage.jsp">HOME</a></li>
                    <li><a href="">FARMER'S MARKET</a></li>
                    <li><a href="articles.jsp">NEWS AND ARTICLES</a></li>
                    <li><a href="">CONTACT</a></li>
                </ul>
                <%} %>
    </div>
</body>
</html>