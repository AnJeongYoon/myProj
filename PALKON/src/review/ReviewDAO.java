package review;

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

import Product.prodDAO;
import Product.prodDTO;


public class ReviewDAO {
   
   Connection con;
   DataSource ds;
   PreparedStatement pstmt;
   ResultSet rs;
   String sql;
   
   public void freeResource(){
      if(con !=null){
         try {con.close();} catch (SQLException e) {e.printStackTrace();}}
      if(rs !=null){
         try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
      if(pstmt !=null){
         try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
   
   }
   
   private Connection getConnection() throws Exception{
      con=null;
      Context init=new InitialContext();
      ds=(DataSource)init.lookup("java:comp/env/jdbc/shopping");
      con=ds.getConnection();
      return con;
   }
   
   public void insertBoard(ReviewDTO rd){
      con = null;
      pstmt = null;
      String sql = "";
      rs = null;
      int num=0;
      try{
         
         Timestamp ts = new Timestamp(System.currentTimeMillis());
         SimpleDateFormat s = new SimpleDateFormat("yyyy/MM/dd");
         
         con=getConnection();
         
         sql = "select max(rv_num) from review";
         pstmt=con.prepareStatement(sql);
         rs=pstmt.executeQuery();
         if(rs.next()){
            num = rs.getInt(1)+1;
         }
         
         sql="insert into review(rv_num,rv_id,rv_title,rv_content,rv_name,rv_pw,rv_email,rv_score,rv_pro_code,rv_date,rv_file,readcount) values(?,?,?,?,?,?,?,?,?,?,?,?)";
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1, num);
         pstmt.setString(2, rd.getRv_id());
         pstmt.setString(3, rd.getRv_title());
         pstmt.setString(4, rd.getRv_content());
         pstmt.setString(5, rd.getRv_name());
         pstmt.setString(6, rd.getRv_pw());
         pstmt.setString(7, rd.getRv_email());
         pstmt.setString(8, rd.getRv_score());
         pstmt.setString(9, rd.getRv_pro_code());
         pstmt.setString(10, s.format(ts));
         pstmt.setString(11, rd.getRv_file());
         pstmt.setInt(12, 0);
         pstmt.executeUpdate();
      }catch(Exception e){
         System.out.println("insertBoard에서 오류:"+e);
         
      }finally{
         //객체 닫기
         freeResource();
      }
   }
   
   public int getReviewCount(){
      con =null;
      pstmt = null;
      String sql ="";
      rs=null;
      int count=0;
      try{
         con=getConnection();
         sql="select count(*) from review";
         pstmt= con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         if(rs.next()){
            count = rs.getInt(1);
            
         }
         
      }catch(Exception e){
         System.out.println("getReviewcount에서 오류"+e);
         
      }finally{
         freeResource();
      }
      return count;
   }
   
   public List<ReviewDTO> getReviewList(int startRow,int pageSize){
      con = null;
      pstmt = null;
      String sql="";
      rs=null;
      List<ReviewDTO> reviewList = new ArrayList<>();
      try{
         
         con=getConnection();
         
         sql="select * from review a, product_img b WHERE a.rv_pro_code = b.pi_pro_code "
         		+ "AND image_use = 'main' order by rv_num desc limit ?,?";
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1, startRow-1);
         pstmt.setInt(2, pageSize);
         
         rs=pstmt.executeQuery();
         
         while(rs.next()){
            ReviewDTO rd = new ReviewDTO();
            
            
            rd.setRv_num(rs.getInt("rv_num"));
            rd.setRv_id(rs.getString("rv_id"));
            rd.setRv_title(rs.getString("rv_title"));
            rd.setRv_content(rs.getString("rv_content"));
            rd.setRv_name(rs.getString("rv_name"));
            rd.setRv_pw(rs.getString("rv_pw"));
            rd.setRv_email(rs.getString("rv_email"));
            rd.setRv_score(rs.getString("rv_score"));
            rd.setRv_pro_code(rs.getString("rv_pro_code"));
            rd.setRv_date(rs.getString("rv_date"));
            rd.setReadcount(rs.getInt("readcount"));
            rd.setImage_name(rs.getString("image_name"));
            rd.setImage_path(rs.getString("image_path"));
            
            reviewList.add(rd);
         }
      }catch(Exception e){
         System.out.println("getReviewList에서 오류"+e);
      }finally{
         
         freeResource();
      }
      return reviewList;
      
      
   }
   
   
   
