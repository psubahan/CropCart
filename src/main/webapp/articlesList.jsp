<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cropcart.DAO.ArticlesDAOImp"%>
<%@page import="com.cropcart.DAO.ArticlesDAO"%>
<%@page import="com.cropcart.dto.Articles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        table.articles {
            width: 90%;
            max-width: 1050px;
            border-collapse: collapse;
            margin: 50px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        table.articles thead tr {
            background: linear-gradient(145deg, #008000, #66ff66);
            color: black;
            text-align: left;
            font-size: 16px;
        }

        table.articles th, table.articles td {
            padding: 15px 20px;
            text-align: left;
        }

        table.articles tbody tr {
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s ease;
        }

        table.articles tbody tr:hover {
            background-color: #f1f9f1; /* Light green hover */
        }

        table.articles tbody tr:last-child {
            border-bottom: none;
        }

        table.articles td {
            color: #333;
            font-size: 14px;
        }

        table.articles th {
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }

        table.articles tbody tr:nth-child(even) {
            background-color: #f9f9f9; /* Alternating row colors */
        }

        table.articles tbody tr:nth-child(odd) {
            background-color: #ffffff;
        }

        .button {
            background: linear-gradient(145deg, #008000, #66ff66); /* Matching green gradient */
            border: none;
            color: black;
            padding: 5px 18px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .button:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .button:active {
            transform: scale(1);
            box-shadow: none;
        }
        
        .success{
            text-align : center;
            color : #008000;
            margin-top : 40px;
        }
        
        .failure{
            text-align : center;
            color : red;
            margin-top : 40px;
        }
    </style>
    <script>
        // Function to hide success or failure message after 5 seconds
        function hideMessage() {
            setTimeout(function() {
                const successMessage = document.querySelector('.success');
                const failureMessage = document.querySelector('.failure');
                if (successMessage) successMessage.style.display = 'none';
                if (failureMessage) failureMessage.style.display = 'none';
            }, 5000);
        }

        // Call the function when the page loads
        window.onload = hideMessage;
    </script>
</head>
<body>
     <%@ include file="header.jsp"%>
     
     <% if(request.getAttribute("isUpdated") != null) { %>
        <h3 class="success"><%= request.getAttribute("isUpdated") %></h3>
     <% } %>
     
     <% if(request.getAttribute("notUpdated") != null) { %>
        <h3 class="failure"><%= request.getAttribute("notUpdated") %></h3>
     <% } %>
    
    <table class="articles">
        <thead>
            <tr>
                <th>Article ID</th>
                <th>Title</th>
                <th>Type</th>
                <th>Publish Date</th> 
                <th>Edit</th>
            </tr>
        </thead>
        <tbody>
        <% Articles a = new Articles();
          ArticlesDAO adao = new ArticlesDAOImp();
          ArrayList<Articles> al = adao.getArticles();
          Iterator<Articles> itr = al.iterator();
          while(itr.hasNext()){
              a = itr.next();
              int id = a.getArticle_id();
        %>
            <tr>
                <td><%=id%></td>
                <td><%=a.getTitle() %></td>
                <td><%=a.getArticle_type() %></td>
                <td><%=a.getPublish_Date() %></td>
                <td><a href = "editArticles.jsp?id=<%=id%>" class="button">Edit</a></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    
    <%@ include file="footer.jsp"%>
</body>
</html>
