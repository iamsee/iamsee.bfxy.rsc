package com.iamsee.dao;



import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.*;
import com.iamsee.bean.Docs;
import com.iamsee.tools.DBConn;

public class DocsDao {
	DBConn dbconn = new DBConn();

	
	public ArrayList<Docs> getDocsList(String sql)

	{
		ArrayList<Docs> docslist = null;

		if (sql != null && !sql.equals("")) {
			dbconn.getRs(sql);
			if (dbconn.rs != null) {
				docslist = new ArrayList<Docs>();
				try {
					while (dbconn.rs.next()) {
						Docs docs = new Docs();
						docs.setId(dbconn.rs.getInt("id"));
						docs.setMenuId(dbconn.rs.getInt("menuId"));
						docs.setTitle(dbconn.rs.getString("title"));
						docs.setContent(dbconn.rs.getString("content"));
						docs.setDepartmentId(dbconn.rs.getInt("DepartmentId"));
						docs.setTime(dbconn.rs.getDate("time").toString());
						
						System.out.println(dbconn.rs.getInt("id"));
						System.out.println(dbconn.rs.getInt("menuId"));
						System.out.println(dbconn.rs.getString("title"));
						System.out.println(dbconn.rs.getString("content"));
						System.out.println(dbconn.rs.getInt("DepartmentId"));
						
						System.out.println(dbconn.rs.getDate("time").toString());
						
					
					

						docslist.add(docs);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}

		return docslist;
	}

	public ArrayList<Docs> getnowdocslist(ArrayList<Docs> docslist,int pageNum, int pageSize) {
		System.out.println(pageNum+";"+pageSize);
		ArrayList<Docs> ret = new ArrayList<Docs>();
		int start = (pageNum - 1) * pageSize;
		int end = start + pageSize - 1;
		System.out.println(start+"-"+end);
		if (start >= docslist.size())
			return ret;
		
		for (int i = start; i <= end; i++) {
			if (i < docslist.size())
				ret.add(docslist.get(i));
		}
		
		return ret;
	}
	public boolean addDoc(Docs docs)  {

		dbconn.getStm();
		int menuId = docs.getMenuId();
		String title = docs.getTitle();
		String content = docs.getContent();
		int DepartmentId = docs.getDepartmentId();
		String time = "now()";

		boolean bl = false;

		String sql = "insert into t_docs values(null," + docs.getMenuId()+ ",'" + docs.getTitle() + "','" + docs.getContent() + "',"
				+ docs.getDepartmentId() + "," + time + ")";
		
			int i=0;
			try {
				i = dbconn.stm.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(i>0)
			{
				bl = true;
			}
			
			System.out.println(i);
			
		
			
			
	
	
		return bl;
	}

	public boolean changeDoc(Docs docs)
	{
		dbconn.getStm();
		int menuId = docs.getMenuId();
		String title = docs.getTitle();
		String content = docs.getContent();
		int DepartmentId = docs.getDepartmentId();
		

		boolean bl = false;

		String sql = 	"update t_docs set menuId="+docs.getMenuId()+",title='"+docs.getTitle()+"',content='"+docs.getContent()+"',DepartmentId="+docs.getDepartmentId()+" where id="+docs.getId();
		
	
			int i=0;
			try {
				i = dbconn.stm.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(i>0)
			{
				bl = true;
			}
			
			System.out.println(i);
			
		
			
			
	
	
		return bl;
		
	}
	public Docs getdoc(String sql)

	{
		Docs doc = null;

	if (sql != null && !sql.equals("")) {
		dbconn.getRs(sql);
		if (dbconn.rs != null) {
		
			try {
				while (dbconn.rs.next()) {
					 doc = new Docs();
					doc.setId(dbconn.rs.getInt("id"));
					doc.setMenuId(dbconn.rs.getInt("menuId"));
					doc.setTitle(dbconn.rs.getString("title"));
					doc.setContent(dbconn.rs.getString("content"));
					doc.setDepartmentId(dbconn.rs.getInt("DepartmentId"));
					doc.setTime(dbconn.rs.getDate("time").toString());
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	return doc;
}
		

	public int deldoc(String sql)
	{
		int i =0;
		i=dbconn.update(sql);
		return i;
				
	}
}

