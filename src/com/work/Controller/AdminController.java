package com.work.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.work.Dao.AdminImpl;
import com.work.Model.Admin;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private AdminImpl dao;
    public AdminController() {
        dao = new AdminImpl();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest requestt, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String forward="";
		//list of all users
		requestt.setAttribute("list", dao.getAllAdmins());
		requestt.getRequestDispatcher("Welcome.jsp").include(requestt, response);
		
		String actions = requestt.getParameter("submit");
		String action = requestt.getParameter("action");
		String Id = requestt.getParameter("id");
		//HttpSession sessions;
		//delete
		if(action.equalsIgnoreCase("delete")) {
			forward ="Welcome.jsp";
			dao.DeleteAdmin(Integer.parseInt(Id));
			requestt.setAttribute("list", dao.getAllAdmins());
		}
		
		//update
		else if (action.equalsIgnoreCase("Edit")) {
			
			forward ="Update.jsp";  
			Admin admin = dao.getAdmin(Integer.parseInt(Id));
			requestt.setAttribute("update", admin);
			
		}
		
	/*	else if(actions.equals("logout")) {
			sessions=requestt.getSession(false);
			//sessions.removeAttribute("username");
			sessions.invalidate();
			response.sendRedirect("Login.jsp");
			
		}*/
		
		else {
			forward ="Register.jsp";
		}
	
		RequestDispatcher rd = requestt.getRequestDispatcher(forward);
		rd.forward(requestt, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Admin admin = new Admin();
		HttpSession sessions;
		String actions = request.getParameter("submit");
		if(actions.equals("register")) {
			admin.setFirstName(request.getParameter("FirstName"));
			admin.setLastName(request.getParameter("LastName"));
			admin.setUserName(request.getParameter("UserName"));
			admin.setPassword(request.getParameter("Password"));
			
			
			dao.Register(admin);
			RequestDispatcher rd= request.getRequestDispatcher("Login.jsp");
			if (rd != null) {
				rd.forward(request, response);
			}
		}
		
		else if(actions.equals("logout")) {
			sessions = request.getSession(false);
			 sessions.invalidate();                               
			    request.getRequestDispatcher("Login.jsp").forward(request, response); 
		}
		
		else if(actions.equals("update")) {
			String Id = request.getParameter("AdminId");
			admin.setId(Integer.parseInt(Id));
			admin.setFirstName(request.getParameter("FName"));
			admin.setLastName(request.getParameter("LName"));
			admin.setUserName(request.getParameter("UName"));
			admin.setPassword(request.getParameter("Pwd"));
			//String as = (String)request.getAttribute("admin");
			
			dao.UpdateAdmin(admin);
		}
		
		else if(actions.equals("login")){
			if(dao.Login(request.getParameter("username"), request.getParameter("password"))) {
				
				sessions = request.getSession();
				sessions.setAttribute("username",request.getParameter("username") );
				//request.setAttribute("list", dao.getAllAdmins());
				//request.getRequestDispatcher("Welcome.jsp").forward(request, response);
				
			}
			else {
				PrintWriter out =response.getWriter();
				out.println("Invalid userName or Password");
				request.getRequestDispatcher("Login").include(request, response);
			}
		}
		
		
		
		
		
		doGet(request, response);
		
		}

		
		
	}


