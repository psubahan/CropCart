<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cropcart.DAO.ArticlesDAOImp"%>
<%@page import="com.cropcart.DAO.ArticlesDAO"%>
<%@page import="com.cropcart.dto.Articles"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News and Articles</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            width: 76%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        img {
            display: block;
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin: 40px auto 40px;
        }
        p {
            line-height: 1.6;
            font-size: 16px;
            text-align: justify;
            max-width : 100%;
        }
    </style>
</head>
<body>
     <%@ include file="header.jsp"%>
    <%
		if (request.getParameter("id") != null) {
    	int id = Integer.parseInt(request.getParameter("id"));
   		//System.out.println("Article ID: " + id);  
   	    ArticlesDAO adao = new ArticlesDAOImp();
   	    Articles a = adao.getArticle(id);
    	if (a != null) {
        	String image = a.getArticle_image();
        	String descp = a.getDescription();
        	String title = a.getTitle();
    %>
	<div class="container">
    	<h2><%= title %></h2>
    	<img src="<%= image %>" alt="Image">
    	<p><%= descp %></p>
	</div>
   <% 
    	} else {
        	response.sendRedirect("articles.jsp");
   		}
	  } else {
   			 response.sendRedirect("articles.jsp");
	  }
    %>

     <%@ include file="footer.jsp"%>
</body>
</html>