package com.iamsee.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.iamsee.bean.Department;
import com.iamsee.bean.Docs;
import com.iamsee.tools.DBConn;

public class DepartmentDao {

	DBConn dbconn = new DBConn();

	public int confirmlogin(String username, String password) {

		String sql = "select * from t_department where username='"+username+"'" ;
		ArrayList departmentlist = null;
		Department  department = null;
		
		int judge = 0;
		if (sql != null && !sql.equals("")) {
			dbconn.getRs(sql);
			if (dbconn.rs != null) {
				departmentlist = new ArrayList<Docs>();

				try {
					while(dbconn.rs.next())
					{
						department = new Department();
						department.setId(dbconn.rs.getInt("id"));
						
						department.setUsername(dbconn.rs.getString("username"));
						department.setPassword(dbconn.rs.getString("password"));
						department.setName(dbconn.rs.getString("name"));
						
						System.out.println(department.getId());
						System.out.println(department.getName());
						System.out.println(department.getUsername());
						System.out.println(department.getPassword());
						
						departmentlist.add(department);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(departmentlist.size()==0)
						{
					judge=0;
						}
				else if(departmentlist.size()==1)
				{
					System.out.println(departmentlist.size());
					department = new Department();
					department = (Department) departmentlist.get(0);
					if(department.getPassword().equals(password))
					{
						judge = 1;
					}
					else
					{
						judge = 2;
					}
				}
				else if(departmentlist.size()>1)
				{
					judge = 3;
				}
				
						
				}
		}
			return judge;

	}
	public boolean changepwd(String username, String password) {
		dbconn.getStm();
		int i = 0;
		boolean bl = false;
		String sql = "update t_department set password='"+password+"'  where username='"	+ username + "'";
			
			try {
				i = dbconn.stm.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			

			if (i>0) {
				bl = true;
				
			} else {
				bl = false;
				
			}
		
		dbconn.closed();
		return bl;

	}
}
