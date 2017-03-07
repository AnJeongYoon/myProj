package board;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

public class BoardDAO {
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

	
	//게시판 검색 메소드
	public Vector getSearchList(String searchField, String searchText) {
		Vector v = new Vector();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			
			//검색어를 입력하지 않았다면
			if (searchText == null || searchText.isEmpty()) {
				//가장 최신 글이 위로 오게 num필드(글번호)를 기준으로 해서 내림차순 정렬해서 전체 글 목록 검색 
				sql = "SELECT * FROM p_board ORDER BY re_group ASC";
			} else {
				// keyField(검색기준필드)에 앞뒤에 어떤 문자가 와도 상관없이
				// keyWord(검색어)를 가진 데이터를 검색하는데 pos값을 기준으로
				// 하여 전체 글 목록을 가져온다.
				
				// 검색기준 필드에 해당하는 검색어 중 앞 뒤에 어떤 문자가 와도 상관없이 검색어를 한글자라도 가진 글을 검색해서
				// num을 기준으로 전체글목록을 내림차순으로 정렬하여 검색
				sql = "SELECT * FROM p_board WHERE "+searchField+" like '%"+searchText+"%' ORDER BY re_group ASC";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			System.out.println(sql);
			
			while (rs.next()) {
				BoardBean bBean = new BoardBean();
				
				bBean.setNo(rs.getInt("no"));
				bBean.setUser_id(rs.getString("user_id"));
				bBean.setUser_name(rs.getString("user_name"));
				bBean.setIp(rs.getString("ip"));
				bBean.setSubject(rs.getString("subject"));
				bBean.setContent(rs.getString("content"));
				bBean.setFile(rs.getString("file"));
				bBean.setReg_date(rs.getTimestamp("reg_date"));
				bBean.setRe_lev(rs.getInt("re_lev"));
				bBean.setRe_group(rs.getInt("re_group"));
				bBean.setRe_seq(rs.getInt("re_seq"));
				bBean.setReadCnt(rs.getInt("readCnt"));
				bBean.setRepCnt(rs.getInt("repCnt"));
				bBean.setCommCnt(rs.getInt("commCnt"));
				
				v.add(bBean);
			}
			
		} catch (Exception e) {
			System.out.println("getSearchList에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return v;
	}
	
	
	
	
	//게시판 글 작성 메소드(주글)
	public int insertBoard(BoardBean bBean){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		int no = 0;	//글번호 저장
		int write = 0;	//입력되면 1
		
		try {
			//디비연결
			con = getConnection();
			
			sql = "SELECT max(no) FROM p_board";	//가장 큰 글번호 가져오기
			
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			
			if(rs.next()){
				no = rs.getInt(1) + 1;	//글이 있을 경우 최대값+1
			} else {
				no = 1;	//글이 없을 경우 1
			}
			
			//insert
			sql = "INSERT INTO p_board(no, user_id, user_name, ip, subject, content, file, reg_date, readCnt, repCnt, commCnt, re_group, re_seq, re_lev)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, 0, 0, 0, ?, 0, 0)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, bBean.getUser_id());
			pstmt.setString(3, bBean.getUser_name());
			pstmt.setString(4, bBean.getIp());
			pstmt.setString(5, bBean.getSubject());
			pstmt.setString(6, bBean.getContent());
			pstmt.setString(7, bBean.getFile());
			pstmt.setTimestamp(8, bBean.getReg_date());
			pstmt.setInt(9, no);	//no 주글번호 기준 == re_group그룹번호
			
			pstmt.executeUpdate();
			write = 1;
			
		} catch (Exception e) {
			System.out.println("insertBoard에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return write;
	}
	
	
	//게시판 전체글개수 반환(리턴)하는 메소드
	public int getBoardCount(){
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			//1,2 DB연결
			con = getConnection();
			//3 sql 전체 글갯수 가져오기
			sql = "SELECT count(*) FROM p_board";
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
	//글정보(BoardBean)객체 하나하나를 ArrayList에 담아 getBoardList메소드를 호출한 곳으로
	//BoardBean객체들을 저장하고 있는 ArrayList를 리턴한다.
	public List<BoardBean> getBoardList(int startRow, int pageSize){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			//1,2 디비연결
			con = getConnection();
			//3 sql작성
			//정렬 re_ref내림차순, re_seq오름차순
			//limit 각 페이지 마다 맨 위에 첫번째로 보여질 시작 글 번호, 한페이지당 보여줄 글 개수
			sql = "SELECT * FROM p_board ORDER BY re_group DESC, re_seq ASC LIMIT ?, ?";
		//	sql = "SELECT * FROM p_board ORDER BY no DESC LIMIT ?, ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean bBean = new BoardBean();
				bBean.setNo(rs.getInt("no"));
				bBean.setUser_id(rs.getString("user_id"));
				bBean.setUser_name(rs.getString("user_name"));
				bBean.setIp(rs.getString("ip"));
				bBean.setSubject(rs.getString("subject"));
				bBean.setContent(rs.getString("content"));
				bBean.setFile(rs.getString("file"));
				bBean.setReg_date(rs.getTimestamp("reg_date"));
				bBean.setRe_lev(rs.getInt("re_lev"));
				bBean.setRe_group(rs.getInt("re_group"));
				bBean.setRe_seq(rs.getInt("re_seq"));
				bBean.setReadCnt(rs.getInt("readCnt"));
				bBean.setRepCnt(rs.getInt("repCnt"));
				bBean.setCommCnt(rs.getInt("commCnt"));
				
				//BoardBean객체 => ArrayList에 추가
				boardList.add(bBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		
		return boardList;	//ArrayList리턴
	}
	
	
	/* 글 상세보기를 했을 대 게시판 글 번호를 넘겨받아 조회수 증가 시키는 메소드 */
	public void updateReadCount(int no){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			//1,2. 디비연결
			con = getConnection();
			//3. sql작성
			sql = "UPDATE p_board SET readCnt = readCnt +1 WHERE no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			//4. 쿼리실행
			pstmt.executeUpdate();			
			
		} catch (Exception e) {
			System.out.println("updateReadCount에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
	}
	
	/* 게시판 글 번호를 넘겨받아 DB로부터 검색하여 가져온 글 하나(BoardBean객체) 리턴 */
	public BoardBean getBoard(int no){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		BoardBean bbean = null;
		
		try {
			//1,2. 디비연결
			con = getConnection();
			//3. sql작성
			sql = "SELECT * FROM p_board WHERE no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			//4. 쿼리실행
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				bbean = new BoardBean();
				bbean.setNo(rs.getInt("no"));
				bbean.setReadCnt(rs.getInt("readCnt"));
				bbean.setUser_name(rs.getString("user_name"));
				bbean.setUser_id(rs.getString("user_id"));
				bbean.setReg_date(rs.getTimestamp("reg_date"));
				bbean.setSubject(rs.getString("subject"));
				bbean.setContent(rs.getString("content"));
				bbean.setFile(rs.getString("file"));
				bbean.setIp(rs.getString("ip"));
				bbean.setRe_lev(rs.getInt("re_lev"));
				bbean.setRe_group(rs.getInt("re_group"));
				bbean.setRe_seq(rs.getInt("re_seq"));
				bbean.setRepCnt(rs.getInt("repCnt"));
				bbean.setCommCnt(rs.getInt("commCnt"));
			}
			
		} catch (Exception e) {
			System.out.println("getBoard에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return bbean;
	}
	
	
	/* 삭제할 글번호와 삭제할 글의 패스워드를 전달받아 글삭제하는 메소드 */
	public int delBoard(int no, String user_id){
		int check = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			//sql문작성: num에 해당하는 passwd가져오기
			sql = "SELECT user_id FROM p_board WHERE no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if (user_id.equals(rs.getString("user_id"))) {
					check = 1;
					//sql = num에 해당하는 글 삭제
					sql = "DELETE FROM p_board WHERE no =?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.executeUpdate();
				} else {	//비밀번호 틀리면 check = 0
					check = 0;
				}
			}
			
			
		} catch (Exception e) {
			System.out.println("delBoard에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return check;	//비밀번호 일치 유무리턴. 1 또는 0
	}
	
	
	/* 수정할 DTO객체를 전달받아 DB에 있는 패스워드와 일치하면 글을 수정한다. */
	public int updateBoard(BoardBean bBean, String user_id){
		int check = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			sql = "SELECT user_id FROM p_board WHERE no = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bBean.getNo());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if (user_id.equals(rs.getString("user_id"))) {
					sql = "UPDATE p_board SET subject=?, content=?, file=? WHERE no = ?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bBean.getSubject());
					pstmt.setString(2, bBean.getContent());
					pstmt.setString(3, bBean.getFile());
					pstmt.setInt(4, bBean.getNo());
					
					pstmt.executeUpdate();
					
					check = 1;
				} else {	
					check = 0;
				}
			}
			
		} catch (Exception e) {
			System.out.println("updateBoard에서 오류: "+e);
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
	public int reInsertBoard(BoardBean bBean){
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
			sql = "SELECT max(no) FROM p_board";
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
//			sql = "UPDATE p_board SET re_seq = re_seq+1, repCnt = repCnt+1 WHERE re_group=? AND re_seq > ?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, dto.getRe_group());
//			pstmt.setInt(2, dto.getRe_seq());
//			
//			pstmt.executeUpdate();
			
			/* 답변글 달기 */
			//insert	//re_seq+1, re_lev+1 답글달기
			sql = "INSERT INTO p_board(no, user_id, user_name, ip, subject, content, file, reg_date, readCnt, repCnt, commCnt, re_group, re_seq, re_lev)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			pstmt.setString(2, bBean.getUser_id());
			pstmt.setString(3, bBean.getUser_name());
			pstmt.setString(4, bBean.getIp());
			pstmt.setString(5, bBean.getSubject());
			pstmt.setString(6, bBean.getContent());
			pstmt.setString(7, bBean.getFile());
			pstmt.setInt(8, bBean.getReadCnt());
			pstmt.setInt(9, bBean.getRepCnt());
			pstmt.setInt(10, bBean.getCommCnt());
			pstmt.setInt(11, bBean.getRe_group());	//부모글 그룹번호 사용
			pstmt.setInt(12, bBean.getRe_seq()+1);	//부모글의 re_seq에 1을 더하여 답글 순서 정하기
			pstmt.setInt(13, bBean.getRe_lev()+1);	//부모글의 re_lev에 1을 더하여 들여쓰기 값 저장
			
			pstmt.executeUpdate();
			update = 1;
			
		} catch (Exception e) {
			System.out.println("reIntBoard에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return update;
	}
	
	
	/* 검색어를 전달받아 검색어에 해당하는 글개수를  DB로부터 가져와서 글 개수 리턴 */
	public int getCount(String search){
		int count = 0;		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "SELECT count(*) FROM p_board WHERE subject like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");	// %안녕%
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getCount에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return count;		
	}
	
	
	/* 글목록 가져오기2 (검색어를 입력했을 때) */
	//getBoardList(각페이지마다 맨 위에 첫번쨰로 보여질 시작 글번호, 한 페이지당 보여줄 글 개수, 검색어)를 전달받아
	//글정보 하나하나를 ArrayList에 담아 getBoardList메소드를 호출한 곳으로
	//BoardBean객체들을 저장하고 있는 ArrayList객체를 리턴함
	public List<BoardBean> getBoardList(int startRow, int pageSize, String search){
		List<BoardBean> boardlist = new ArrayList<BoardBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			//디비연결
			con = getConnection();
			//글제목의 앞뒤에 어떤 문자가 와도 상관없이 검색어를 가진 데이터를 검색하는데 정렬re_ref 내림차순, re_seq오름차순 정렬하여 
			//limit 각페이지마다 맨위에 첫번째로 보여질 시작 글번호부터 한페이지당 보여줄 글 개수만큼 검색한다.
			sql = "SELECT * FROM p_board WHERE subject like ? ORDER BY re_ref DESC, re_seq ASC LIMIT ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean bBean = new BoardBean();
				bBean.setContent(rs.getString("content"));
				bBean.setReg_date(rs.getTimestamp("reg_date"));
				bBean.setFile(rs.getString("file"));
				bBean.setIp(rs.getString("ip"));
				bBean.setUser_name(rs.getString("user_name"));
				bBean.setNo(rs.getInt("no"));
				bBean.setRe_lev(rs.getInt("re_lev"));
				bBean.setRe_group(rs.getInt("re_group"));
				bBean.setRe_seq(rs.getInt("re_seq"));
				bBean.setReadCnt(rs.getInt("readCnt"));
				bBean.setSubject(rs.getString("subject"));
				//BoardBean객체 => ArrayList에 추가
				boardlist.add(bBean);
			}
			
		} catch (Exception e) {
			System.out.println("getBoardList(int startRow, int pageSize, String search)에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return boardlist;
	}
}
