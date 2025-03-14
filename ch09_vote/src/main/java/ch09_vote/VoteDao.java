package ch09_vote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
	
	// 설문 목록 가져오기 
	public ArrayList<VoteList> getList() {
		ArrayList<VoteList> alist = new ArrayList<VoteList>();
		
		try {
			con = pool.getConnection();
			sql = "select * from votelist order by num desc";
			Statement st = con.createStatement();
			rs = st.executeQuery(sql);
			
	
			while(rs.next()) {
				VoteList vlist = new VoteList();
				vlist.setNum(rs.getInt("num"));
				vlist.setQuestion(rs.getString("question"));
				vlist.setSdate(rs.getString("sdate"));
				vlist.setEdate(rs.getString("edate"));
				alist.add(vlist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);			
		}
		return alist;
	}
	
	// 질문의 가장 큰 num 가져오기
	public int  getMaxNum() {
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from votelist";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next())
				maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return maxNum;
	}
	
	// 설문폼의 질문과 type 가져오기
	public VoteList getOneVote(int num) {
		VoteList vlist = new VoteList();
		
		try {
			con = pool.getConnection();
			if(num == 0) {
				num = getMaxNum();
			}
			sql = "select * from votelist where num=" + num;
				
				rs = con.createStatement().executeQuery(sql);
				if(rs.next()) {
					vlist.setQuestion(rs.getString("question"));
					vlist.setType(rs.getInt("type"));
					vlist.setActive(rs.getInt("active"));
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return vlist;
	}
	
	// 설문폼의 item 가져오기
	public ArrayList<String> getItem(int num) {
		ArrayList<String> alist = new ArrayList<String>();
			
		try {
			con = pool.getConnection();
			if(num == 0) {
				num = getMaxNum();
			}
			sql = "select item from voteitem where listnum=" + num;
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				String re = rs.getString(1);
				alist.add(re);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	// 투표하기(count 증가)
	public boolean updateCount(int num, String[] itemnum) {  // 0,2,5
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update VoteItem set count = count+1 where listnum=? and itemnum=?";
			pstmt = con.prepareStatement(sql);
			if(num == 0) {
				num = getMaxNum();
			}
				
			int result = 0;
			for(int i=0; i<itemnum.length; i++) {
				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				result = pstmt.executeUpdate();
				}
			if(result == 1) 
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// voteitem에서 count의 합계 가져오기
	public int sumCount(int num) {
		int count = 0;
		
		try {
			con = pool.getConnection();
			sql = "select sum(count) from voteitem where listnum=?";
			pstmt = con.prepareStatement(sql);
			if(num == 0) {
				pstmt.setInt(1, getMaxNum());
			} else {
				pstmt.setInt(1, num);
			}
			rs= pstmt.executeQuery();			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return count;
	}
	
	// voteitem의 각 항목의 count 가져오기
	public ArrayList<VoteItem> getView(int num) {
		ArrayList<VoteItem> alist = new ArrayList<VoteItem>();
		
		try {
			con = pool.getConnection();
			sql = "select item, count from voteitem where listnum=?";
			pstmt = con.prepareStatement(sql);
			
			if(num == 0) {
				pstmt.setInt(1, getMaxNum());
			} else {
				pstmt.setInt(1, num);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				VoteItem vitem = new VoteItem();
				
				String item[] = new String[1];
				item[0] = rs.getString("item");
				
				vitem.setItem(item);
				vitem.setCount(rs.getInt("count"));
				alist.add(vitem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	
	
}