   //리뷰 내용 뿌리는 메소드
   public List<ReviewDTO> getReviewContent(String rv_pro_code){
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "";
      
      List<ReviewDTO> reviewContentList = new ArrayList<ReviewDTO>();
      
      try {
         con = getConnection();
         sql = "SELECT * FROM review WHERE rv_pro_code = ? ORDER BY rv_date DESC LIMIT 5";
         
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, rv_pro_code);
         rs = pstmt.executeQuery();   
         
         while (rs.next()) {
            ReviewDTO rDto = new ReviewDTO();
            rDto.setRv_num(rs.getInt("rv_num"));
            rDto.setRv_id(rs.getString("rv_id"));
            rDto.setRv_title(rs.getString("rv_title"));
            rDto.setRv_content(rs.getString("rv_content"));
            rDto.setRv_name(rs.getString("rv_name"));
            rDto.setRv_pw(rs.getString("rv_pw"));
            rDto.setRv_email(rs.getString("rv_email"));
            rDto.setRv_score(rs.getString("rv_score"));
            rDto.setRv_pro_code(rs.getString("rv_pro_code"));
            rDto.setRv_date(rs.getString("rv_date"));
            rDto.setRv_file(rs.getString("rv_file"));
            rDto.setReadcount(rs.getInt("readcount"));
            reviewContentList.add(rDto);
         }
         
      } catch (Exception e) {
         System.out.println("getReviewContent에서 오류: "+e);
      } finally {
         if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
         if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
         if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
      }
      
