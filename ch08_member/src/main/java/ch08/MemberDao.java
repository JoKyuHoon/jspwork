package ch08;

import java.sql.*;

public class MemberDao {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public boolean loginMember(String id, String pwd) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from member where id=? and pwd=?"; // 사용자가 입력한 id와 pwd를 가져오는데 그 중에 id만
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();  // id 와 pwd 가 맞으면 true, 다르면 false 반환 (boolean)
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
		
	}
}
