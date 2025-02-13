package com.cropcart.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cropcart.DAO.CustomerDAO;
import com.cropcart.DAO.CustomerDAOImp;
import com.cropcart.dto.Customer;

/**
 * Servlet implementation class doPayment
 */

@WebServlet("/doPayment2")
public class doPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doPayment() {
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
		
		int account_number = Integer.parseInt(request.getParameter("customerAccNo"));
		
		CustomerDAO cdao = new CustomerDAOImp();
		Customer c = cdao.getCustomerByAccountNumber(account_number);
		
				if(c!=null) {
					
					request.setAttribute("success","Payment Successfull!");
					RequestDispatcher rd = request.getRequestDispatcher("doPayment.jsp");
					rd.forward(request, response);
					
			   }
				else {
					request.setAttribute("failure","Payment Failed! Please Enter Valid Account Number");
					RequestDispatcher rd = request.getRequestDispatcher("doPayment.jsp");
					rd.forward(request, response);
				}
	}


}