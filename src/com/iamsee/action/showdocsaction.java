package com.iamsee.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iamsee.bean.Docs;
import com.iamsee.dao.DocsDao;

public class showdocsaction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public showdocsaction() {
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
		

		ArrayList<Docs> docslist = new ArrayList<Docs>();
		DocsDao dd = new DocsDao();
		int menuId =  Integer.parseInt( request.getParameter("condition"));
		session.setAttribute("menuId", menuId);
		System.out.println(menuId);
		String sql = "select * from t_docs where menuid="+menuId;
		
		
		
			docslist = dd.getDocsList(sql);
	
			
		
		
		session.setAttribute("docslist", docslist);
		System.out.println(docslist.size());

		String power = "master";
		session.setAttribute("power", power);
		request.getRequestDispatcher("dopageaction").forward(request, response);		
		
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
