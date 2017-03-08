package Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.Dbaccess;
import Product.prodDAO;
import Product.prodDTO;

public class OrderDAO extends Dbaccess{
	
	public void insertCart(prodDTO pdto, String id){
		
		int num = 0;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
		
		try {
			con = ds.getConnection();
			sql = "select max(sc_num) from selected_product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1)+1;
			}else{
				num = 1;
			}
			
			sql = "insert into selected_product values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, id);
				pstmt.setString(3, pdto.getPr_pro_code());
				pstmt.setInt(4, 1);
				pstmt.setString(5, sf.format(System.currentTimeMillis()));
				pstmt.setInt(6, 0);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		
	}
public void updateCart(prodDTO pdto, String id){	
		try {
			con = ds.getConnection();
			sql = "update selected_product set sc_pro_cnt = sc_pro_cnt+1 where sc_id=? and sc_pro_code=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pdto.getPr_pro_code());	
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		
	}
	
	public int CheckCart(prodDTO pdto, String id){
		int check = 0;
		try {
			con = ds.getConnection();
			sql = "select * from selected_product where sc_id = ? and sc_pro_code=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pdto.getPr_pro_code());
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = 0;
			}else{
				check = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return check;
	}
	
	public List<prodDTO> getAllCart(String id){
		List<prodDTO> list = new ArrayList<>();
		try {
			con = ds.getConnection();
			sql = "select * from selected_product where sc_id =?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();	
			while(rs.next()){
				prodDTO pdto = new prodDTO();
				prodDAO pdao = new prodDAO();
				pdto = pdao.getOneItem(rs.getString("sc_pro_code"));
				pdto.setSc_pro_cnt(rs.getInt("sc_pro_cnt"));
				pdto.setSc_num(rs.getInt("sc_num"));
				pdto.setPr_pro_code(rs.getString("sc_pro_code"));
				list.add(pdto);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return list;
	}
	
	
	public OrderCartDTO getOrderList(String id, String pr_pro_code){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		OrderCartDTO orderList = new OrderCartDTO();
		
		try {
			con = ds.getConnection();
			sql = "SELECT * FROM product a, product_img b, selected_product c where a.pr_pro_code = b.pi_pro_code AND b.pi_pro_code = c.sc_pro_code "
					+ "AND sc_id = ? AND pr_pro_code = ? AND image_use = 'main'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pr_pro_code);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				prodDTO pDto = new prodDTO();
				pDto.setPr_pro_code(rs.getString("sc_pro_code"));
				pDto.setPr_price(rs.getInt("pr_price"));
				pDto.setSc_pro_cnt(rs.getInt("sc_pro_cnt"));
				pDto.setSc_num(rs.getInt("sc_num"));
				
			}
			
			
		} catch (Exception e) {
			System.out.println("getOrderList에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		
		return orderList;
	}
	
	
	public int updateCount(String id, int upCount, String sc_pro_code){
		int cnt = 0;
		try {
			con = ds.getConnection();
			sql = "update selected_product set sc_pro_cnt=? where sc_id=? and sc_pro_code=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, upCount);
				pstmt.setString(2, id);
				pstmt.setString(3, sc_pro_code);
			pstmt.executeUpdate();
			
			sql = "select sc_pro_cnt from selected_product where sc_id=? and sc_pro_code=?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, sc_pro_code);
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

	public void cart_delete(String id, String[] check) {
		try {
			con = ds.getConnection();
			for(int i = 0; i<check.length; i++){
				sql = "delete from selected_product where sc_num=? and sc_id=?";
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
	
	public void cart_delete(String id, String code) {
		try {
			con = ds.getConnection();
			
				sql = "delete from selected_product where sc_num=? and sc_id=?";
				pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(code));
					pstmt.setString(2, id);
				pstmt.executeUpdate();
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
	}
	
	
	public OrderCartDTO getOneCartCnt(String id, String code){
		OrderCartDTO ocdto = new OrderCartDTO();
		try {
			con = ds.getConnection();
			sql = "select * from selected_product where sc_id = ? and sc_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, code);				
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ocdto.setSc_id(id);
				ocdto.setSc_num(rs.getInt("sc_num"));
				ocdto.setSc_order_num(rs.getInt("sc_order_num"));
				ocdto.setSc_pro_cnt(rs.getInt("sc_pro_cnt"));
				ocdto.setSc_pro_code(rs.getString("sc_pro_code"));
				ocdto.setSc_reg_date(rs.getString("sc_reg_date"));
			}
				
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		} return ocdto;
	}
	
	
	public List<prodDTO> getSelectCart(String id){
		List<prodDTO> list = new ArrayList<>();
		prodDTO pdto = new prodDTO();
		prodDAO pdao = new prodDAO();
		
		try {
			con = ds.getConnection();
			sql = "select * from selected_product where sc_id =?";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();	
			while(rs.next()){
				pdto = pdao.getOneItem(rs.getString("sc_pro_code"));
				pdto.setSc_pro_cnt(rs.getInt("sc_pro_cnt"));
				pdto.setSc_num(rs.getInt("sc_num"));
				list.add(pdto);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return list;
	}
	
	
	public void orderform_delete(String id, String[] check) {
		try {
			con = ds.getConnection();
			for(int i = 0; i<check.length; i++){
				sql = "delete from selected_product where sc_num=? and sc_id=?";
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
	
	public void orderform_delete(String id, String code) {
		try {
			con = ds.getConnection();
			
				sql = "delete from selected_product where sc_num=? and sc_id=?";
				pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(code));
					pstmt.setString(2, id);
				pstmt.executeUpdate();
			
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
	}
	
	public void insertOrderList(HttpServletRequest request, HttpServletResponse response){
		
		int or_num = 0;
		
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
			
			con = ds.getConnection();
			
			sql="select max(or_num) from order_pro";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				or_num=rs.getInt(1)+1;
			}
			
			
			
			sql = "insert into order_pro(or_id, or_num, or_date, or_invoice, or_sender_name, or_sender_addr, or_sender_otel, or_sender_mtel, or_sender_email,"
					+ "or_taker_name, or_taker_addr, or_taker_otel, or_taker_mtel, or_taker_msg, or_totalprice, or_usingcoupon, or_realpayprice, or_payername, or_bankinfo) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
				
				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("id");
				
				String or_sender_addr = request.getParameter("address1")+"/"+request.getParameter("address2")+"/"+request.getParameter("address3");
				String or_taker_addr = request.getParameter("or_taker_addr1")+"/"+request.getParameter("or_taker_addr2")+"/"+request.getParameter("or_taker_addr3");
				
				String or_invoice = "택배회사지정";

				/*테스트*/
				/*
				System.out.println(session.getAttribute("or_sender_name"));
				*/
				pstmt.setString(1, id);
				pstmt.setInt(2, or_num);
				pstmt.setString(3, s.format(ts));
				pstmt.setString(4, or_invoice);
				pstmt.setString(5, request.getParameter("or_sender_name"));
				pstmt.setString(6, or_sender_addr);
				pstmt.setString(7, request.getParameter("or_sender_otel"));
				pstmt.setString(8, request.getParameter("or_sender_mtel"));
				pstmt.setString(9, request.getParameter("or_sender_email"));
				pstmt.setString(10, request.getParameter("or_taker_name"));
				pstmt.setString(11, or_taker_addr);
				pstmt.setString(12, request.getParameter("or_taker_otel"));
				pstmt.setString(13, request.getParameter("or_taker_mtel"));
				pstmt.setString(14, request.getParameter("or_taker_msg"));
				pstmt.setString(15, request.getParameter("or_totalprice"));
				pstmt.setString(16, request.getParameter("or_usingcoupon"));
				pstmt.setString(17, request.getParameter("or_realpayprice"));
				pstmt.setString(18, request.getParameter("or_payername"));
				pstmt.setString(19, request.getParameter("or_bankinfo"));
				
				
				pstmt.executeUpdate();
				
				request.setAttribute("or_num", or_num);
				
		} catch (Exception e) {
			System.out.println("insertOrderList에서 오류"+e);
		} finally {
			freeResource();
		}

		
	}
	public int getOrderCount() {
		int count = 0;
		
		try{
			con= ds.getConnection();
			sql="select count(*) from order_pro";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
			
		} catch (Exception e){
			System.out.println("OrderCount에서 오류"+e);
		} finally {
			freeResource();
		}
		return count;
	}
	public List<OrderDTO> getOr_historyList(int startRow, int pageSize) {
		
		List<OrderDTO> HistoryList = new ArrayList<>();
		
		try{
			con = ds.getConnection();
			
			sql="select * from order_pro order by or_date DESC limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs=pstmt.executeQuery();
			
			OrderDAO odao = new OrderDAO();
			
			while(rs.next()){
				OrderDTO od = new OrderDTO();
				od.setOr_id(rs.getString("or_id"));
				od.setOr_num(rs.getInt("or_num"));
				od.setOr_date(rs.getString("or_date"));
				od.setOr_invoice(rs.getString("or_invoice"));
				od.setOr_sender_name(rs.getString("or_sender_name"));
				od.setOr_sender_addr(rs.getString("or_sender_addr"));
				od.setOr_sender_otel(rs.getString("or_sender_mtel"));
				od.setOr_sender_mtel(rs.getString("or_sender_mtel"));
				od.setOr_sender_email(rs.getString("or_sender_email"));
				od.setOr_taker_name(rs.getString("or_taker_name"));
				od.setOr_taker_addr(rs.getString("or_taker_addr"));
				od.setOr_taker_otel(rs.getString("or_taker_otel"));
				od.setOr_taker_mtel(rs.getString("or_taker_mtel"));
				od.setOr_taker_msg(rs.getString("or_taker_msg"));
				od.setOr_totalprice(rs.getString("or_totalprice"));
				od.setOr_usingcoupon(rs.getString("or_usingcoupon"));
				od.setOr_realpayprice(rs.getString("or_realpayprice"));
				od.setOr_payername(rs.getString("or_payername"));
				od.setOr_bankinfo(rs.getString("or_bankinfo"));
				HistoryList.add(od);
				}
			} catch (Exception e){
				System.out.println("getOr_historyList(int startRow, int pageSize)에서 오류"+e);
			} finally {
				freeResource();
			}
			return HistoryList;
		}
	

public List<OrderDTO> getOr_historyList(int startRow, int pageSize, String id) {
	
	List<OrderDTO> HistoryList = new ArrayList<>();
	
	try{
		con = ds.getConnection();
		
		sql="select * from order_pro where or_id=? order by or_date DESC limit ?,?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setInt(2, startRow-1);
		pstmt.setInt(3, pageSize);
		
		rs=pstmt.executeQuery();
		
		OrderDAO odao = new OrderDAO();
		
		while(rs.next()){
			OrderDTO od = new OrderDTO();
			od.setOr_id(rs.getString("or_id"));
			od.setOr_num(rs.getInt("or_num"));
			od.setOr_date(rs.getString("or_date"));
			od.setOr_invoice(rs.getString("or_invoice"));
			od.setOr_sender_name(rs.getString("or_sender_name"));
			od.setOr_sender_addr(rs.getString("or_sender_addr"));
			od.setOr_sender_otel(rs.getString("or_sender_mtel"));
			od.setOr_sender_mtel(rs.getString("or_sender_mtel"));
			od.setOr_sender_email(rs.getString("or_sender_email"));
			od.setOr_taker_name(rs.getString("or_taker_name"));
			od.setOr_taker_addr(rs.getString("or_taker_addr"));
			od.setOr_taker_otel(rs.getString("or_taker_otel"));
			od.setOr_taker_mtel(rs.getString("or_taker_mtel"));
			od.setOr_taker_msg(rs.getString("or_taker_msg"));
			od.setOr_totalprice(rs.getString("or_totalprice"));
			od.setOr_usingcoupon(rs.getString("or_usingcoupon"));
			od.setOr_realpayprice(rs.getString("or_realpayprice"));
			od.setOr_payername(rs.getString("or_payername"));
			od.setOr_bankinfo(rs.getString("or_bankinfo"));
			HistoryList.add(od);
			}
		} catch (Exception e){
			System.out.println("getOr_historyList(int startRow, int pageSize)에서 오류"+e);
		} finally {
			freeResource();
		}
		return HistoryList;
	}
}

