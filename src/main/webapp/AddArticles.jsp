<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article Submission</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #d4edda;">
	 <jsp:include page="header.jsp" />
    <div class="container mt-5">
        <h2 class="text-center mb-4" style="background-color: #28a745; color: white; padding: 10px; border-radius: 5px;">Add New Article</h2>
        <form action="AddArticles" method="post" enctype="multipart/form-data" class="p-4 border rounded" style="background-color: #f8f9fa;">
            <!-- Article Type -->
            <div class="mb-3">
                <label for="articleType" class="form-label">Article Type</label>
                <select class="form-select" id="articleType" name="articleType">
                    <option>Select Article Type</option>
                    <option>Articles</option>
                    <option>News</option>
                </select>
            </div>
            <!-- Title -->
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="Enter title" required>
            </div>
            <!-- Publish Date -->
            <div class="mb-3">
                <label for="publishDate" class="form-label">Publish Date</label>
                <input type="date" class="form-control" id="publishDate" name="publishDate" required>
            </div>
            <!-- Title Description -->
            <div class="mb-3">
                <label for="titleDescription" class="form-label">Title Description</label>
                <textarea class="form-control" id="titleDescription" name="titleDescription" rows="3" placeholder="Enter description" required></textarea>
            </div>
            <!-- Article Image -->
            <div class="mb-3">
                <label for="articleImage" class="form-label">Article Image</label>
                <input type="text" class="form-control" id="articleImage" name="articleImage" required>
            </div>
            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit" class="btn btn-success">Add Article</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
     <jsp:include page="footer.jsp" />
</body>
</html>
