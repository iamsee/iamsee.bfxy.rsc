package com.iamsee.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iamsee.bean.Menu;
import com.iamsee.dao.DocsDao;
import com.iamsee.dao.MenuDao;
import com.iamsee.tools.DBConn;

public class admindoaction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public admindoaction() {
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
		String menutype = request.getParameter("menutype");
		System.out.println(menutype);
		String adminmainpage ="";
		if(menutype.equals("changepwd"))
		{
			adminmainpage = "changepwd.jsp";
			session.removeAttribute("adminmainpage");
			session.setAttribute("adminmainpage", adminmainpage);
					
		} 
		else if(menutype.equals("createdoc"))
		{
			adminmainpage = "createdoc.jsp";
			session.setAttribute("adminmainpage", adminmainpage);
			DBConn dbconn = new DBConn();
			MenuDao md = new MenuDao();
			DocsDao dd = new DocsDao();
			ArrayList<Menu> menulist = new ArrayList();
			String sql = "select * from t_menu";
			
			try {
				menulist = md.getMenuList(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("menulist 获取不到");
			}
			
			session.setAttribute("menulist", menulist);
			
			
		}
		else if(menutype.equals( "showdocs"))
		{
			ArrayList<Menu> menulist= new ArrayList<Menu>(); 
			adminmainpage = "adminshowmenu.jsp";
			session.setAttribute("adminmainpage", adminmainpage);
			MenuDao md = new MenuDao();
			String sql = "select * from t_menu";
			
			try {
				 menulist = md.getMenuList(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("menulist", menulist);
			
			
			
		}
		boolean backmsgdeldoc = false;
		session.setAttribute("backmsgdeldoc", backmsgdeldoc);
		response.sendRedirect("../main/login.jsp");
		
		
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
