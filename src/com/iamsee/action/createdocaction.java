package com.iamsee.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iamsee.bean.Docs;
import com.iamsee.dao.DocsDao;

public class createdocaction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public createdocaction() {
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
			request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Docs docs = new Docs();
		int menuId =  Integer.parseInt( request.getParameter("condition"));
		String title = request.getParameter("title");
		String content =request.getParameter("content") ;
		int DepartmentId = 1;
		
		 docs.setMenuId(menuId);
		 docs.setTitle(title);
		 docs.setContent(content);
		 docs.setDepartmentId(DepartmentId);
		 String backmsgcreatedoc;
		 
		 DocsDao dd = new DocsDao();
		 boolean blcreatedoc =false;
		 
		 
		 blcreatedoc = dd.addDoc(docs);
		 
		 if(blcreatedoc)
		 {
			backmsgcreatedoc= "创建文档成功"; 
			session.setAttribute("blcreatedoc", blcreatedoc);
			
		 }
		 else
		 {
			 blcreatedoc = false;
			 backmsgcreatedoc= "创建文档失败"; 
		 }
		 
		 String adminmainpage = "createdocstate.jsp";
		 session.setAttribute("adminmainpage", adminmainpage);
		 session.setAttribute("backmsgcreatedoc", backmsgcreatedoc);
		 
		System.out.println(backmsgcreatedoc);
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
