package reservation;

import java.sql.Timestamp;

public class reservBean {
	private int no;
	private String user_id;
	private String user_name;
	private String phoneNum1;
	private String phoneNum2;
	private String phoneNum3;
	private int reservY;
	private int reservM;
	private int reservD;
	private String reservTime1;
	private String reservTime2;
	private String peopleCnt;
	private String reservContent;
	private Timestamp reg_date;
	private int state;
	
	public int getNo() {
		return no;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPhoneNum1() {
		return phoneNum1;
	}
	public void setPhoneNum1(String phoneNum1) {
		this.phoneNum1 = phoneNum1;
	}
	public String getPhoneNum2() {
		return phoneNum2;
	}
	public void setPhoneNum2(String phoneNum2) {
		this.phoneNum2 = phoneNum2;
	}
	public String getPhoneNum3() {
		return phoneNum3;
	}
	public void setPhoneNum3(String phoneNum3) {
		this.phoneNum3 = phoneNum3;
	}
	public int getReservY() {
		return reservY;
	}
	public void setReservY(int reservY) {
		this.reservY = reservY;
	}
	public int getReservM() {
		return reservM;
	}
	public void setReservM(int reservM) {
		this.reservM = reservM;
	}
	public int getReservD() {
		return reservD;
	}
	public void setReservD(int reservD) {
		this.reservD = reservD;
	}
	public String getReservTime1() {
		return reservTime1;
	}
	public void setReservTime1(String reservTime1) {
		this.reservTime1 = reservTime1;
	}
	public String getReservTime2() {
		return reservTime2;
	}
	public void setReservTime2(String reservTime2) {
		this.reservTime2 = reservTime2;
	}
	public String getPeopleCnt() {
		return peopleCnt;
	}
	public void setPeopleCnt(String peopleCnt) {
		this.peopleCnt = peopleCnt;
	}
	public String getReservContent() {
		return reservContent;
	}
	public void setReservContent(String reservContent) {
		this.reservContent = reservContent;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
