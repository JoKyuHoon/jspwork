package ch06_oracleJDBC;

import java.sql.*;
import java.util.ArrayList;

public class UseBeanDB4 {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "tjoeun";
	private final String PASS = "1234";
	
	public UseBeanDB4() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	 
	// 메서드 : list목록 모두 가져오는 메서드
	public ArrayList<Bean> getList() {
		   ArrayList<Bean> alist = new ArrayList<Bean>();
		
		try {
			Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			Statement st = con.createStatement();
			String query = "select * from location";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Bean bean = new Bean();
//				bean.setDept_id(rs.getString(1));
				bean.setLocal_code(rs.getString("local_code")); // 대소문자 안가림
				bean.setNational_code(rs.getString("national_code"));
				bean.setLocal_name(rs.getString("local_name"));
				alist.add(bean);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return alist;
	}
	
}
