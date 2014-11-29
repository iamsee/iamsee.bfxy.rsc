package com.iamsee.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iamsee.bean.*;
import com.iamsee.dao.DocsDao;
import com.iamsee.dao.MenuDao;
import com.iamsee.tools.*;

public class indexTempaction extends HttpServlet {
	
	private  static  ArrayList menulist = new ArrayList();
	private static ArrayList docslist_1 = new ArrayList();
	private static ArrayList docslist_4 = new ArrayList();
	

	/**
	 * Constructor of the object.
	 */
	public indexTempaction() {
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

		doPost(request,response);
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
		
HttpSession session = request.getSession();
		MenuDao md = new MenuDao();
		String sql = "select * from t_menu";
		try {
			menulist = md.getMenuList(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("menulist", menulist);
		
		DocsDao dd = new DocsDao();
		
		
		String sql_1 = "SELECT * FROM t_docs WHERE menuId =1 ORDER BY TIME DESC  LIMIT 0,8 ";
		
		
		
			docslist_1 = dd.getDocsList(sql_1);
	
			
		
		
		session.setAttribute("docslist_1", docslist_1);
		System.out.println(docslist_1.size());
		
		String sql_4 = "SELECT * FROM t_docs WHERE menuId =4 ORDER BY TIME DESC  LIMIT 0,9 ";
		
		
		
		docslist_4 = dd.getDocsList(sql_4);

		
	
	
	session.setAttribute("docslist_4", docslist_4);
	System.out.println(docslist_4.size());
	
	response.sendRedirect("../main/indexTemp.jsp");
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
