package Order;

public class OrderDTO {

	private String or_id; //주문자 아이디
	private int or_num; //주문 번호
	private String or_date; //주문 날짜
	private String or_invoice; //송장번호

	//주문자가 입력한 값에 따라 결정되는 값들
	private String or_sender_name; //주문하시는 분 이름
	private String or_sender_addr; //주문자의 주소
	private String or_sender_otel; //주문자의 일반전화
	private String or_sender_mtel; //주문자의 휴대전화
	private String or_sender_email; //주문자의 이메일

	private String or_taker_name; //받으시는 분 이름
	private String or_taker_addr; //받으시는 분 주소
	private String or_taker_otel; //받으시는 분 일반전화
	private String or_taker_mtel; //받으시는 분 휴대전화
	private String or_taker_msg; //배송메세지

	private String or_totalprice; //총 주문 금액
	private String or_usingcoupon; // 주문자가 사용하는 쿠폰
	private String or_usingpoint; //주문자가 사용하는 적립금포인트
	private String or_realpayprice; //주문자가 실제로 결제한 총금액
	private String or_payername;//입금자 이름
	private String or_bankinfo; //주문자가 입금할 은행, 계좌정보, 입금자 
	public String getOr_id() {
		return or_id;
	}
	public void setOr_id(String or_id) {
		this.or_id = or_id;
	}
	public int getOr_num() {
		return or_num;
	}
	public void setOr_num(int or_num) {
		this.or_num = or_num;
	}
	public String getOr_date() {
		return or_date;
	}
	public void setOr_date(String or_date) {
		this.or_date = or_date;
	}
	public String getOr_invoice() {
		return or_invoice;
	}
	public void setOr_invoice(String or_invoice) {
		this.or_invoice = or_invoice;
	}
	public String getOr_sender_name() {
		return or_sender_name;
	}
	public void setOr_sender_name(String or_sender_name) {
		this.or_sender_name = or_sender_name;
	}
	public String getOr_sender_addr() {
		return or_sender_addr;
	}
	public void setOr_sender_addr(String or_sender_addr) {
		this.or_sender_addr = or_sender_addr;
	}
	public String getOr_sender_otel() {
		return or_sender_otel;
	}
	public void setOr_sender_otel(String or_sender_otel) {
		this.or_sender_otel = or_sender_otel;
	}
	public String getOr_sender_mtel() {
		return or_sender_mtel;
	}
	public void setOr_sender_mtel(String or_sender_mtel) {
		this.or_sender_mtel = or_sender_mtel;
	}
	public String getOr_sender_email() {
		return or_sender_email;
	}
	public void setOr_sender_email(String or_sender_email) {
		this.or_sender_email = or_sender_email;
	}
	public String getOr_taker_name() {
		return or_taker_name;
	}
	public void setOr_taker_name(String or_taker_name) {
		this.or_taker_name = or_taker_name;
	}
	public String getOr_taker_addr() {
		return or_taker_addr;
	}
	public void setOr_taker_addr(String or_taker_addr) {
		this.or_taker_addr = or_taker_addr;
	}
	public String getOr_taker_otel() {
		return or_taker_otel;
	}
	public void setOr_taker_otel(String or_taker_otel) {
		this.or_taker_otel = or_taker_otel;
	}
	public String getOr_taker_mtel() {
		return or_taker_mtel;
	}
	public void setOr_taker_mtel(String or_taker_mtel) {
		this.or_taker_mtel = or_taker_mtel;
	}
	public String getOr_taker_msg() {
		return or_taker_msg;
	}
	public void setOr_taker_msg(String or_taker_msg) {
		this.or_taker_msg = or_taker_msg;
	}
	public String getOr_totalprice() {
		return or_totalprice;
	}
	public void setOr_totalprice(String or_totalprice) {
		this.or_totalprice = or_totalprice;
	}
	public String getOr_usingcoupon() {
		return or_usingcoupon;
	}
	public void setOr_usingcoupon(String or_usingcoupon) {
		this.or_usingcoupon = or_usingcoupon;
	}
	public String getOr_usingpoint() {
		return or_usingpoint;
	}
	public void setOr_usingpoint(String or_usingpoint) {
		this.or_usingpoint = or_usingpoint;
	}
	public String getOr_realpayprice() {
		return or_realpayprice;
	}
	public void setOr_realpayprice(String or_realpayprice) {
		this.or_realpayprice = or_realpayprice;
	}
	public String getOr_payername() {
		return or_payername;
	}
	public void setOr_payername(String or_payername) {
		this.or_payername = or_payername;
	}
	public String getOr_bankinfo() {
		return or_bankinfo;
	}
	public void setOr_bankinfo(String or_bankinfo) {
		this.or_bankinfo = or_bankinfo;
	}
	
	
}
