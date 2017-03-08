package Member;


import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Admin.coupon.Admin_couponDTO;

public class MemberDAO extends Dbaccess{
	
	public int insertMember(HttpServletRequest request, HttpServletResponse response){
		int check = 0;
		
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
			
			con = ds.getConnection();
			sql = "insert into member(mb_id, mb_pass, mb_name, mb_addr, mb_tel, mb_email, "
					+ "mb_gender, mb_brith_date, mb_join_date, mb_last_login, mb_buy_cnt, mb_grade, mb_mobile, mb_status) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
				String addr = request.getParameter("address1")+"/"+request.getParameter("address2")+"/"+request.getParameter("address3");
				
				pstmt.setString(1, request.getParameter("id"));
				pstmt.setString(2, request.getParameter("pass"));
				pstmt.setString(3, request.getParameter("name"));
				pstmt.setString(4, addr);
				pstmt.setString(5, request.getParameter("tel"));
				pstmt.setString(6, request.getParameter("email"));
				pstmt.setString(7, request.getParameter("gender"));
				pstmt.setString(8, request.getParameter("yyyy"));
				pstmt.setString(9, s.format(ts));
				pstmt.setString(10, s.format(ts));
				pstmt.setInt(11, 0);
				pstmt.setString(12, "D");
				pstmt.setString(13, request.getParameter("mobile"));
				if(request.getParameter("id").equals("admin")){
					pstmt.setString(14, "관리자");
				}else{
					pstmt.setString(14, "일반회원");
				}
				
			check = pstmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
			check = 0;
		} finally {
			freeResource();
		}

		
		return check;
	}
	
	public MemberDTO loadMemInfo(String id){
		MemberDTO mdto = new MemberDTO();
		try {
			con = ds.getConnection();
			sql = "select * from member where mb_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				mdto.setMb_id(rs.getString("mb_id"));
				mdto.setMb_addr(rs.getString("mb_addr"));
				mdto.setMb_brith_date(rs.getString("Mb_brith_date"));
				mdto.setMb_buy_cnt(rs.getInt("Mb_buy_cnt"));
				mdto.setMb_email(rs.getString("mb_email"));
				mdto.setMb_gender(rs.getString("mb_gender"));
				mdto.setMb_grade(rs.getString("mb_grade"));
				mdto.setMb_join_date(rs.getString("mb_join_date"));
				mdto.setMb_last_login(rs.getString("mb_last_login"));
				mdto.setMb_pass(rs.getString("mb_pass"));
				mdto.setMb_mobile(rs.getString("mb_mobile"));
				mdto.setMb_name(rs.getString("mb_name"));
				mdto.setMb_tel(rs.getString("mb_tel"));
				mdto.setMb_status(rs.getString("mb_status"));
				
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		} return mdto;
	}

	public int updateMember(String id, HttpServletRequest request) {
		int check = 0;
		try {
			String addr = "";
			String pass = "";
			String status = "";
			MemberDTO mdto = loadMemInfo(id);
			
			if(request.getParameter("address1")==null){
				addr = request.getParameter("addr");				
				pass = mdto.getMb_pass();			
				status = request.getParameter("mb_status");
			}else{
				addr = request.getParameter("address1")+"/"+request.getParameter("address2")+"/"+request.getParameter("address3");
				pass = request.getParameter("pass");
				status = mdto.getMb_status();				
			}
			con = ds.getConnection();
			sql = "update member set mb_pass=?, mb_name=?, mb_addr=?, mb_tel=?, "
					+ "mb_email=?, mb_gender=?, mb_brith_date=?, mb_join_date=?, "
					+ "mb_last_login=?, mb_buy_cnt=?, mb_grade=?, mb_mobile=?, mb_status=? where mb_id=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pass);
				pstmt.setString(2, request.getParameter("name"));
				pstmt.setString(3, addr);
				pstmt.setString(4, request.getParameter("tel"));
				pstmt.setString(5, request.getParameter("email"));
				pstmt.setString(6, request.getParameter("gender"));
				pstmt.setString(7, request.getParameter("yyyy"));
				pstmt.setString(8, request.getParameter("join_date"));
				pstmt.setString(9, request.getParameter("last_login"));
				pstmt.setInt(10, Integer.parseInt(request.getParameter("buy_cnt")));
				pstmt.setString(11, request.getParameter("grade"));
				pstmt.setString(12, request.getParameter("mobile"));
				pstmt.setString(13, status);
				pstmt.setString(14, id);
				
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		
		return check;
	}
	
	
	public int do_login(HttpServletRequest request, HttpServletResponse response){
		int check = 0;
		
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			con = ds.getConnection();
			sql = "select mb_id from member where mb_id ='"+request.getParameter("login_id")+"'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
		   
			if(rs.next()){
				sql = "select mb_pass from member where mb_id='"+request.getParameter("login_id")+"'";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					if(rs.getString("mb_pass").equals(request.getParameter("login_pass"))){
						check = 1;	
					}else{
						check = 0;
					}
				}
			}else{
				check = -1;
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return check;
	}
	public void log_date(String id){
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			con = ds.getConnection();
			sql = "update member set mb_last_login=? where mb_id=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, s.format(ts));
				pstmt.setString(2, id);
			pstmt.executeUpdate();
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
	}
	
	public int idcheck(HttpServletRequest request, HttpServletResponse response){
		int check = 0;
		try {
			con = ds.getConnection();
			sql = "select mb_id from member where mb_id =?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("id"));
			rs = pstmt.executeQuery();
			if(rs.next()){
				System.out.println(rs.getString("mb_id"));
				check = 1;
			}else{
				check = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return check;
	}
	
	int startPageNo = 0;
	int pageSize = 0;
	
	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void insert_FirstPoint(String id) {
		try {
			int num = 0;
			con = ds.getConnection();
			sql = "select max(pt_num) from point";
			pstmt = con.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1)+1;
			}else{
				num = 1;
			}
			
			sql = "insert into point(pt_num, pt_id, pt_money, pt_regdate, pt_duedate, pt_content, pt_used) value(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			pstmt.setInt(3, 2000);
			
			

			Calendar cal = Calendar.getInstance();
			Calendar cal2 = Calendar.getInstance();
			cal.setTime(new Date());
			cal2.setTime(new Date());
			cal2.add(Calendar.YEAR, 1);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			
			pstmt.setString(4, sf.format(cal.getTime()));
			pstmt.setString(5, sf.format(cal2.getTime()));
			pstmt.setString(6, "신규회원 적립금");
			pstmt.setString(7, "false");
		
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
	}

	public ArrayList<Member_PointDTO> loadMPoint(String id) {
		ArrayList<Member_PointDTO> list = new ArrayList<>();
		
		try {
			
			con = ds.getConnection();
			sql = "select * from point where pt_id = ? order by pt_regdate limit ?,?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, (startPageNo-1)*pageSize);
				pstmt.setInt(3, (pageSize));
				
			rs = pstmt.executeQuery();
			while(rs.next()){
				Member_PointDTO mpdto = new Member_PointDTO();
				mpdto.setPt_num(rs.getInt(1));
				mpdto.setPt_id(rs.getString(2));
				mpdto.setPt_money(rs.getInt(3));
				mpdto.setPt_regdate(rs.getString(4));
				mpdto.setPt_duedate(rs.getString(5));
				mpdto.setPt_content(rs.getString(6));
				mpdto.setPt_used(rs.getString(7));
				mpdto.setPt_or_num(rs.getInt(8));
				list.add(mpdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return list;
	}
	
	
	public int total_point(String id){
		int total=0;
		try {			
			con = ds.getConnection();
			sql = "select sum(pt_money) from point where pt_id=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				total = rs.getInt(1);
				
			}else{
				total = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
			
		return total;
	}
	
	public int used_point(String id){
		int used = 0;
		try {
			con = ds.getConnection();
			sql = "select sum(pt_money) from point where pt_id=? and pt_used='true'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				used = rs.getInt(1);				
			}else{
				used = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return used;
	}
	public int refund_point(String id){
		int refund = 0;
		try {
			con = ds.getConnection();
			sql = "select sum(pt_money) from point where pt_id=? and pt_used='refund'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				refund = rs.getInt(1);				
			}else{
				refund = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return refund;
	}
	public int will_point(String id){
		int will = 0;
		try {
			con = ds.getConnection();
			sql = "select sum(pt_money) from point where pt_id=? and pt_used='will'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				will = rs.getInt(1);				
			}else{
				will = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return will;
	}
	public int point_count(String id){
		int cnt = 0;
		try {
			con = ds.getConnection();
			sql = "select count(*) from point where pt_id = ?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			freeResource();
		}
		return cnt;
	}
	
	public void checkPointDate(String id){
		Date date = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = sd.format(date);
		//System.out.println(nowdate.compareTo(nowdate));
		try {
			con = ds.getConnection();
			sql = "select pt_duedate, pt_content, pt_used from point where pt_id=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Date date2 = sd.parse(rs.getString(1));
				String duedate = sd.format(date2);
				String Excontent = rs.getString(2);
				//System.out.println("no"+nowdate);
				//System.out.println("du"+duedate);
				
				if(nowdate.compareTo(duedate)>0){
					if(!rs.getString(3).equals("expiration")){

						sql = "update point set pt_money=?, pt_content=?, pt_used=? where pt_id=? and pt_duedate = ?";
						pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, 0);
							pstmt.setString(2, Excontent+"(기간만료)");
							pstmt.setString(3, "expiration");
							pstmt.setString(4, id);
							pstmt.setString(5, duedate);
						pstmt.executeUpdate();	
					}
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
	}
	
	public List<Member_DeliveryDTO> getDeliveryAddr(String id){
		List<Member_DeliveryDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			sql = "select * from delivery where de_id=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Member_DeliveryDTO mddto = new Member_DeliveryDTO();
				mddto.setDe_addr(rs.getString("de_addr").replace("-", " "));
				mddto.setDe_id(id);
				mddto.setDe_mobile(rs.getString("de_mobile"));
				mddto.setDe_name(rs.getString("de_name"));
				mddto.setDe_num(rs.getInt("de_num"));
				mddto.setDe_place_name(rs.getString("de_place_name"));
				mddto.setDe_tel(rs.getString("de_tel"));
				list.add(mddto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return list;
	}
	public Member_DeliveryDTO getDeliveryAddr(String id, int de_num){
		Member_DeliveryDTO mddto = new Member_DeliveryDTO();
		try {
			con = ds.getConnection();
			sql = "select * from delivery where de_id=? and de_num=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, de_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				mddto.setDe_addr(rs.getString("de_addr"));
				mddto.setDe_id(id);
				mddto.setDe_mobile(rs.getString("de_mobile"));
				mddto.setDe_name(rs.getString("de_name"));
				mddto.setDe_num(rs.getInt("de_num"));
				mddto.setDe_place_name(rs.getString("de_place_name"));
				mddto.setDe_tel(rs.getString("de_tel"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return mddto;
	}
	
	public int insertDeliveryAddr(String id, HttpServletRequest req, HttpServletResponse resp){
		int check = 0;
		int de_num = 0;
		String de_addr = req.getParameter("address1")+"-"+req.getParameter("address2")+"-"+req.getParameter("address3");
		try {
			con = ds.getConnection();
			sql = "select max(de_num) from delivery";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				de_num = rs.getInt(1)+1;
			}else{
				de_num = 1;
			}
			sql = "insert into delivery values(?,?,?,?,?,?,?)";	
			pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, de_num);
				pstmt.setString(2, id);
				pstmt.setString(3, req.getParameter("de_place_name"));
				pstmt.setString(4, req.getParameter("de_name"));
				pstmt.setString(5, req.getParameter("de_tel"));
				pstmt.setString(6, req.getParameter("de_mobile"));
				pstmt.setString(7, de_addr);
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		} return check;
	}

	public void deleteDelivery(String id, String[] check) {
		try {
			con = ds.getConnection();
			for(int i = 0; i<check.length; i++){
				sql = "delete from delivery where de_num=? and de_id=?";
				pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(check[i]));
					pstmt.setString(2, id);
				pstmt.executeUpdate();	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		
	}

	public void ModifyDelivery(String id, HttpServletRequest req, HttpServletResponse resp) {
		try {
			String de_addr = req.getParameter("address1")+"-"+req.getParameter("address2")+"-"+req.getParameter("address3");
			con = ds.getConnection();
			sql = "update delivery set de_place_name=?, de_name=?, de_tel=?, de_mobile=?, de_addr=? where de_id=? and de_num=?";
			pstmt = con.prepareStatement(sql);			
				pstmt.setInt(7, Integer.parseInt(req.getParameter("de_num")));
				pstmt.setString(6, id);
				pstmt.setString(1, req.getParameter("de_place_name"));
				pstmt.setString(2, req.getParameter("de_name"));
				pstmt.setString(3, req.getParameter("de_tel"));
				pstmt.setString(4, req.getParameter("de_mobile"));
				pstmt.setString(5, de_addr);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
	}

	public int getDeliveryCount(String id) {
		int count = 0;
		try {
			con = ds.getConnection();
			sql = "select count(*) from delivery where de_id=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return count;
	}

	public List<Member_CouponDTO> getCouponList(String id) {
		List<Member_CouponDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			sql = "select cp_id, cp_regdate, cp_usedate, a.ad_cp_no, ad_cp_regnum, ad_cp_price, ad_cp_num_of_person, ad_cp_limit_price, ad_cp_duedate, ad_cp_content, ad_cp_check"
					+ " from coupon a join admin_coupon b "
					+ "on a.ad_cp_no = b.ad_cp_no where cp_id =? order by b.ad_cp_no limit ?,?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, (startPageNo-1)*pageSize);
				pstmt.setInt(3, (pageSize));
				System.out.println(startPageNo);
				System.out.println(pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Member_CouponDTO mcdto = new Member_CouponDTO();
				mcdto.setCp_check(rs.getString("ad_cp_check"));
				mcdto.setCp_duedate(rs.getString("ad_cp_duedate"));
				mcdto.setCp_id(rs.getString("cp_id"));
				mcdto.setCp_limit_price(rs.getInt("ad_cp_limit_price"));
				mcdto.setCp_content(rs.getString("ad_cp_content"));
				mcdto.setAd_cp_no(rs.getInt("ad_cp_no"));
				mcdto.setCp_regnum(rs.getString("ad_cp_regnum"));
				mcdto.setCp_price(rs.getInt("ad_cp_price"));
				mcdto.setCp_regdate(rs.getString("cp_regdate"));
				mcdto.setCp_usedate(rs.getString("cp_usedate"));
				list.add(mcdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		} return list;
	}

	/*public String getadmin_cp_num() {
		String cp_num = "";
		try {
			con = ds.getConnection();
			sql = "select ad_cp_number from admin_coupon";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cp_num = rs.getString(1);
			}else{
				cp_num = "none";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return cp_num;
	}*/

	public int insert_coupon(String id, Admin_couponDTO adto) {
		int check = 0;
		try {
			
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			
			con = ds.getConnection();
			sql = "select ad_cp_no from coupon where cp_id=? and ad_cp_no=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, adto.getAd_cp_no());
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = 0;			
			}else{		
				sql = "insert into coupon values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);
			
					pstmt.setString(1, id);
					//만료일
					pstmt.setString(2, sf.format(date));
					//사용일 초기값 null
					pstmt.setString(3, null);			
					pstmt.setInt(4, adto.getAd_cp_no());
					
				check = pstmt.executeUpdate();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		} return check;
		
	}
	public int Coupon_count(String id){
		int cnt = 0;
		try {
			con = ds.getConnection();
			sql = "select count(*) from coupon where cp_id = ?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		} return cnt;
	}
	public int used_coupon(String id){
		int cnt = 0;
		try {
			con = ds.getConnection();
			sql = "select count(*) from coupon where cp_id=? and cp_usedate <> ?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, null);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		} return cnt;
	}
	
	public void CheckCouponDate(String id){
		Date date = new Date();
		int ad_cp_no = 0;
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = sd.format(date);
		//System.out.println(nowdate.compareTo(nowdate));
		try {
			con = ds.getConnection();
			sql = "select b.ad_cp_duedate, b.ad_cp_no from coupon a left join admin_coupon b on a.ad_cp_no = b.ad_cp_no where a.cp_id=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Date date2 = sd.parse(rs.getString(1));
				String duedate = sd.format(date2);
				
				if(nowdate.compareTo(duedate)>0){
					ad_cp_no = rs.getInt("ad_cp_no");
					sql = "update coupon set cp_usedate=? where cp_id=? and ad_cp_no=?";
					pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "기간만료");						
						pstmt.setString(2, id);			
						pstmt.setInt(3, ad_cp_no);
					pstmt.executeUpdate();	
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
	}
}
