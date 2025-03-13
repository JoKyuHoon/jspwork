package ch09_vote;

import java.sql.*;

// DB 연결 (항상 비슷하게 쓰는거 같음)
public class VoteDao {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	// 설문 등록하기
	public boolean voteInsert(VoteList vlist, VoteItem vitem) {
	    boolean flag = false; // 성공 여부 저장 변수

	    try {
	        // 1. DB 연결
	        con = pool.getConnection();
	        
	        // 2. votelist 테이블에 설문 추가
	        sql = "insert into votelist values(seq_vote.nextval,?,?,?,sysdate,?,default)";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, vlist.getQuestion());
	        pstmt.setString(2, vlist.getSdate());
	        pstmt.setString(3, vlist.getEdate());
	        pstmt.setInt(4, vlist.getType());
	        int result = pstmt.executeUpdate(); // 실행

	        int lastResult = 0;
	        if (result == 1) { // votelist 테이블에 성공적으로 삽입되었다면
	            // 3. voteitem 테이블에 항목 추가
	            sql = "insert into voteitem values(seq_vote.currval, ?,?,default)";
	            pstmt = con.prepareStatement(sql);
	            String[] item = vitem.getItem();
	            for (int i = 0; i < item.length; i++) {
	                if (item[i] == null || item[i].equals("")) break;
	                pstmt.setInt(1, i);
	                pstmt.setString(2, item[i]);
	                lastResult = pstmt.executeUpdate(); // 실행
	            }
	        }

	        // 4. 성공 여부 확인
	        if (lastResult == 1) flag = true;

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 5. DB 연결 해제
	        pool.freeConnection(con, pstmt, rs);
	    }

	    return flag; // 성공하면 true, 실패하면 false 반환
	}
}
