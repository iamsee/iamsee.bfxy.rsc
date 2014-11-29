package com.iamsee.tools;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class DBConn {
	private String className;

	private String url;

	private String username;

	private String password;

	private Connection con;

	public Statement stm;

	public ResultSet rs;
	
	public static void main(String args[])
	{
		
		DBConn dbconn = new DBConn();
		dbconn.loadDrive();
		dbconn.getCon();
		dbconn.getStm();
		dbconn.getRs("select * from t_menu");
		if(dbconn.rs==null)
		{
			System.out.println("rs获取失败");
		}
		else
		{
			try {
				while(dbconn.rs.next())
				{
					System.out.print(dbconn.rs.getInt("id"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

	public DBConn() {
		className = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://blog.iamsee.com:3306/iamsee.bfxy.rsc";
		username = "root";
		password = "zhuotong";
	}

	
	
	

	public void loadDrive() {
		try {
			Class.forName(className);
			System.out.println("loaddriver ok");
		} catch (ClassNotFoundException e) {
			System.out.println("loaddriver err");
			e.printStackTrace();
		}
	}

	
	public void getCon() {
		loadDrive();
		try {
			con = DriverManager.getConnection(url, username, password);
			System.out.println("getcon ok");
		} catch (Exception e) {
			System.out.println("getcon err");
			e.printStackTrace();
		}
	}

	
	public Statement getStm() {
		getCon();
		try {
			stm = con.createStatement();
			System.out.println("获取Stm成功");
		} catch (Exception e) {
			System.out.println("获取Stm失败");
			e.printStackTrace();
		}
		return stm;
	}

	
	public void getRs(String sql) {
		getStm();

		try {
			rs = stm.executeQuery(sql);
			System.out.println("执行sql成功");
			
			
			

		} catch (Exception e) {
			System.out.println("执行sql失败");
			e.printStackTrace();
		}
	}




	public int update(String sql) {
		int i = -1;
		if (sql != null && !sql.equals("")) {
			getStm();
			try {
				i = stm.executeUpdate(sql);
				System.out.println("更新数据成功");
			} catch (Exception e) {
				System.out.println("更新数据失败");
				e.printStackTrace();
			} finally {
				closed();
			}
		}
		return i;
	}

	
	public void closed() {
		try {
			if (rs != null)
				rs.close();
			if (stm != null)
				stm.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			System.out.println("关闭数据连接失败");
			e.printStackTrace();
		}
	}
}