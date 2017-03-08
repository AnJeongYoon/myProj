package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Dbaccess {
	public Connection con;
	public DataSource ds;
	public PreparedStatement pstmt;
	public ResultSet rs;
	public String sql;
	
	public void freeResource(){
		if(con !=null){
			try {con.close();} catch (SQLException e) {e.printStackTrace();}}
		if(rs !=null){
			try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
		if(pstmt !=null){
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
	
	}
	public Dbaccess() {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/shopping");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	
}
