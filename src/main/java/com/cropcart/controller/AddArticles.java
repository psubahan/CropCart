package com.cropcart.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.cropcart.DAO.ArticlesDAO;
import com.cropcart.DAO.ArticlesDAOImp;
import com.cropcart.dto.Articles;

public class AddArticles extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles POST request from the form submission.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request
        String articleType = request.getParameter("articleType");
        String title = request.getParameter("title");
        String publishDate = request.getParameter("publishDate");
        String titleDescription = request.getParameter("titleDescription");
        String articleImage = request.getParameter("articleImage");
        HttpSession session = request.getSession(false);

        // Validate session (optional, can be removed if session is not required)
        if (session == null) {
            response.sendRedirect("homePage.jsp"); 
            return;
        }

        Articles art = new Articles();
        art.setArticle_type(articleType);
        art.setTitle(title);
        art.setDescription(titleDescription);
        art.setPublish_Date(publishDate);
        art.setArticle_image(articleImage);

        ArticlesDAO adao = new ArticlesDAOImp();
        boolean res = adao.AddArticles(art);

        if (res) {
            request.setAttribute("successMessage", "Article added successfully!");
            RequestDispatcher rd=request.getRequestDispatcher("addArticle.jsp");
            rd.forward(request, response);
        }
        else {
        	request.setAttribute("errorMessage", "Failed to add the article. Please try again.");
            RequestDispatcher rd=request.getRequestDispatcher("addArticle.jsp");
            rd.forward(request, response);
        }
    }
}
