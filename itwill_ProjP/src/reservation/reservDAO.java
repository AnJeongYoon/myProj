package reservation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

import board.BoardBean;

public class reservDAO {
	//DB연결 메소드
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
		
		/* 예약 추가 메소드 */
		public int insertReserve(reservBean rBean, String user_id, String user_name){
			int reserv = 0;	//가입되면 1
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			String sql = "";
			
			try {
				con = getConnection();
				
				sql = "INSERT INTO p_reservation(user_id, user_name, reservYear, reservMonth, reservDay, reservTime, reservPeopleCnt, reservPhone, reservContent, reg_date, state) "
						+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setString(2, rBean.getUser_name());
				pstmt.setInt(3, rBean.getReservY());
				pstmt.setInt(4, rBean.getReservM());
				pstmt.setInt(5, rBean.getReservD());
				pstmt.setString(6, rBean.getReservTime1()+":"+rBean.getReservTime2());
				pstmt.setString(7, rBean.getPeopleCnt());
				pstmt.setString(8, rBean.getPhoneNum1()+"-"+rBean.getPhoneNum2()+"-"+rBean.getPhoneNum3());
				pstmt.setString(9, rBean.getReservContent());
				pstmt.setTimestamp(10, rBean.getReg_date());
				
				pstmt.executeUpdate();
				reserv = 1;
				
			} catch (Exception err) {
				System.out.println("insertReserve에서 오류: "+err);
				
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
				if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); } }
			}
			
			return reserv;
		}
		
		
		//예약 개수 메소드
		public int getreservCount(String user_id){
			int count = 0;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";

			try {
				//1,2 DB연결
				con = getConnection();
				//3 sql 전체 글갯수 가져오기
				sql = "SELECT count(*) FROM p_reservation WHERE user_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				rs = pstmt.executeQuery();
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
		
		//예약 개수 메소드2
		public int getreservCount2(){
			int count = 0;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";

			try {
				//1,2 DB연결
				con = getConnection();
				//3 sql 전체 글갯수 가져오기
				sql = "SELECT count(*) FROM p_reservation";
				pstmt = con.prepareStatement(sql);
				//	pstmt.setString(1, user_id);
				
				rs = pstmt.executeQuery();
				
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
		
		
		//예약 목록 가져오기 메소드
		public List<reservBean> getReservList(int startRow, int pageSize, String user_id){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			List<reservBean> reservList = new ArrayList<reservBean>();
			
			try {
				con = getConnection();
				sql = "SELECT * FROM p_reservation WHERE user_id = ? ORDER BY no DESC";
			//	sql = "SELECT * FROM p_board ORDER BY re_group DESC, re_seq ASC LIMIT ?, ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
			//	pstmt.setInt(1, startRow);
			//	pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					reservBean rBean = new reservBean();
					rBean.setNo(rs.getInt(1));
					rBean.setUser_id(rs.getString(2));
					rBean.setUser_name(rs.getString(3));
					rBean.setReservY(rs.getInt(4));
					rBean.setReservM(rs.getInt(5));
					rBean.setReservD(rs.getInt(6));
					rBean.setReservTime1(rs.getString(7));
					rBean.setPeopleCnt(rs.getString(8));
					rBean.setPhoneNum1(rs.getString(9));
					rBean.setReservContent(rs.getString(10));
					rBean.setReg_date(rs.getTimestamp(11));
					rBean.setState(rs.getInt(12));
					
					reservList.add(rBean);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
			}
			
			return reservList;	//ArrayList리턴
		}
		
		
		//예약 목록 가져오기 메소드
		public List<reservBean> getReservList2(){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			List<reservBean> reservList = new ArrayList<reservBean>();
			
			try {
				con = getConnection();
				sql = "SELECT * FROM p_reservation WHERE state = 1 ORDER BY no DESC";
			//	sql = "SELECT * FROM p_board ORDER BY re_group DESC, re_seq ASC LIMIT ?, ?";
				
				pstmt = con.prepareStatement(sql);
			//	pstmt.setString(1, user_id);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					reservBean rBean = new reservBean();
					rBean.setNo(rs.getInt(1));
					rBean.setUser_id(rs.getString(2));
					rBean.setUser_name(rs.getString(3));
					rBean.setReservY(rs.getInt(4));
					rBean.setReservM(rs.getInt(5));
					rBean.setReservD(rs.getInt(6));
					rBean.setReservTime1(rs.getString(7));
					rBean.setPeopleCnt(rs.getString(8));
					rBean.setPhoneNum1(rs.getString(9));
					rBean.setReservContent(rs.getString(10));
					rBean.setReg_date(rs.getTimestamp(11));
					
					reservList.add(rBean);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
			}
			
			return reservList;	//ArrayList리턴
		}
		
		
		
		
		/* 예약리스트 */
		public reservBean getReserv(String user_id){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM p_reservation WHERE user_id = ?";
			
			reservBean rBean = new reservBean();
			
			try {
				con = getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					rBean.setNo(rs.getInt(1));
					rBean.setUser_id(user_id);
					rBean.setUser_name(rs.getString(3));
					rBean.setReservY(rs.getInt(4));
					rBean.setReservM(rs.getInt(5));
					rBean.setReservD(rs.getInt(6));
					rBean.setReservTime1(rs.getString(7));
					rBean.setPeopleCnt(rs.getString(8));
					rBean.setPhoneNum1(rs.getString(9));
					rBean.setReservContent(rs.getString(10));
					rBean.setReg_date(rs.getTimestamp(11));
				}
				
			} catch(Exception err){
				System.out.println("getReserv메소드에서 오류: "+err);
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
			}
			
			return rBean;
		}
		
		
		/* 예약리스트2 */
		public reservBean getReserv2(int reservYear, int reservMonth){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM p_reservation WHERE reservYear = ? and reservMonth = ? and state = 1";
			
			reservBean rBean = new reservBean();
			try {
				con = getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, reservYear);
				pstmt.setInt(2, reservMonth);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					rBean.setNo(rs.getInt(1));
					rBean.setUser_id(rs.getString(2));
					rBean.setUser_name(rs.getString(3));
					rBean.setReservY(rs.getInt(4));
					rBean.setReservM(rs.getInt(5));
					rBean.setReservD(rs.getInt(6));
					rBean.setReservTime1(rs.getString(7));
					rBean.setPeopleCnt(rs.getString(8));
					rBean.setPhoneNum1(rs.getString(9));
					rBean.setReservContent(rs.getString(10));
					rBean.setReg_date(rs.getTimestamp(11));
				}
				
			} catch(Exception err){
				System.out.println("getReserv2메소드에서 오류: "+err);
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
			}
			
			return rBean;
		}
		
		/* 예약리스트3 */
		public reservBean getReserv3(String user_id, int no){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM p_reservation WHERE user_id = ? and no = ?";
			
			reservBean rBean = new reservBean();
			
			try {
				con = getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setInt(2, no);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					rBean.setNo(no);
					rBean.setUser_id(user_id);
					rBean.setUser_name(rs.getString(3));
					rBean.setReservY(rs.getInt(4));
					rBean.setReservM(rs.getInt(5));
					rBean.setReservD(rs.getInt(6));
					rBean.setReservTime1(rs.getString(7));
					rBean.setPeopleCnt(rs.getString(8));
					rBean.setPhoneNum1(rs.getString(9));
					rBean.setReservContent(rs.getString(10));
					rBean.setReg_date(rs.getTimestamp(11));
				}
				
			} catch(Exception err){
				System.out.println("getReserv메소드에서 오류: "+err);
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
			}
			
			return rBean;
		}
		
		
		
		
		/* 수정할 DTO객체를 전달받아 DB에 있는 패스워드와 일치하면 글을 수정한다. */
		public int updateReserve(reservBean rBean, String user_id){
			int check = 0;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "";
			
			try {
				con = getConnection();
				sql = "SELECT user_id FROM p_reservation WHERE no = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rBean.getNo());
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if (user_id.equals(rs.getString("user_id"))) {
						sql = "UPDATE p_reservation SET reservPhone=?, reservYear=?, reservMonth=?, reservDay=?, reservTime=?, reservPeopleCnt=?, reservContent=? WHERE no=?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, rBean.getPhoneNum1()+"-"+rBean.getPhoneNum2()+"-"+rBean.getPhoneNum3());
						pstmt.setInt(2, rBean.getReservY());
						pstmt.setInt(3, rBean.getReservM());
						pstmt.setInt(4, rBean.getReservD());
						pstmt.setString(5, rBean.getReservTime1()+":"+rBean.getReservTime2());
						pstmt.setString(6, rBean.getPeopleCnt());
						pstmt.setString(7, rBean.getReservContent());
						pstmt.setInt(8, rBean.getNo());
						
						pstmt.executeUpdate();
						
						check = 1;
						
					} else {	
						check = 0;
					}
				}
				
			} catch (Exception e) {
				System.out.println("updateReserve에서 오류: "+e);
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
			}
			
			return check;
		}
		
		/* 예약취소메소드 */
		public int CancelReserve(reservBean rBean, String user_id){
			int check = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "";
			
			try {
				con = getConnection();
				sql = "SELECT user_id FROM p_reservation WHERE no = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rBean.getNo());
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if (user_id.equals(rs.getString("user_id"))) {
						sql = "UPDATE p_reservation SET state=? WHERE no=?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, 0);
						pstmt.setInt(2, rBean.getNo());
						
						pstmt.executeUpdate();
						
						check = 1;
						
					} else {	
						check = 0;
					}
				}
				
			} catch (Exception e) {
				System.out.println("updateReserve에서 오류: "+e);
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
				if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
			}
			
			return check;
		}
		
		
		
}
