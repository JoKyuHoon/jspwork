package ch06_oracleJDBC;

import java.sql.*;
import java.util.ArrayList;

public class UseBeanDBPool6 {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	public ArrayList<Bean> getList() {
		ArrayList<Bean> alist = new ArrayList<Bean>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from location");
			while(rs.next()) {
				Bean bean = new Bean();
				bean.setLocal_code(rs.getString(1)); // 대소문자 안가림
				bean.setNational_code(rs.getString(2));
				bean.setLocal_name(rs.getString(3));
				alist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}
