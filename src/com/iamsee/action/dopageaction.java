package com.iamsee.action;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iamsee.bean.Docs;
import com.iamsee.dao.DocsDao;

public class dopageaction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public dopageaction() {
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
		
		String power = (String)session.getAttribute("power");
		DocsDao dd = new DocsDao();
		int menuId =  Integer.parseInt(session.getAttribute("menuId").toString());
				System.out.println(menuId);
		String sql ="select * from t_docs where menuId="+menuId;
		
		docslist =	dd.getDocsList(sql);
		System.out.println(docslist.size());

		String pageNumberStr = request.getParameter("pageNumber");
		int pageNumber = 1;
		if(pageNumberStr!=null && !pageNumberStr.isEmpty())
		{
			pageNumber = Integer.parseInt(pageNumberStr);
		}
		
		int pageSize = 5; //分页大小
		int totalPosts = docslist.size(); //总文章数
		int totalPages = totalPosts/pageSize + ((totalPosts%pageSize)>0?1:0); //计算得出的总页数
		
	
		
		
		
		docslist = dd.getnowdocslist(docslist, pageNumber, pageSize);
		
		System.out.println("docslist:"+ docslist.size());
		session.setAttribute("docslist", docslist);
		session.setAttribute("pageSize", pageSize);
		session.setAttribute("totalPosts", totalPosts);
		session.setAttribute("pageNumber", pageNumber);
		session.setAttribute("totalPages", totalPages);
		
		if(power.equals("master"))
		{
		session.removeAttribute("adminmainpage");
		String adminmainpage = "adminshowdocs.jsp";
		session.setAttribute("adminmainpage", adminmainpage);
		
		response.sendRedirect("../main/login.jsp");
		}
		else 
		{
			session.removeAttribute("mainpage");
			String mainpage = "showdocs.jsp";
			session.setAttribute("mainpage", mainpage);
			
			response.sendRedirect("../main/indexTemp.jsp");
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
