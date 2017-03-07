package board;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

public class commentDAO2 {
	private Connection getConnection() throws Exception{
		//DB삼총사 객체
		Connection con = null;
		
		//1. 웹서버와 연결된 DBApp웹프로젝트의 모든 정보를 가지고 있는 컨텍스트 객체 생성
		Context init = new InitialContext();
		
		//2. 연결된 웹서버에서 DataSource(커넥션풀) 검색해서 가져오기
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		//3. 커넥션풀에서 DB연동객체 가져오기
		con = ds.getConnection();	//DB연결
		
		return con;
	}
	
	
	//게시판 글 작성 메소드(주글)
	public int insertComment(commentBean comBean, int BoardNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		int no = 0;	//글번호 저장
		int write = 0;	//입력되면 1
		
		try {
			//디비연결
			con = getConnection();			
			sql = "SELECT max(no) FROM p_comment ";	//가장 큰 글번호 가져오기			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				no = rs.getInt(1) + 1;	//글이 있을 경우 최대값+1
			} else {
				no = 1;	//글이 없을 경우 1
			}
			
			//insert
			sql = "INSERT INTO p_comment (no, boardNum, user_id, user_name, ip, comment, reg_date, comm_group, comm_seq, comm_lev)"
					+ " VALUES(?, ?, ?, ?, ?, ?, now(), ?, 0, 0)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setInt(2, BoardNum);
			pstmt.setString(3, comBean.getUser_id());
			pstmt.setString(4, comBean.getUser_name());
			pstmt.setString(5, comBean.getIp());
			pstmt.setString(6, comBean.getComment());
			pstmt.setInt(7, no);	//no 주글번호 기준 == comm_group그룹번호
			
			pstmt.executeUpdate();
			write = 1;
			
		} catch (Exception e) {
			System.out.println("insertComment에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return write;
	}
	
	
	//게시판 전체글개수 반환(리턴)하는 메소드
	public int getCommCount(int boardNum){
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			//1,2 DB연결
			con = getConnection();
			//3 sql 전체 글갯수 가져오기
			sql = "SELECT count(*) FROM p_comment WHERE boardNum = "+boardNum;
			pstmt = con.prepareStatement(sql);
			//4. rs=select한 결과 값
			rs = pstmt.executeQuery();
			//5. rs 데이터 있으면 count저장
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		return count;	//전체 글 갯수 반환
	}
	
	
	//글 목록 가져오기 메소드
	//getBoardList(첫번째로 보여질 시작글번호, 한 페이지당 보여줄 글 개수)를 전달받아
	//글정보(commentBean)객체 하나하나를 ArrayList에 담아 getBoardList메소드를 호출한 곳으로
	//BoardBean객체들을 저장하고 있는 ArrayList를 리턴한다.
	public List<commentBean> getCommentList(int startRow, int pageSize, int boardNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		List<commentBean> comList = new ArrayList<commentBean>();
		
		try {
			//1,2 디비연결
			con = getConnection();
			//3 sql작성
			//정렬 re_ref내림차순, re_seq오름차순
			//limit 각 페이지 마다 맨 위에 첫번째로 보여질 시작 글 번호, 한페이지당 보여줄 글 개수
			sql = "SELECT * FROM p_comment WHERE boardNum = ? ORDER BY comm_group ASC, comm_seq DESC LIMIT ?, ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				commentBean comBean = new commentBean();
				comBean.setNo(rs.getInt("no"));
				comBean.setBoardNum(boardNum);
				comBean.setUser_id(rs.getString("user_id"));
				comBean.setUser_name(rs.getString("user_name"));
				comBean.setIp(rs.getString("ip"));
				comBean.setComment(rs.getString("comment"));
				comBean.setReg_date(rs.getTimestamp("reg_date"));
				comBean.setComm_group(rs.getInt("comm_group"));
				comBean.setComm_seq(rs.getInt("comm_seq"));
				comBean.setComm_lev(rs.getInt("comm_lev"));
				
				comList.add(comBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		
		return comList;	//ArrayList리턴
	}
	
	
	
	/* 게시판 글 번호를 넘겨받아 DB로부터 검색하여 가져온 글 하나(commentBean객체) 리턴 */
	public commentBean getComment(int boardNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		commentBean commbean = null;
		
		try {
			//1,2. 디비연결
			con = getConnection();
			//3. sql작성
			sql = "SELECT * FROM p_comment WHERE boardNum = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			
			//4. 쿼리실행
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				commbean = new commentBean();
				commbean.setNo(rs.getInt("no"));
				commbean.setBoardNum(boardNum);
				commbean.setUser_id(rs.getString("user_id"));
				commbean.setUser_name(rs.getString("user_name"));
				commbean.setReg_date(rs.getTimestamp("reg_date"));
				commbean.setComment(rs.getString("comment"));
				commbean.setIp(rs.getString("ip"));
				commbean.setComm_lev(rs.getInt("comm_lev"));
				commbean.setComm_group(rs.getInt("comm_group"));
				commbean.setComm_seq(rs.getInt("comm_seq"));
			}
			
		} catch (Exception e) {
			System.out.println("getComment에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return commbean;
	}
	
	
	/* 삭제할 글번호와 삭제할 글의 패스워드를 전달받아 글삭제하는 메소드 */
	public int delComment(int no, String user_id, int boardNum){
		int check = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			//sql문작성: num에 해당하는 passwd가져오기
			sql = "SELECT user_id, boardNum FROM p_comment  WHERE no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if (user_id.equals(rs.getString("user_id")) && boardNum == rs.getInt("boardNum")) {
					check = 1;
					//sql = num에 해당하는 글 삭제
					sql = "DELETE FROM p_comment WHERE no =?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.executeUpdate();
				} else {	//비밀번호 틀리면 check = 0
					check = 0;
				}
			}
			
			
		} catch (Exception e) {
			System.out.println("delComment에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return check;	//비밀번호 일치 유무리턴. 1 또는 0
	}
	
	
	/* 수정할 DTO객체를 전달받아 DB에 있는 패스워드와 일치하면 글을 수정한다. */
	public int updateComment(commentBean comBean, String user_id){
		int check = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			sql = "SELECT user_id FROM p_comment WHERE no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comBean.getNo());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if (user_id.equals(rs.getString("user_id"))) {
					sql = "UPDATE p_comment SET comment=? WHERE no = ?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, comBean.getComment());
					pstmt.setInt(2, comBean.getNo());
					
					pstmt.executeUpdate();
					
					check = 1;
				} else {	
					check = 0;
				}
			}
			
		} catch (Exception e) {
			System.out.println("updateComment에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return check;
	}
	
	
	/*
	 ** 답변달기 필드 설명  **
	 * re_ref(group) 부모글과 그로부터 파생된 자식글(답변)들이 같은 값을 가지기 위한 필드
	 * re_seq(seq) 같은 group글 내에서의 순서
	 * re_lev(level) 같은 group내에서의 깊이(들여쓰기 레벨)
	 * 
	 ** 답변달기 규칙 설명  **
	 * 순서1) group(re_ref)같은 부모글의 그룹번호(re_ref)를 사용한다.
	 * 순서2) seq(re_seq)값은 부모글의 seq(re_seq)에서 +1 증가 한 값을 사용한다.
	 * 순서3) level(re_lev)값은 부모글의 re_lev에서 +1 증가 한 값을 사용한다.
	 * 
	 ** 답변달기 메소드  **
	 * 부모글의 group(re_ref), seq(re_seq), level(re_lev)값+답변글 내용 또한 지니고 있는 BoardBean객체를 전달 받아 처리함
	 */
	public int reInsertComment(commentBean comBean){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int update = 0;
		
		String sql= "";
		int no = 0;	//답글번호
		
		try {
			con = getConnection();
			
			/* 답변글 글번호 구하기 */
			//기존글 중 num이 가장 큰 글번호 가져오기
			sql = "SELECT max(no) FROM p_comment ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {	//글번호가 있으면
				//답변글번호 = 글번호 + 1
				no = rs.getInt(1)+1;
			} else {
				//답변을 달 글번호를 1로 지정
				no = 1;
			}
			
//			/* re_seq답글순서 재배치 */
//			//부모글 그룹과 같은 그룹이면서 부모글의 seq값보다 큰 답변글들은 seq값을 1증가시킨다.
//			sql = "UPDATE p_comment  SET re_seq = re_seq+1, repCnt = repCnt+1 WHERE re_group=? AND re_seq > ?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, dto.getRe_group());
//			pstmt.setInt(2, dto.getRe_seq());
//			
//			pstmt.executeUpdate();
			
			/* 답변글 달기 */
			//insert	//re_seq+1, re_lev+1 답글달기
			sql = "INSERT INTO p_comment (no, boardNum, user_id, user_name, ip, comment, reg_date, comm_group, comm_seq, comm_lev)"
					+ " VALUES(?, ?, ?, ?, ?, ?, now(), ?, 0, 0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setInt(2, comBean.getBoardNum());
			pstmt.setString(3, comBean.getUser_id());
			pstmt.setString(4, comBean.getUser_name());
			pstmt.setString(5, comBean.getIp());
			pstmt.setString(6, comBean.getComment());
			pstmt.setInt(7, no);	//no 주글번호 기준 == comm_group그룹번호
			
			pstmt.executeUpdate();
			update = 1;
			
		} catch (Exception e) {
			System.out.println("reInsertComment에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return update;
	}
	
}
