package com.cropcart.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.cropcart.DAO.AdminDAO;
import com.cropcart.DAO.AdminDAOImp;
import com.cropcart.DAO.CustomerDAO;
import com.cropcart.DAO.CustomerDAOImp;
import com.cropcart.DAO.FarmerDAO;
import com.cropcart.DAO.FarmerDAOImp;
import com.cropcart.dto.Admin;
import com.cropcart.dto.Customer;
import com.cropcart.dto.Farmer;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		HttpSession session=request.getSession();
		if(request.getParameter("Admin")!=null)
		{

			String mail=request.getParameter("email");
			String password=request.getParameter("password");
			
			Admin a=new Admin();
			AdminDAO adao=new AdminDAOImp();
			a=adao.getAdmin(mail, password);
			if(a!=null)
			{
				session.setAttribute("Admin", a);
				RequestDispatcher rd=request.getRequestDispatcher("adminDashboard.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
				rd.forward(request, response);
			}
		}
		
		else if(request.getParameter("customer")!=null)
		{
			String mail=request.getParameter("mail");
			String password=request.getParameter("password");
			
			Customer c=new Customer();
			CustomerDAO cdao=new CustomerDAOImp();
			c=cdao.getCustomer(mail, password);
			if(c!=null)
			{
				session.setAttribute("customer", c);
				RequestDispatcher rd=request.getRequestDispatcher("#");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
				rd.forward(request, response);
			}
		}
		else if(request.getParameter("farmer")!=null)
		{
			String mail=request.getParameter("mail");
			String password=request.getParameter("password");
			
			Farmer f= new Farmer();
			FarmerDAO fdao=new FarmerDAOImp();
			f=fdao.getCustomer(mail, password);
			if(f!=null)
			{
				session.setAttribute("farmer", f);
				RequestDispatcher rd=request.getRequestDispatcher("#");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
				rd.forward(request, response);
			}
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
			rd.forward(request, response);
		}

	}

}
