package Admin.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdprodDAO {
	Connection con;
	DataSource ds;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	public void freeResource(){
		if(con !=null){
			try {con.close();} catch (SQLException e) {e.printStackTrace();}}
		if(rs !=null){
			try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
		if(pstmt !=null){
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
	}
	
	
	private Connection getConnection() throws Exception{
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/shopping");
		con = ds.getConnection();
		
		return con;
	}


	public boolean insertBoard(AdprodDTO addto) {

		
		
		System.out.println("insertboard 관리자 까지 옴!!");

		int result = 0 ;
		
		try{
			
			con=getConnection();
			sql = "insert into product (pr_pro_code,pr_product,pr_category,pr_brand,pr_price,pr_stock,"
					+ "pr_orgin,pr_color,pr_orgin_code,pr_material,pr_length,pr_status,"
					+ "pr_pro_info, pr_available,pr_discount,pr_board_num,pr_reg_date)"
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
			//image_name,
			
			/*sql="insert into product values(:pr_pro_code, :pr_product, :pr_category, :pr_brand, :pr_price,"
					+ " :pr_stock :pr_orgin :pr_color :pr_orgin_code :pr_material :pr_length "
					+ ":pr_status :pr_pro_info :image_name :pr_available :pr_discount :pr_board_num now():pr_reg_date)";
			*/
			
			pstmt= con.prepareStatement(sql);
			
			pstmt.setString(1, addto.getPr_pro_code());
			pstmt.setString(2, addto.getPr_product());
			pstmt.setString(3, addto.getPr_category());
			pstmt.setString(4, addto.getPr_brand());
			pstmt.setInt(5, addto.getPr_price());
			pstmt.setInt(6, addto.getPr_stock());
			pstmt.setString(7, addto.getPr_orgin());
			pstmt.setString(8, addto.getPr_color());
			pstmt.setString(9, addto.getPr_orgin_code());
			pstmt.setString(10, addto.getPr_material());
			pstmt.setString(11, addto.getPr_length());
			pstmt.setString(12, addto.getPr_status());
			pstmt.setString(13, addto.getPr_pro_info());
			pstmt.setString(14, addto.getPr_available());
			pstmt.setString(15, addto.getPr_discount());
			pstmt.setInt(16, addto.getPr_board_num());
			//pstmt.setString(14, addto.getImage_name());
			//pstmt.setString(18,System.currentTimeMillis());
			
			result = pstmt.executeUpdate();

			if(result == 1){
				return true;
			}
	
		}catch(Exception e){
			System.out.println("관리자 insertBoard에서 오류 "+e);
		}finally {
			freeResource();
		}

		return false; //0 리턴
		
	}//상품 등록 메소드 끝


	//상품리스트 갯수 불러오는 메소드
	public int getGoodsListCnt() {
		int count = 0;
		try {
			con = getConnection();
			String sql = "SELECT count(distinct pr_pro_code) FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
					+ "AND pr_available !='NOTAVAILABLE'";
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return count;
	}

	
	
	//상품리스트 메소드
	public List<AdprodDTO> getGoodsList(int startRow, int pageSize, String status, String category, String orderby){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		String status1 = "";
		String category1 = "";
		String orderby1 = "";
		
		List<AdprodDTO> pGoodsList = new ArrayList<AdprodDTO>();
		
		try {
			con = getConnection();
			
			if(status.equals("") && category.equals("") && orderby == null) {
				sql = "SELECT * FROM product a, product_img b WHERE image_use = 'main' AND a.pr_board_num=b.pi_board_num "
						+" ORDER BY pr_reg_date LIMIT ?, ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pageSize);
				
			} else if(!status.equals("") && !category.equals("")) {
				sql = "SELECT * FROM product a, product_img b WHERE image_use = 'main' AND a.pr_board_num=b.pi_board_num "
						+"AND pr_status = ? AND pr_category = ? ORDER BY pr_reg_date LIMIT ?, ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, status);
				pstmt.setString(2, category);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, pageSize);
				
			} else if(!status.equals("")) {
				sql = "SELECT * FROM product a, product_img b WHERE image_use = 'main' AND a.pr_board_num=b.pi_board_num "
						+"AND pr_status = ? ORDER BY pr_reg_date LIMIT ?, ?";
					
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, status);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, pageSize);
				
			} else if(!category.equals("")) {
				sql = "SELECT * FROM product a, product_img b WHERE image_use = 'main' AND a.pr_board_num=b.pi_board_num "
						+"AND pr_category = ? ORDER BY pr_reg_date LIMIT ?, ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, pageSize);
				
			} else if(orderby != null || !orderby.equals("default")) {
				sql = "SELECT * FROM product a, product_img b WHERE image_use = 'main' AND a.pr_board_num=b.pi_board_num "
						+" ORDER BY ? LIMIT ?, ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, orderby);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, pageSize);
			}
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				AdprodDTO apDto = new AdprodDTO();
				apDto.setPr_available(rs.getString("pr_available"));
				apDto.setPr_board_num(rs.getInt("pr_board_num"));
				apDto.setPr_brand(rs.getString("pr_brand"));
				apDto.setPr_buy_cnt(rs.getInt("pr_buy_cnt"));
				apDto.setPr_category(rs.getString("pr_category"));
				apDto.setPr_color(rs.getString("pr_color"));
				apDto.setPr_discount(rs.getString("pr_discount"));
				apDto.setPr_length(rs.getString("pr_length"));
				apDto.setPr_material(rs.getString("pr_material"));
				apDto.setPr_orgin(rs.getString("pr_orgin"));
				apDto.setPr_orgin_code(rs.getString("pr_orgin_code"));
				apDto.setPr_price(rs.getInt("pr_price"));
				apDto.setPr_pro_code(rs.getString("pr_pro_code"));
				apDto.setPr_pro_info(rs.getString("pr_pro_info"));
				apDto.setPr_product(rs.getString("pr_product"));
				apDto.setPr_recent_date(rs.getString("pr_recent_date"));
				apDto.setPr_reg_date(rs.getString("pr_reg_date"));
				apDto.setPr_size(rs.getString("pr_size"));
				apDto.setPr_status(rs.getString("pr_status"));
				apDto.setPr_stock(rs.getInt("pr_stock"));
				apDto.setPi_num(rs.getInt("pi_num"));
				apDto.setPi_board_num(rs.getInt("pi_board_num"));
				apDto.setPi_pro_code(rs.getString("pi_pro_code"));
				apDto.setImg_category(rs.getString("img_category"));
				apDto.setImage_size(rs.getShort("image_size"));
				apDto.setImage_path(rs.getString("image_path"));
				apDto.setImage_name(rs.getString("image_name"));
				
				pGoodsList.add(apDto);
			}
			
		} catch (Exception e) {
			System.out.println("getGoodsList에서 오류: "+e);
		} finally {
			freeResource();		
		}
			
		return pGoodsList;
	}
	
	
	//카테고리별 상품 갯수 메소드
	public int getCategoryListCnt(String category) {
		int count = 0;
		try {
			con = getConnection();
			String sql = "SELECT count(distinct pr_pro_code) FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
					+ "AND pr_category = ? AND pr_available !='NOTAVAILABLE'";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getCategoryListCnt에서 오류: "+e);
		} finally {
			freeResource();
		}
		
		return count;
	}

	
	//제품상태별 갯수 메소드
	public int getSaleListCnt(String status) {
		int count = 0;
		try {
			con = getConnection();
			String sql = "SELECT count(distinct pr_pro_code) FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
					+ "AND pr_status = ? AND pr_available !='NOTAVAILABLE'";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, status);
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getSaleListCnt에서 오류: "+e);
		} finally {
			freeResource();
		}
		
		return count;
	}


	//선택값 별 리스트 메소드
	public List<AdprodDTO> getGoodsSelectList(int startRow, int pageSize, String category, String keyField) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		List<AdprodDTO> pGoodsList = new ArrayList<AdprodDTO>();
		
		try {
			con = getConnection();
			
			if(keyField.equals("briefcase")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND pr_category = 'briefcase' AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_reg_date DESC LIMIT ?,?";
			} else if(keyField.equals("backpack")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND pr_category = 'backpack' AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_reg_date DESC LIMIT ?,?";
			} else if(keyField.equals("cross")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND pr_category = 'cross' AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_reg_date DESC LIMIT ?,?";
			} else if(keyField.equals("highPrice")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_price DESC LIMIT ?,?";
			} else if(keyField.equals("lowPrice")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_price ASC LIMIT ?,?";
			} else if(keyField.equals("sale")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND pr_status = 'sale' AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_reg_date DESC LIMIT ?,?";
			} else if(keyField.equals("preorder")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND pr_status = 'preorder' AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_reg_date DESC LIMIT ?,?";
			} else if(keyField.equals("new")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND pr_status = 'new' AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_reg_date DESC LIMIT ?,?";
			} else if(keyField.equals("highQty")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_stock DESC LIMIT ?,?";
			} else if(keyField.equals("lowQty")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_stock DESC LIMIT ?,?";
			} else if(keyField.equals("highSell")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_buy_cnt DESC LIMIT ?,?";
			} else if(keyField.equals("lowSell")){
				sql="SELECT * FROM product a, product_img b WHERE a.pr_board_num=b.pi_board_num "
						+ "AND image_name LIKE '%main%' AND pr_available !='NOTAVAILABLE' ORDER BY pr_buy_cnt DESC LIMIT ?,?";
			}
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				AdprodDTO apDto = new AdprodDTO();
				apDto.setPr_available(rs.getString("pr_available"));
				apDto.setPr_board_num(rs.getInt("pr_board_num"));
				apDto.setPr_brand(rs.getString("pr_brand"));
				apDto.setPr_buy_cnt(rs.getInt("pr_buy_cnt"));
				apDto.setPr_category(rs.getString("pr_category"));
				apDto.setPr_color(rs.getString("pr_color"));
				apDto.setPr_discount(rs.getString("pr_discount"));
				apDto.setPr_length(rs.getString("pr_length"));
				apDto.setPr_material(rs.getString("pr_material"));
				apDto.setPr_orgin(rs.getString("pr_orgin"));
				apDto.setPr_orgin_code(rs.getString("pr_orgin_code"));
				apDto.setPr_price(rs.getInt("pr_price"));
				apDto.setPr_pro_code(rs.getString("pr_pro_code"));
				apDto.setPr_pro_info(rs.getString("pr_pro_info"));
				apDto.setPr_product(rs.getString("pr_product"));
				apDto.setPr_recent_date(rs.getString("pr_recent_date"));
				apDto.setPr_reg_date(rs.getString("pr_reg_date"));
				apDto.setPr_size(rs.getString("pr_size"));
				apDto.setPr_status(rs.getString("pr_status"));
				apDto.setPr_stock(rs.getInt("pr_stock"));
				apDto.setPi_num(rs.getInt("pi_num"));
				apDto.setPi_board_num(rs.getInt("pi_board_num"));
				apDto.setPi_pro_code(rs.getString("pi_pro_code"));
				apDto.setImg_category(rs.getString("img_category"));
				apDto.setImage_size(rs.getShort("image_size"));
				apDto.setImage_path(rs.getString("image_path"));
				apDto.setImage_name(rs.getString("image_name"));
				
				pGoodsList.add(apDto);
			}
			System.out.println("sql");
		} catch (Exception e) {
			System.out.println("getGoodsSelectList에서 오류: "+e);
		} finally {
			freeResource();		
		}
			
		return pGoodsList;
	}


	//세일, 재고상태 메소드
	public List<AdprodDTO> getSaleQty(int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		List<AdprodDTO> qtyList = new ArrayList<AdprodDTO>();
		
		try {
			con = getConnection();
			sql="SELECT * FROM product a, product_img b WHERE a.pr_pro_code = b.pi_pro_code "
					+ "AND image_use LIKE '%main%' ORDER BY pr_reg_date DESC LIMIT ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				AdprodDTO apDto = new AdprodDTO();
				apDto.setPr_discount(rs.getString("pr_discount"));
				apDto.setPr_product(rs.getString("pr_product"));
				apDto.setPr_recent_date(rs.getString("pr_recent_date"));
				apDto.setPr_reg_date(rs.getString("pr_reg_date"));
				apDto.setPr_status(rs.getString("pr_status"));
				apDto.setPr_stock(rs.getInt("pr_stock"));
				apDto.setImage_path(rs.getString("image_path"));
				apDto.setImage_name(rs.getString("image_name"));
				
				qtyList.add(apDto);
			}
			
		} catch (Exception e) {
			System.out.println("getSaleQty에서 오류: "+e);
		} finally {
			freeResource();		
		}
			
		return qtyList;
	}
	
	
	//제품상태별 갯수 메소드
	public int getQtyListCnt() {
		int count = 0;
		try {
			con = getConnection();
			String sql = "SELECT count(*) FROM product a, product_img b WHERE a.pr_pro_code = b.pi_pro_code "
					+ "AND image_use LIKE '%main%' ORDER BY pi_num ASC";
			pstmt= con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getQtyListCnt에서 오류: "+e);
		} finally {
			freeResource();
		}
		
		return count;
	}


}
