package Notice;

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

import Member.MemberDAO;



public class NoticeDAO {
	
	private Connection getConnection() throws Exception{
		Connection con=null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/shopping");
		con=ds.getConnection();
		return con;
	}
	
	public void insertNotice(NoticeDTO nd){
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql ="";
		ResultSet rs=null;
		int num=0;
		try{
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat s = new SimpleDateFormat("yyyy/MM/dd");
			con=getConnection();
			
			sql="select max(notice_num) from notice";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1;
			}
			System.out.println("num"+num);
			sql="insert into notice(notice_num,notice_name,notice_pass,notice_subject,notice_content,readcount,date) values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, nd.getNotice_name());
			pstmt.setString(3, nd.getNotice_pass());
			pstmt.setString(4, nd.getNotice_subject());
			pstmt.setString(5, nd.getNotice_content());
			pstmt.setInt(6, 0);
			pstmt.setString(7, s.format(ts));
			
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("insertNotice(NoticeDTO nd)에서 오류"+e);
		}finally{
			//객체 닫기
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	
	public int getNoticeCount(){
		Connection con =null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try{
			con=getConnection();
			sql="select count(*) from notice";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getNoticeCount()에서 오류"+e);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return count;
	}
	
	public int getNoticeCount(String searchField){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			sql="select count(*) from notice where notice_subject like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchField+"%");
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
				}
			}catch (Exception e) {
				System.out.println("getNoticeCount(String search)에서 오류"+e);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null)try{con.close();}catch(SQLException ex){}
			}
			return count;
	}
	
	public List<NoticeDTO> getNoticeList(int startRow,int pageSize){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<NoticeDTO> noticeList=new ArrayList<>();

		try{
			con=getConnection();
			
			sql="select * from notice order by notice_num desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs=pstmt.executeQuery();
			MemberDAO mdao = new MemberDAO();
			
			while(rs.next()){
				NoticeDTO nd = new NoticeDTO();
				nd.setNotice_num(rs.getInt("notice_num"));
				nd.setNotice_name(rs.getString("notice_name"));
				nd.setNotice_pass(rs.getString("notice_pass"));
				nd.setNotice_subject(rs.getString("notice_subject"));
				nd.setNotice_content(rs.getString("notice_content"));
				nd.setReadcount(rs.getInt("readcount"));
				nd.setDate(rs.getString("date"));
				noticeList.add(nd);
				
			}
		}catch(Exception e){
			System.out.println("getNoticeList(int startRow,int pageSize)에서 오류"+e);
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return noticeList;
		
	}
	
	public List<NoticeDTO> getNoticeList(int startRow,int pageSize,String searchField){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		List<NoticeDTO> noticeList=new ArrayList<>();
		try{
			con=getConnection();
			
			if(searchField.equals("notice_subject")){
			sql="select * from notice where notice_subject like ? order by notice_num desc asc limit ?,?";
			}else if(searchField.equals("notice_name")){
			sql="select * from notice where notice_name like ? order by notice_num desc asc limit ?,?";
			}
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchField+"%");
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				NoticeDTO nd = new NoticeDTO();
				nd.setNotice_num(rs.getInt("notice_num"));
				nd.setNotice_name(rs.getString("notice_name"));
				nd.setNotice_pass(rs.getString("notice_pass"));
				nd.setNotice_subject(rs.getString("notice_subject"));
				nd.setNotice_content(rs.getString("notice_content"));
				nd.setReadcount(rs.getInt("readcount"));
				nd.setDate(rs.getString("date"));
				noticeList.add(nd);
				
			}
		}catch(Exception e){
			System.out.println("getNoticeList(int startRow,int pageSize,String search)에서 오류"+e);
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return noticeList;
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
			sql="update notice set readcount=readcount+1 where notice_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 실행 
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadcount(int num)에서 오류"+e);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
	}
	
	public int updateNotice(NoticeDTO nd){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int check=-1;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql  pass   조건 num
			sql="select notice_pass from notice where notice_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, nd.getNotice_num());
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs 첫행 이동 데이터 있으면 
			//  비밀번호비교  폼   디비 비밀번호  맞으면 check=1
			//  //3 update 수정 content name subject 조건 num  //4 실행
			//    틀리면  check=0
			if(rs.next()){
				if(nd.getNotice_pass().equals(rs.getString("notice_pass"))){
					check=1;
					//3 update
					sql="update notice set notice_name=?,notice_subject=?,notice_content=? where notice_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, nd.getNotice_name());
					pstmt.setString(2, nd.getNotice_subject());
					pstmt.setString(3, nd.getNotice_content());
					pstmt.setInt(4, nd.getNotice_num());
					//4실행
					pstmt.executeUpdate();
				}else{
					check=0;
				}
			}
		} catch (Exception e) {
			System.out.println(" updateNotice(NoticeDTO nd)에서 오류"+e);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return check;
	}
	
	public int deleteNotice(int num,String pass){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int check=-1;
		try {
			//1,2 디비연결 메서드호출
			con=getConnection();
			//3 sql select pass  조건 num=
			sql="select notice_pass from notice where notice_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs 첫행이동 데이터 있으면
			//     폼   디비  비밀번호   비교 맞으면  check=1
			//   //3 delete  조건 num= //4 실행
			//                        틀리면 check=0
			if(rs.next()){
				if(pass.equals(rs.getString("notice_pass"))){
					check=1;
					//3 update
					sql="delete from notice where notice_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num);
					//4실행
					pstmt.executeUpdate();
				}else{
					check=0;
				}
			}
		} catch (Exception e) {
			System.out.println("deleteNotice(int num,String pass)에서 오류"+e);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return check;
	}

	public NoticeDTO getNotice(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="";
		ResultSet rs=null;
		NoticeDTO nd = null;
		
		try{
			con=getConnection();
			
			sql="select * from notice where notice_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				nd= new NoticeDTO();
				nd.setNotice_num(rs.getInt("notice_num"));
				nd.setNotice_name(rs.getString("notice_name"));
				nd.setNotice_pass(rs.getString("notice_pass"));
				nd.setNotice_subject(rs.getString("notice_subject"));
				nd.setNotice_content(rs.getString("notice_content"));
				nd.setReadcount(rs.getShort("readcount"));
				nd.setDate(rs.getString("date"));
			}
					
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return nd;
	}
	
	public NoticeDTO gopage(int num){
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql =null;
		NoticeDTO goList=null;
		try{
		con = getConnection();
		sql="select * from notice where notice_num = (select min(notice_num) from notice where notice_num>?)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
			goList= new NoticeDTO();
			goList.setNotice_num(rs.getInt("notice_num"));
			goList.setNotice_name(rs.getString("notice_name"));
			goList.setNotice_pass(rs.getString("notice_pass"));
			goList.setNotice_subject(rs.getString("notice_subject"));
			goList.setNotice_content(rs.getString("notice_content"));
			goList.setReadcount(rs.getShort("readcount"));
			goList.setDate(rs.getString("date"));
			
			
			}
		
		}catch(Exception e){
			System.out.println("");
		}finally{
			
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return goList;
	}
	
	public NoticeDTO backpage(int num){
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql =null;
		NoticeDTO backList=null;
		try{
		con = getConnection();
		sql="select * from notice where notice_num = (select max(notice_num) from notice where notice_num<?)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
			backList= new NoticeDTO();
			backList.setNotice_num(rs.getInt("notice_num"));
			backList.setNotice_name(rs.getString("notice_name"));
			backList.setNotice_pass(rs.getString("notice_pass"));
			backList.setNotice_subject(rs.getString("notice_subject"));
			backList.setNotice_content(rs.getString("notice_content"));
			backList.setReadcount(rs.getShort("readcount"));
			backList.setDate(rs.getString("date"));
			
			
			}
		
		}catch(Exception e){
			System.out.println("");
		}finally{
			
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		return backList;
	}
	
	public int maxnum(int num){
		Connection con=null;
		PreparedStatement pstmt = null;
		String sql ="";
		ResultSet rs=null;
		num=0;
		try{
			con=getConnection();
			sql="select max(notice_num) from notice";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1;
			}
		}catch(Exception e){
			System.out.println("maxnum에서 오류 : " + e);
		}finally{
			
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return num;
	}

}

