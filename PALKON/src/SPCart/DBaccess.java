//1월 11일 파일 생성
//1월 11일 코딩 완료

package SPCart;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.jdbc.Connection;

public class DBaccess {
	
	Connection con;
	DataSource ds;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	public void freeResource(){
		if(con != null){
			try{con.close();} catch(SQLException e) {e.printStackTrace();}}
		if(rs != null){
			try{rs.close();} catch(SQLException e) {e.printStackTrace();}}
		if(pstmt != null){
			try{pstmt.close();} catch(SQLException e) {e.printStackTrace();}}

	}
	
	public DBaccess() {
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/shopping");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
