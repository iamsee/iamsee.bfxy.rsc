package com.iamsee.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.iamsee.bean.Menu;
import com.iamsee.tools.DBConn;


public class MenuDao {
	
	DBConn dbconn = new DBConn();
	
	public ArrayList<Menu> getMenuList(String sql) throws Exception
	{
		ArrayList<Menu> menulist = null;
		if(sql != null && !sql.equals(""))
		{
			
			dbconn.getRs(sql);
			
			if(dbconn.rs !=null)
			{
				
				menulist = new ArrayList<Menu>();
				while(dbconn.rs.next())
				{
					Menu menu = new Menu();
					
					menu.setId(dbconn.rs.getInt("id"));
					menu.setMenuname(dbconn.rs.getString("menuname"));
					menu.setMenusign(dbconn.rs.getInt("menusign"));
					
					menulist.add(menu);
				}
			}
			
			
		}
		return menulist;
	}

	
	public Menu getmenu(String sql)
	{
		Menu menu = null;
		if(sql != null && !sql.equals(""))
		{
			
			dbconn.getRs(sql);
			
			if(dbconn.rs !=null)
			{
				
				
				try {
					while(dbconn.rs.next())
					{
						 menu = new Menu();
						
						menu.setId(dbconn.rs.getInt("id"));
						menu.setMenuname(dbconn.rs.getString("menuname"));
						menu.setMenusign(dbconn.rs.getInt("menusign"));
						
					
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
	}
		return menu;
	}
}
