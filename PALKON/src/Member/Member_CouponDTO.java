package Member;

public class Member_CouponDTO {
	int ad_cp_no;
	String cp_id;
	String cp_content;
	String cp_regnum;
	
	int cp_price;
	String cp_regdate;
	String cp_duedate;
	String cp_usedate;
	String cp_check;
	int cp_limit_price;
	
	public String getCp_regnum() {
		return cp_regnum;
	}
	public void setCp_regnum(String cp_regnum) {
		this.cp_regnum = cp_regnum;
	}
	public String getCp_content() {
		return cp_content;
	}
	public void setCp_content(String cp_content) {
		this.cp_content = cp_content;
	}
	
	public int getAd_cp_no() {
		return ad_cp_no;
	}
	public void setAd_cp_no(int ad_cp_no) {
		this.ad_cp_no = ad_cp_no;
	}
	public String getCp_id() {
		return cp_id;
	}
	public void setCp_id(String cp_id) {
		this.cp_id = cp_id;
	}
	
	
	
	public int getCp_price() {
		return cp_price;
	}
	public void setCp_price(int cp_price) {
		this.cp_price = cp_price;
	}
	public String getCp_regdate() {
		return cp_regdate;
	}
	public void setCp_regdate(String cp_regdate) {
		this.cp_regdate = cp_regdate;
	}
	public String getCp_duedate() {
		return cp_duedate;
	}
	public void setCp_duedate(String cp_duedate) {
		this.cp_duedate = cp_duedate;
	}
	public String getCp_usedate() {
		return cp_usedate;
	}
	public void setCp_usedate(String cp_usedate) {
		this.cp_usedate = cp_usedate;
	}
	public String getCp_check() {
		return cp_check;
	}
	public void setCp_check(String cp_check) {
		this.cp_check = cp_check;
	}
	public int getCp_limit_price() {
		return cp_limit_price;
	}
	public void setCp_limit_price(int cp_limit_price) {
		this.cp_limit_price = cp_limit_price;
	}
	
}
