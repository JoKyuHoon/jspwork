package ch08;

import java.sql.*;

public class MemberDao {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public boolean checkId(String id) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from member where id=?"; // 사용자가 입력한 id와 pwd를 가져오는데 그 중에 id만
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();  // id 와 pwd 가 맞으면 true, 다르면 false 반환 (boolean)
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
		
	}
	
	public boolean insertMember(Member mbean) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)"; // 사용자가 입력한 id와 pwd를 가져오는데 그 중에 id만
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPwd());
			pstmt.setString(3, mbean.getName());
			pstmt.setString(4, mbean.getGender());
			pstmt.setString(5, mbean.getBirthday());
			pstmt.setString(6, mbean.getEmail());
			pstmt.setString(7, mbean.getZipcode());
			pstmt.setString(8, mbean.getAddress());
			pstmt.setString(9, mbean.getDetailaddress());
			pstmt.setString(10, String.join(" ", mbean.getHobby()));			
			pstmt.setString(11, mbean.getJob());
			//pstmt.executeUpdate();   // 반환값 : 업데이트 성공시 1, 아닐시 0
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
		
	}
	
}
