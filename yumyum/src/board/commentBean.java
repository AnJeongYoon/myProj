package board;

import java.sql.Timestamp;

public class commentBean {
	private int no;
	private int boardNum;
	private String user_id;
	private String user_name;
	private String ip;
	private String comment;
	private Timestamp reg_date;
	private int comm_group;
	private int comm_seq;
	private int comm_lev;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getComm_group() {
		return comm_group;
	}
	public void setComm_group(int comm_group) {
		this.comm_group = comm_group;
	}
	public int getComm_seq() {
		return comm_seq;
	}
	public void setComm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}
	public int getComm_lev() {
		return comm_lev;
	}
	public void setComm_lev(int comm_lev) {
		this.comm_lev = comm_lev;
	}
	
}
