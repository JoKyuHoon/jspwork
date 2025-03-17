package ajax01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
			sql = "select id from member where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean checkId(String id) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean insertMember(Member mbean) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
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
			
			if(pstmt.executeUpdate() == 1)  // executeUpdate() : update가 잘 되었으면 1반환, 안됐으면 0반환
				flag = true;	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	// id에 해당하는 데이터 얻어오기(1행)
	
	public Member getMember(String id) {
	    Member bean = new Member();
	    try {
	    	sql = "SELECT * FROM member WHERE id = ?";  // id에 해당하는 데이터를 가져오는 SELECT 문
	    	con = pool.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, id);  // SQL에서 id 값을 바인딩
	        rs = pstmt.executeQuery();  // 결과 실행
	        
	        if (rs.next()) {  // 결과가 있으면
	        	bean = new Member();
	        	bean.setId(rs.getString("id"));  // id
	        	bean.setName(rs.getString("name"));  // name
	        	bean.setGender(rs.getString("gender"));  // gender
	        	bean.setEmail(rs.getString("email"));  // gender
	        
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 
	    return bean;  // Member 객체 반환
	}

	
	
	// 전체 member 데이터 가져오기
	public ArrayList<Member> getAllMember() {
	    ArrayList<Member> alist = new ArrayList<Member>();  // 결과를 저장할 ArrayList 생성
	    try {
	        sql = "SELECT * FROM member";  // 모든 데이터를 가져오는 SQL 쿼리
	        con = pool.getConnection();
	        pstmt = con.prepareStatement(sql);  // 쿼리 준비
	        rs = pstmt.executeQuery();  // 쿼리 실행
	        
	        while (rs.next()) {  // 결과가 있을 때마다 반복
	            Member bean = new Member();  // 새로운 Member 객체 생성
	            bean.setId(rs.getString("id"));  // id 값 설정
	            bean.setName(rs.getString("name"));  // name 값 설정
	            bean.setGender(rs.getString("gender"));  // gender 값 설정
	            bean.setEmail(rs.getString("email"));  // email 값 설정
	            // 필요한 다른 필드들도 추가적으로 설정 가능
	            alist.add(bean);  // Member 객체를 리스트에 추가
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 자원 해제
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return alist;  // 결과로 ArrayList 반환
	}

	
	
	
}
