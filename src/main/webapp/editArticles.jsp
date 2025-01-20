<%@page import="com.cropcart.dto.Articles"%>
<%@page import="com.cropcart.DAO.ArticlesDAOImp"%>
<%@page import="com.cropcart.DAO.ArticlesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Article</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .edit-container {
            margin: 0 auto;
            background: white;
            width: 90%;
            max-width: 1000px;
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            margin-top: 60px;
        }

        .edit-container h2 {
            width: 100%;
            text-align: center;
            font-size: 25px;
            color: #008000;
            margin-bottom: 20px;
        }

        .form-left {
            width: 100%;
            max-width: 300px;
            padding: 15px;
            border-right: 1px solid #eee;
        }

        .form-right {
            flex: 1;
            padding: 15px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #333;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #f9f9f9;
        }

        .form-group textarea {
            resize: vertical;
            height: 80px;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #008000;
            box-shadow: 0 0 5px rgba(0, 128, 0, 0.3);
        }

        .form-buttons {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .form-buttons .button {
            background: linear-gradient(145deg, #008000, #66ff66);
            border: none;
            color: black;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.2s;
            text-decoration: none;
        }

        .form-buttons .button:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .form-buttons .button:active {
            transform: scale(1);
            box-shadow: none;
        }

        @media screen and (min-width: 768px) {
            .form-left {
                width: 40%;
                border-right: 1px solid #eee;
            }

            .form-right {
                width: 60%;
            }
        }

        textarea {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
    </style>
</head>
<body>

    <%@ include file="header.jsp"%>
     
    <% if(request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        ArticlesDAO adao = new ArticlesDAOImp();
        Articles a = adao.getArticle(id); %>
        
 <form action="editArticle" method="post">
     <div class="edit-container">
        <h2>EDIT ARTICLE HERE</h2>
        <div class="form-left">
            <div class="form-group">
                <label for="articleId">Article ID</label>
                <input type="text" id="articleId" name="articleId" value="<%= a.getArticle_id() %>" readonly>
            </div>
            <div class="form-group">
                <label for="articleType">Article Type</label>
                <input type="text" id="articleType" name="articleType" value="<%= a.getArticle_type() %>" readonly>
            </div>
            <div class="form-group">
                <label for="publishDate">Publish Date</label>
                <input type="text" id="publishDate" name="publishDate" value="<%= a.getPublish_Date() %>" readonly>
            </div>
        </div>
        <div class="form-right">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" id="title" name="title" value="<%= a.getTitle() %>">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description"><%= a.getDescription() %></textarea>
            </div>
            <div class="form-group">
                <label for="articleImage">Article Image</label>
                <input type="text" id="articleImage" name="articleImage" accept="image/*" value="<%= a.getArticle_image() %>">
            </div>
        </div>
        <div class="form-buttons">
            <input type="hidden" name="article_id" value="<%=a.getArticle_id()%>">
            <input type="submit" class="button" value="Save Changes" style="font-weight : bold;">
            <a href="articlesList.jsp" class="button">Cancel</a>
        </div>
    </div>
    </form>
    <% } %>
    
    <%@ include file="footer.jsp"%> 
</body>
</html>
