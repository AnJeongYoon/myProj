package member;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import board.BoardBean;

//회원가입, 수정, 삭제, 검색 등 DB연결작업을 위한 클래스
public class MemberDao {
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
	
	/* 멤버추가 메소드 */
	public int insertMember(memberBean mBean){
		int join = 0;	//가입되면 1
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "INSERT INTO p_member(user_id, user_pw, user_name, gender, birth, email, addr_post, addr_01, addr_02, phoneNum, member_grade, reg_date) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 9, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mBean.getUser_id());
			pstmt.setString(2, mBean.getUser_pw());
			pstmt.setString(3, mBean.getUser_name());
			pstmt.setString(4, mBean.getGender());
			pstmt.setString(5, mBean.getBirthY()+"-"+mBean.getBirthM()+"-"+mBean.getBirthD());
			pstmt.setString(6, mBean.getEmail_id()+"@"+mBean.getEmailAddr());
			pstmt.setString(7, mBean.getPostcode());
			pstmt.setString(8, mBean.getAddress());
			pstmt.setString(9, mBean.getAddress2());
			pstmt.setString(10, mBean.getPhoneNum1()+"-"+mBean.getPhoneNum2()+"-"+mBean.getPhoneNum3());
			
			pstmt.setTimestamp(11, mBean.getReg_date());
			
			pstmt.executeUpdate();
			join = 1;
			
		} catch (Exception err) {
			System.out.println("insertMember에서 오류: "+err);
			
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
		
		return join;
	}
	
	public int idCheck(String user_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		
		try {
			sql = "SELECT * FROM p_member WHERE user_id = ?";
			
			con = getConnection();			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) { check = 1; } else { check = 0;	}
			
		} catch (Exception err) {
			System.out.println("idCheck(String id)에서 오류: "+err);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}		
		return check;
	}
	
	
	//아이디찾기 메소드
	public memberBean getIDFind(String user_name, String phoneNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		memberBean mBean = new memberBean();
		
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "SELECT user_id FROM p_member WHERE user_name = ? and phoneNum = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_name);
			pstmt.setString(2, phoneNum);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mBean.setUser_id(rs.getString("user_id"));
			}
			
		} catch (Exception e) {
			System.out.println("getIDFind에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return mBean;
	}
	//아이디찾기 메소드
	public memberBean getPWFind(String user_pw, String user_id, String email){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		memberBean mBean = new memberBean();
		
		String sql = "";
		
		try {
			con = getConnection();
			
			if(user_pw != null){
				sql = "UPDATE p_member SET user_pw = ? WHERE user_id = ? and email = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_pw);
				pstmt.setString(2, user_id);
				pstmt.setString(3, email);
				pstmt.executeUpdate();
			} else {
				sql = "SELECT user_id FROM p_member WHERE user_id = ? and email = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
			}
			
		} catch (Exception e) {
			System.out.println("getPWFind에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return mBean;
	}
	
	
	/* 로그인확인 */
	public int userCheck(String user_id, String user_pw){
		int check = 0;	
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "SELECT * FROM p_member WHERE user_id = ? AND user_pw = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { check = 1; } else { check = 0;	}
			
		} catch (Exception e) {
			System.out.println("userCheck메소드에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		
		return check;
	}
	
	
	/* 수정을 위한 회원정보 불러오기 */
	public memberBean getMember(String user_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM p_member WHERE user_id = ?";
		
		memberBean mBean = new memberBean();
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mBean.setUser_name(rs.getString("user_name"));
				mBean.setUser_pw(rs.getString("user_pw"));
				mBean.setGender(rs.getString("gender"));
				mBean.setPostcode(rs.getString("addr_post"));
				mBean.setAddress(rs.getString("addr_01"));
				mBean.setAddress2(rs.getString("addr_02"));
				mBean.setPhoneNum1(rs.getString("phoneNum"));
				mBean.setBirthY(rs.getString("birth"));
				mBean.setEmail_id(rs.getString("email"));
				mBean.setMember_grade(rs.getInt("member_grade"));
				mBean.setReg_date(rs.getTimestamp("reg_date"));
			}
			
		} catch(Exception err){
			System.out.println("getMember메소드에서 오류: "+err);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return mBean;
	}
	
	
	/* 회원수정 */
	public int modiMember(memberBean mBean){
		int modi = 0;	//수정되면 1
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		String sql = "";
		
		try {
			con = getConnection();

			sql = "UPDATE p_member SET user_pw=?, user_name=?, gender=?, birth=?, email=?, addr_post=?, addr_01=?, addr_02=?, phoneNum=? WHERE user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mBean.getUser_pw());
			pstmt.setString(2, mBean.getUser_name());
			pstmt.setString(3, mBean.getGender());
			pstmt.setString(4, mBean.getBirthY()+"-"+mBean.getBirthM()+"-"+mBean.getBirthD());
			pstmt.setString(5, mBean.getEmail_id()+"@"+mBean.getEmailAddr());
			pstmt.setString(6, mBean.getPostcode());
			pstmt.setString(7, mBean.getAddress());
			pstmt.setString(8, mBean.getAddress2());
			pstmt.setString(9, mBean.getPhoneNum1()+"-"+mBean.getPhoneNum2()+"-"+mBean.getPhoneNum3());
			pstmt.setString(10, mBean.getUser_id());
			
			int rs = pstmt.executeUpdate();
			
			modi = 1;
			
		} catch (Exception err) {
			System.out.println("modiMember에서 오류: "+err);
			
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
		
		return modi;
	}
	
	
	/* 회원삭제 메소드 */
	public int delMember(String user_id){
		int del = 0;	//삭제되면 1
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			sql = "DELETE FROM p_member WHERE user_id = ?";
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, user_id);
			
			pstmt.executeUpdate();
			del = 1;
			
		} catch(Exception err){
			System.out.println("delMember메소드에서 오류: "+err);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); } }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); } }
		}
		
		return del;
	}
}
