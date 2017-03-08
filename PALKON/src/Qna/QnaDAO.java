package Qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;





public class QnaDAO {
	private Connection getConnection() throws Exception{
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/shopping");
		con=ds.getConnection();
		return con;
	}
	
	public boolean insertBoard(QnaDTO qd){
		
		sequp();
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql ="";
		ResultSet rs=null;
		int num=0;
		int result=0;
		try{
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat s = new SimpleDateFormat("yyyy/MM/dd");
			//1,2 디비연결
			con=getConnection();
			// 게시판 글번호 구하기 num
			// 게시판 글중에 가장큰번호 구하기 max(num)     +1
			sql="select max(qna_num) from qna";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1; //1번열   가장큰번호+1
			}
			System.out.println("num="+num);
			sql="insert into qna(qna_num,qna_name,qna_pass,qna_subject,qna_content,qna_ref,qna_lev,qna_seq,readcount,date,pr_pro_code,textck,qna_file) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, qd.getQna_name());
			pstmt.setString(3, qd.getQna_pass());
			pstmt.setString(4, qd.getQna_subject());
			pstmt.setString(5, qd.getQna_content());
			pstmt.setInt(6, num);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setString(10, s.format(ts));
			pstmt.setString(11, qd.getPr_pro_code());
			pstmt.setString(12, qd.getTextck());
			pstmt.setString(13, qd.getQna_file());
			//4 실행
			result=pstmt.executeUpdate();
			if(result!=0){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//객체 닫기
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	public int getBoardCount(){
		Connection con =null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try{
			con=getConnection();
			sql="select count(*) from qna";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return count;
	}
	
	public int getBoardCount(String search){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			sql="select count(*) from qna where qna_subject like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null)try{con.close();}catch(SQLException ex){}
			}
			return count;
	}
	
	public List<QnaDTO> getBoardList(int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<QnaDTO> boardList=new ArrayList<>();
		try{
			//1,2 디비연결
			con=getConnection();
			//3 sql 전체 board 글가져오기  
			//정렬 최근글 맨처음 re_ref내림차순 답글순서 re_seq 오름차순
			// limit 시작행-1 , 몇개 
			sql="select * from qna order by qna_ref desc, qna_seq asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			//4 rs = 실행 저장
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				QnaDTO qd = new QnaDTO();
				qd.setQna_content(rs.getString("qna_content"));
				qd.setDate(rs.getString("date"));
				qd.setQna_name(rs.getString("qna_name"));
				qd.setQna_num(rs.getInt("qna_num"));
				qd.setQna_pass(rs.getString("qna_pass"));
				qd.setQna_lev(rs.getInt("qna_lev"));
				qd.setQna_ref(rs.getInt("qna_ref"));
				qd.setQna_seq(rs.getInt("qna_seq"));
				qd.setRedcount(rs.getInt("readcount"));
				qd.setQna_subject(rs.getString("qna_subject"));
				qd.setPr_pro_code(rs.getString("pr_pro_code"));
				qd.setTextck(rs.getString("textck"));
				qd.setQna_file(rs.getString("qna_file"));
				boardList.add(qd);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return boardList;
	}
	
	public List<QnaDTO> getBoardList(int startRow,int pageSize,String search){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<QnaDTO> boardList=new ArrayList<>();
		try{
			//1,2 디비연결
			con=getConnection();
			//3 sql 전체 board 글가져오기  
			//정렬 최근글 맨처음 re_ref내림차순 답글순서 re_seq 오름차순
			// limit 시작행-1 , 몇개 
			sql="select * from qna where qna_subject like ? order by qna_ref desc, qna_seq asc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			//4 rs = 실행 저장
			rs=pstmt.executeQuery();
			//5 rs 다음행이동 데이터 있으면  BoardBean bb 객체 생성
			//    bb 멤버변수  <-  rs 열을 저장
			//  배열 boardList 한칸 저장
			while(rs.next()){
				QnaDTO qd = new QnaDTO();
				qd.setQna_content(rs.getString("qna_content"));
				qd.setDate(rs.getString("date"));
				qd.setQna_name(rs.getString("qna_name"));
				qd.setQna_num(rs.getInt("qna_num"));
				qd.setQna_pass(rs.getString("qna_pass"));
				qd.setQna_lev(rs.getInt("qna_lev"));
				qd.setQna_ref(rs.getInt("qna_ref"));
				qd.setQna_seq(rs.getInt("qna_seq"));
				qd.setRedcount(rs.getInt("readcount"));
				qd.setQna_subject(rs.getString("qna_subject"));
				qd.setPr_pro_code(rs.getString("pr_pro_code"));
				qd.setTextck(rs.getString("textck"));
				qd.setQna_file(rs.getString("qna_file"));
				boardList.add(qd);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return boardList;
	}
	
	public QnaDTO getBoard(int num){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		QnaDTO qd=null;
		
		try {
			//1,2 디비연결
			con=getConnection();
			
				sql="select * from qna where qna_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//4  rs 실행 저장
				rs=pstmt.executeQuery();
				//5 rs 첫행 데이터있으면 qd 객체 생성  
				//  qd 멤버변수 저장 <- rs 열
				if(rs.next()){
					qd=new QnaDTO();
					qd.setQna_content(rs.getString("qna_content"));
					qd.setDate(rs.getString("date"));
					qd.setQna_name(rs.getString("qna_name"));
					qd.setQna_num(rs.getInt("qna_num"));
					qd.setQna_pass(rs.getString("qna_pass"));
					qd.setQna_lev(rs.getInt("qna_lev"));
					qd.setQna_ref(rs.getInt("qna_ref"));
					qd.setQna_seq(rs.getInt("qna_seq"));
					qd.setRedcount(rs.getInt("readcount"));
					qd.setQna_subject(rs.getString("qna_subject"));
					qd.setPr_pro_code(rs.getString("pr_pro_code"));
					qd.setTextck(rs.getString("textck"));
					qd.setQna_file(rs.getString("qna_file"));
				}
				
			 
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return qd;
	}
	
	
	
	public void updateReadcount(int num){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql update  readcount= readcount+1 조건 num=;
			sql="update qna set readcount=readcount+1 where qna_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 실행 
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	
	public int updateBoard(QnaDTO qd){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int check=-1;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql  pass   조건 num
			sql="select qna_pass from qna where qna_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qd.getQna_num());
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs 첫행 이동 데이터 있으면 
			//  비밀번호비교  폼   디비 비밀번호  맞으면 check=1
			//  //3 update 수정 content name subject 조건 num  //4 실행
			//    틀리면  check=0
			if(rs.next()){
				if(qd.getQna_pass().equals(rs.getString("qna_pass"))){
					check=1;
					//3 update
					sql="update qna set qna_name=?,qna_subject=?,qna_content=? where qna_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, qd.getQna_name());
					pstmt.setString(2, qd.getQna_subject());
					pstmt.setString(3, qd.getQna_content());
					pstmt.setInt(4, qd.getQna_num());
					//4실행
					pstmt.executeUpdate();
				}else{
					check=0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return check;
	}
	
	public int deleteBoard(int num,String pass){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int check=-1;
		try {
			//1,2 디비연결 메서드호출
			con=getConnection();
			//3 sql select pass  조건 num=
			sql="select qna_pass from qna where qna_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs 첫행이동 데이터 있으면
			//     폼   디비  비밀번호   비교 맞으면  check=1
			//   //3 delete  조건 num= //4 실행
			//                        틀리면 check=0
			if(rs.next()){
				if(pass.equals(rs.getString("qna_pass"))){
					check=1;
					//3 update
					sql="delete from qna where qna_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num);
					//4실행
					pstmt.executeUpdate();
				}else{
					check=0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return check;
	}

	public void reInsertBoard(QnaDTO qd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int num=0;
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat s = new SimpleDateFormat("yyyy/MM/dd");
			//1,2 디비연결
			con=getConnection();
			//3 select max(num)   //4 rs 실행저장
			sql="select max(qna_num) from qna";
			pstmt=con.prepareStatement(sql);
			//5 rs 첫행 데이터있으면  num = 최대큰번호 +1
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1;
			}
			// 답글 재배치 
			// 3 update re_seq=re_seq+1  조건  같은 그룹 re_ref=? 동시에 and re_seq>?
			// 4 실행
			sql="update qna set qna_seq=qna_seq+1 where qna_ref=? and qna_seq>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qd.getQna_ref());
			pstmt.setInt(2, qd.getQna_seq());
			pstmt.executeUpdate();
			// 3 insert  num   re_ref 그대로  re_lev +1  re_seq +1
			sql="insert into qna(qna_num,qna_name,qna_pass,qna_subject,qna_content,qna_ref,qna_lev,qna_seq,readcount,date,pr_pro_code,textck,qna_file) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, qd.getQna_name());
			pstmt.setString(3, qd.getQna_pass());
			pstmt.setString(4, qd.getQna_subject());
			pstmt.setString(5, qd.getQna_content());
			pstmt.setInt(6, qd.getQna_ref());
			pstmt.setInt(7, qd.getQna_lev()+1);
			pstmt.setInt(8, qd.getQna_seq());
			pstmt.setInt(9, qd.getRedcount());
			pstmt.setString(10, s.format(ts));
			pstmt.setString(11, qd.getPr_pro_code());
			pstmt.setString(12, qd.getTextck());
			pstmt.setString(13, "");
			
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}

	public int contentBoard(int num, String pass, String id) {
		Connection con = null;
		PreparedStatement pstmt =null;
		String sql="";
		ResultSet rs = null;
		int check=-1;
		try{
			con=getConnection();
			sql="select qna_pass from qna where qna_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				if(pass.equals(rs.getString("qna_pass")) || id.equals("admin")){
					check=1;
					
				}else{
					check=0;
				}
			}
		}catch(Exception e){
			System.out.println("contentBoard(int num, String pass)에서 오류" +e);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return check;
	}
	
	public void sequp(){
		Connection con = null;
		PreparedStatement pstmt =null;
		String sql = "update qna set qna_seq = qna_seq + 1";
		
		try{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			
		}catch (Exception e){
			System.out.println("sequp에서 오류" + e);
		}finally{
			
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	
	
}