package com.iamsee.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iamsee.bean.Docs;
import com.iamsee.bean.Menu;
import com.iamsee.dao.DocsDao;
import com.iamsee.dao.MenuDao;

public class dodocsaction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public dodocsaction() {
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
			
			String action = request.getParameter("action");
			String power = request.getParameter("power");
			String url  ="adminshowdocs.jsp";
			String id = request.getParameter("id");
			Docs doc = new Docs();
			DocsDao dd =  new DocsDao();
			
			if(power.equals("master"))
			{
			if(action.equals("changedoc"))
			{
				String sql = "select * from t_docs where id="+id;
				doc = dd.getdoc(sql);
				session.setAttribute("doc", doc);
				url = "changedoc.jsp";
				session.removeAttribute("adminmainpage");
				session.setAttribute("adminmainpage", url);
				response.sendRedirect("../main/login.jsp");
			}
			else if(action.equals("deldoc"))
			{
				String sql = "delete from t_docs where id="+id;
			
				int i = dd.deldoc(sql);
				boolean backmsgdeldoc =false;
				if(i>0)
				{
					backmsgdeldoc=true;
				}
				
				session.setAttribute("backmsgdeldoc", backmsgdeldoc);
				response.sendRedirect("dopageaction");
			}
			else if(action.equals("view"))
			{
				String sql = "select * from t_docs where id="+id;
				doc = dd.getdoc(sql);
				session.setAttribute("doc", doc);
				
				String menuname = "没获取到menuname";
				Menu menu = new Menu();
				
					String sql_menu = "select * from t_menu where id = "+doc.getMenuId();
					MenuDao md = new MenuDao();
					menu =  md.getmenu(sql_menu);
					
					menuname = menu.getMenuname();
				
				url = "../showdodetailedc.jsp";
				
				session.setAttribute("menuname", menuname);
				System.out.println(menuname);
				session.removeAttribute("adminmainpage");
				session.setAttribute("adminmainpage", url);
				response.sendRedirect("../main/login.jsp");
				
			}
			}
			else if(power.equals("normal"))
			{
				 if(action.equals("view"))
					{
						String sql = "select * from t_docs where id="+id;
						doc = dd.getdoc(sql);
						session.setAttribute("doc", doc);
						
						String menuname = "没获取到menuname";
						Menu menu = new Menu();
						
							String sql_menu = "select * from t_menu where id = "+doc.getMenuId();
							MenuDao md = new MenuDao();
							menu =  md.getmenu(sql_menu);
							
							menuname = menu.getMenuname();
						
						url = "showdodetailedc.jsp";
						
						session.setAttribute("menuname", menuname);
						System.out.println(menuname);
						session.removeAttribute("mainpage");
						session.setAttribute("mainpage", url);
						response.sendRedirect("../main/indexTemp.jsp");
						
					}
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
