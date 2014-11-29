package com.iamsee.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iamsee.dao.DepartmentDao;

public class changepwdaction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public changepwdaction() {
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
		
		boolean blchangepwd  = false;
		String backmsgchangepwd = "更改密码失败！";
		
		String username = (String)session.getAttribute("username");
		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		System.out.println(oldpwd+" "+newpwd);
		
		DepartmentDao  dd  =  new DepartmentDao();
		int judge = dd.confirmlogin(username, oldpwd);
		
		if(judge == 1)
		{
			blchangepwd = dd.changepwd(username, newpwd);
		
			if(blchangepwd=true)
			{
				backmsgchangepwd = "更改密码成功！";
			}
			
		}
		else
		{
			backmsgchangepwd = "原密码不正确！";
		}
		session.setAttribute("blchangepwd", blchangepwd);
		session.setAttribute("backmsgchangepwd", backmsgchangepwd);
		String adminmainpage = "changepwdstate.jsp";
		session.removeAttribute("adminmainpage");
		session.setAttribute("adminmainpage", adminmainpage);
		response.sendRedirect("../main/login.jsp");
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
