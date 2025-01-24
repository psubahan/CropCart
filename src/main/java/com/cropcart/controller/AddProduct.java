package com.cropcart.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cropcart.DAO.ProductDAO;
import com.cropcart.DAO.ProductDAOImp;
import com.cropcart.dto.ProductDetails;

/**
 * Servlet implementation class AddProduct
 */

public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
	  
		String category = request.getParameter("category");
        String title = request.getParameter("title");
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        String quantityType = request.getParameter("quantityType");
        long price = Long.parseLong(request.getParameter("price"));
        String status = request.getParameter("status");

        
        ProductDetails product = new ProductDetails();
        product.setCategoty(category);
        product.setTitle(title);
        product.setImage(image);
        product.setQuantity(quantity);
        product.setDescription(description);
        product.setQuantity_type(quantityType);
        product.setPrice(price);
        product.setStatus(status);

        
        ProductDAO pdao = new ProductDAOImp();
        boolean isProductAdded = pdao.addProduct(product);

  
        if (isProductAdded) {
        	request.setAttribute("message", "Product added successfully!");
        	RequestDispatcher rd=request.getRequestDispatcher("addProduct.jsp");
			rd.forward(request, response);
        	
        } else {
        	request.setAttribute("message", "Error adding product. Please try again.");
        	RequestDispatcher rd=request.getRequestDispatcher("addProduct.jsp");
			rd.forward(request, response);    
        }
     }
	}


