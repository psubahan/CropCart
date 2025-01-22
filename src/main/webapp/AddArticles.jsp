<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Article Submission</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #008000;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input, select, textarea {
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
            width : 100%;
            transition: all 0.3s ease-in-out;
        }
        
        .button:hover {
            transform: scale(1.02); /* Slightly enlarges the button */
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container" style="margin-top : 50px;">
        <h2>Add New Article</h2>
        <form action="AddArticles" method="post">
            <div class="form-group">
                <label for="articleType">Article Type</label>
                <select id="articleType" name="articleType" required>
                   <option value="">Select Article Type</option>
                    <option value="Articles">Articles</option>
                    <option value="News">News</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" id="title" name="title" placeholder="Enter title" required>
            </div>
            <div class="form-group">
                <label for="publishDate">Publish Date</label>
                <input type="date" id="publishDate" name="publishDate" required>
            </div>
            <div class="form-group">
                <label for="titleDescription">Description</label>
                <textarea id="titleDescription" name="titleDescription" rows="3" placeholder="Enter description" required></textarea>
            </div>
            <div class="form-group">
                <label for="articleImage">Article Image</label>
                <input type="text" id="articleImage" name="articleImage" placeholder="Enter image URL or path" required>
            </div>
            <button type="submit" class="btn button">Add Article</button>
        </form>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