      return reviewContentList;
   }
   
   //메인에 리뷰 메소드
   public List<ReviewDTO> getMainReviewContent(){
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "";
      
      List<ReviewDTO> reviewContentList = new ArrayList<ReviewDTO>();
      
      try {
         con = getConnection();
         sql = "SELECT * FROM review a, product_img b WHERE a.rv_pro_code = b.pi_pro_code "
               + "AND image_use = 'main' AND rv_score in(3,4,5) ORDER BY rv_date DESC limit 3";
         
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();   
         
         while (rs.next()) {
            ReviewDTO rDto = new ReviewDTO();
            rDto.setRv_num(rs.getInt("rv_num"));
            rDto.setRv_id(rs.getString("rv_id"));
            rDto.setRv_title(rs.getString("rv_title"));
            rDto.setRv_content(rs.getString("rv_content"));
            rDto.setRv_name(rs.getString("rv_name"));
            rDto.setRv_pw(rs.getString("rv_pw"));
            rDto.setRv_email(rs.getString("rv_email"));
            rDto.setRv_score(rs.getString("rv_score"));
            rDto.setRv_pro_code(rs.getString("rv_pro_code"));
            rDto.setRv_date(rs.getString("rv_date"));
            rDto.setRv_file(rs.getString("rv_file"));
            rDto.setReadcount(rs.getInt("readcount"));
            
            rDto.setImage_name(rs.getString("image_name"));
            rDto.setImage_path(rs.getString("image_path"));
            
            reviewContentList.add(rDto);
         }
         
      } catch (Exception e) {
         System.out.println("getMainReviewContent에서 오류: "+e);
      } finally {
         if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
         if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
         if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
      }
      
      return reviewContentList;
   }
   
   
   //상품리뷰 평균점수 (별점)
   public double getAvgReviewScore(String rv_pro_code){
	   double AvgReviewScore = 0;
	   
	   try {
			con=getConnection();
			
			String sql = "SELECT avg(rv_score) FROM review a, product_img b WHERE a.rv_pro_code = b.pi_pro_code "
					+ "AND rv_pro_code = ? AND image_use = 'main' ORDER BY rv_date DESC";
	
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, rv_pro_code);
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				AvgReviewScore = rs.getDouble(1);
			}
			
			
		} catch (Exception e) {
			System.out.println("getAvgReviewScore에서 오류 "+e);
		}finally {
			freeResource();
		}
	   
	   return AvgReviewScore;
   }
   

	public void updateReadcount(int num) {
	  Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "";
      try{
    	  
    	  con=getConnection();
    	  
    	  sql="update review set readcount=readcount+1 where rv_num=?";
    	  pstmt=con.prepareStatement(sql);
    	  pstmt.setInt(1, num);
    	  pstmt.executeUpdate();
      }catch(Exception e){
    	  System.out.println("updateReadcount(int num)에서 오류"+e);
      }finally{
    	  
    	  freeResource();
      }	
	}

	public List<ReviewDTO> getReviewContent(int num) {
		
		  Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      String sql = "";
	      
	      List<ReviewDTO> reviewContentList = new ArrayList<ReviewDTO>();
	      
	      try {
	         con = getConnection();
	         sql = "select * from review where rv_num=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         rs = pstmt.executeQuery();   
	         
	        if(rs.next()) {
	            ReviewDTO rDto = new ReviewDTO();
	            rDto.setRv_num(rs.getInt("rv_num"));
	            rDto.setRv_id(rs.getString("rv_id"));
	            rDto.setRv_title(rs.getString("rv_title"));
	            rDto.setRv_content(rs.getString("rv_content"));
	            rDto.setRv_name(rs.getString("rv_name"));
	            rDto.setRv_pw(rs.getString("rv_pw"));
	            rDto.setRv_email(rs.getString("rv_email"));
	            rDto.setRv_score(rs.getString("rv_score"));
	            rDto.setRv_pro_code(rs.getString("rv_pro_code"));
	            rDto.setRv_date(rs.getString("rv_date"));
	            rDto.setRv_file(rs.getString("rv_file"));
	            rDto.setReadcount(rs.getInt("readcount"));
	            reviewContentList.add(rDto);
	         }
	         
	      } catch (Exception e) {
	         System.out.println("getReviewContent에서 오류: "+e);
	      } finally {
	         if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
	         if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
	         if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
	      }
	      
	      return reviewContentList;
	   }

	public int updateReview(ReviewDTO rd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int check=-1;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql  pass   조건 num
			sql="select rv_pw from review where rv_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rd.getRv_num());
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs 첫행 이동 데이터 있으면 
			//  비밀번호비교  폼   디비 비밀번호  맞으면 check=1
			//  //3 update 수정 content name subject 조건 num  //4 실행
			//    틀리면  check=0
			if(rs.next()){
				if(rd.getRv_pw().equals(rs.getString("rv_pw"))){
					check=1;
					//3 update
					 sql="update review set rv_title=?,rv_name=?,rv_email=?,rv_score=?,rv_content=?,rv_pro_code=? where rv_num=?";
	    			  pstmt=con.prepareStatement(sql);
	    			  pstmt.setString(1, rd.getRv_title());
	    			  pstmt.setString(2, rd.getRv_name());
	    			  pstmt.setString(3, rd.getRv_email());
	    			  pstmt.setString(4, rd.getRv_score());
	    			  pstmt.setString(5, rd.getRv_content());
	    			  pstmt.setString(6, rd.getRv_pro_code());
	    			  pstmt.setInt(7, rd.getRv_num());
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

	public int deleteReview(int num, String pw) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="";
		ResultSet rs=null;
		int check=-1;
		try {
			//1,2 디비연결 메서드호출
			con=getConnection();
			//3 sql select pass  조건 num=
			sql="select rv_pw from review where rv_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 rs 실행 저장
			rs=pstmt.executeQuery();
			//5 rs 첫행이동 데이터 있으면
			//     폼   디비  비밀번호   비교 맞으면  check=1
			//   //3 delete  조건 num= //4 실행
			//                        틀리면 check=0
			if(rs.next()){
				if(pw.equals(rs.getString("rv_pw"))){
					check=1;
					//3 update
					sql="delete from review where rv_num=?";
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
	
	public ReviewDTO getReview(int num){
		 Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "";
	      ReviewDTO rd = null;
	      
	      try{
	    	  con=getConnection();
	    	  
	    	  sql="select * from review where rv_num=?";
	    	  pstmt=con.prepareStatement(sql);
	    	  pstmt.setInt(1, num);
	    	  rs=pstmt.executeQuery();
	    	  
	    	  if(rs.next()){
	    		  rd=new ReviewDTO();
	    		  rd.setRv_num(rs.getInt("rv_num"));
	    		  rd.setRv_id(rs.getString("rv_id"));
	    		  rd.setRv_title(rs.getString("rv_title"));
	    		  rd.setRv_content(rs.getString("rv_content"));
		          rd.setRv_name(rs.getString("rv_name"));
		          rd.setRv_pw(rs.getString("rv_pw"));
		          rd.setRv_email(rs.getString("rv_email"));
		          rd.setRv_score(rs.getString("rv_score"));
		          rd.setRv_pro_code(rs.getString("rv_pro_code"));
		          rd.setRv_date(rs.getString("rv_date"));
		          rd.setRv_file(rs.getString("rv_file"));
		          rd.setReadcount(rs.getInt("readcount"));
		          
	    	  }
	      }catch(Exception e){
	    	  e.printStackTrace();
	    	  
	      }finally {
		         if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
		         if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
		         if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
	      }
	      return rd;
	}
	
	
}
