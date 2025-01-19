package com.cropcart.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import com.cropcart.DAO.ArticlesDAO;
import com.cropcart.DAO.ArticlesDAOImp;
import com.cropcart.dto.Articles;

/**
 * Servlet implementation class EditArticle
 */

@WebServlet("/editArticle")
public class EditArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Articles a = new Articles();
        ArticlesDAO adao = new ArticlesDAOImp();
        
        int id = Integer.parseInt(request.getParameter("article_id"));
        //String type = request.getParameter("articleType");
       // String date = request.getParameter("publishDate");
        String descp = request.getParameter("description");
        String title = request.getParameter("title");
        String image = request.getParameter("articleImage");
    	
		a.setArticle_id(id);
        //a.setArticle_type(type);
        //a.setPublish_Date(date);
        a.setDescription(descp);
        a.setTitle(title);
        a.setArticle_image(image);
       
        
        if(a!=null) {
        	boolean res = adao.updateArticle(a);
        	if(res) {
        		request.setAttribute("isUpdated", "Article Updated Successfully!");
        		RequestDispatcher rd = request.getRequestDispatcher("articlesList.jsp");
        		rd.forward(request, response);
        	}
        	else {
        		request.setAttribute("notUpdated", "Article Updation Failed!");
        		RequestDispatcher rd = request.getRequestDispatcher("articleList.jsp");
        		rd.forward(request, response);
        	}
        }
	

}
}
