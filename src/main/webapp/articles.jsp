<%@page import="com.cropcart.DAO.ArticlesDAOImp"%>
<%@page import="com.cropcart.DAO.ArticlesDAO"%>
<%@page import="com.cropcart.dto.Articles"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList, java.util.Iterator" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CropCart-News And Articles</title>
    <style>
        body {
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    width: 300px;
    padding: 15px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Add transition for transform and shadow */
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 350px;
}

.card:hover {
    transform: translateY(-5px) scale(1.02); /* Slightly lift and enlarge the card */
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Add a deeper shadow */
}


.card img {
    max-width: 100%;
    height: 200px; /* Set a consistent height for all images */
    object-fit: cover; /* Ensures the image is cropped to fit without distortion */
    border-radius: 5px;
    margin-bottom: 10px;
    animation: fadeIn 1s ease-in-out;
}

.card h4 {
    font-size: 16px;
    color: #333;
    margin: 5px 0 10px;
}

.card p {
    font-size: 14px;
    color: #777;
    margin-bottom: 10px; 
}

 .card .button {
    background-color: #008000; 
    color: #fff;
    border: none;
    border-radius: 3px;
    padding: 10px 15px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s ease, transform 0.3s ease; /* Add transition for background color */
    text-align: center;
}

.card .button:hover {
    background-color: #005700; /* Change background color on hover */
    
}




        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            from {
                transform: translateY(20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp"%>
    <div class="container" style="margin: 50px 0px;">
        <%
            Articles a = new Articles();
            ArticlesDAO adao = new ArticlesDAOImp();
            
            ArrayList<Articles> articles = adao.getArticles();
            Iterator<Articles> iterator = articles.iterator();
            
            while (iterator.hasNext()) {
                a = iterator.next();
                int id = a.getArticle_id();
                String title = a.getTitle();
                String publishDate = a.getPublish_Date();
                String description = a.getDescription();
                String imageUrl = a.getArticle_image();
        %>
            <div class="card">
                <%
                    if (imageUrl != null && !imageUrl.isEmpty()) {
                %>
                    <img src="<%= imageUrl %>" alt="Image">
                <%
                    }
                %>
                <h4 ><%= title %></h4>
                <p>Published on - <%= publishDate %></p>
                <a href="readMore.jsp?id=<%=id%>" class="button">Read More..</a>
            </div>
        <%
            }
        %>
    </div>
    <%@ include file="footer.jsp"%>
</body>
</html>
