package com.iamsee.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iamsee.dao.DepartmentDao;

public class loginaction extends HttpServlet {
	
	

	/**
	 * Constructor of the object.
	 */
	public loginaction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		boolean bl = false;

		int judge = 0;
		String backmsg = "";
		
		DepartmentDao dd = new DepartmentDao();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		judge = dd.confirmlogin(username, password);
		
		if(judge==1)
		{
			backmsg= "登陆成功";
			bl = true;
			session.setAttribute("username", username);
			session.setAttribute("bl", bl);
			session.setAttribute("backmsg", backmsg);
			response.sendRedirect("../main/login.jsp");
		}
		else if(judge==2)
		{
			backmsg = "用户名或密码错误！";
			
			session.setAttribute("bl", bl);
			session.setAttribute("backmsg", backmsg);
			response.sendRedirect("../main/login.jsp");
		}
		else if(judge==3)
		{
			bl = false;
			backmsg = "请不要尝试hack！";
			
			session.setAttribute("bl", bl);
			session.setAttribute("backmsg", backmsg);
			response.sendRedirect("../main/login.jsp");
			
		}
		else if(judge == 0)
		{
			bl = false;
			backmsg = "用户名不存在！";
			
			session.setAttribute("bl", bl);
			session.setAttribute("backmsg", backmsg);
			response.sendRedirect("../main/login.jsp");
			
		}
		
		
	}
	

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
