package Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.*;
import javax.sql.*;

public class prodDAO {
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

	public int getProListCount(String category) {//게시판 키체고리별 리스트 갯수 

		int count = 0;
		
		try {
			con=getConnection();
			//code 중복 값 제외 
			String sql = "select count(distinct pr_pro_code) from product a inner join product_img b on a.pr_board_num=b.pi_board_num "
					+ "where pr_category=? and pr_available !='NOTAVAILABLE'";
	
		
			
			pstmt= con.prepareStatement(sql);
			
				pstmt.setString(1, category);
			
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			//System.out.println("getProListCount에서 오류 "+e);
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
	
		return count;
	}

	public List<prodDTO> getAllProList(int startRow, int pageSize, String category) {//카테고리별 리스트 뿌려주기 
		
		List<prodDTO> ProdList = new ArrayList<>();
		try{
			con =getConnection();
			
			//메인 사진만 뿌려주기 
			String sql ="select * from product a, product_img b where a.pr_board_num=b.pi_board_num and a.pr_category=? "
					+ "and image_use = 'main' and pr_available !='NOTAVAILABLE'"
					+ "order by pr_reg_date asc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			
			
			
			
			rs= pstmt.executeQuery();
			
			
			while(rs.next()){
				prodDTO bean  = new prodDTO();

				bean.setPr_board_num(rs.getInt("pr_board_num"));
				bean.setPr_pro_code(rs.getString("pr_pro_code"));
				bean.setPr_product(rs.getString("pr_product"));
				bean.setPr_size(rs.getString("pr_size"));
				bean.setPr_category(rs.getString("pr_category"));
				bean.setPr_brand(rs.getString("pr_brand"));
				bean.setPr_price(rs.getInt("pr_price"));
				bean.setPr_discount(rs.getString("pr_discount"));
				bean.setPr_buy_cnt(rs.getInt("pr_buy_cnt"));
				bean.setPr_stock(rs.getInt("pr_stock"));
				bean.setPr_color(rs.getString("pr_color"));
				bean.setPr_orgin(rs.getString("pr_orgin"));
				bean.setPr_pro_info(rs.getString("pr_pro_info"));
				bean.setPr_reg_date(rs.getString("pr_reg_date"));
				bean.setPr_recent_date(rs.getString("pr_recent_date"));
				bean.setPr_orgin(rs.getString("pr_orgin_code"));
				bean.setPi_board_num(rs.getInt("pi_board_num"));
				bean.setPi_pro_code(rs.getString("pi_pro_code"));
				bean.setImage_path(rs.getString("image_path"));
				bean.setImg_category(rs.getString("img_category"));
				bean.setImage_size(rs.getInt("image_size"));
				bean.setPi_num(rs.getInt("pi_num"));
				bean.setImage_name(rs.getString("image_name"));
				bean.setPr_status(rs.getString("pr_status"));
				bean.setPr_available(rs.getString("pr_available"));
				
				ProdList.add(bean);
				
				
			}
			
		}catch(Exception e){
			System.out.println("getAllProlist에서 오류 "+e);
			
			
		}finally {
			freeResource();
		}
		
		return ProdList;
	}//메소드 끝
	

	
	//메인 모든아이템 리스트 메소드
	public List<prodDTO> getAllItemList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		List<prodDTO> AllItemList = new ArrayList<prodDTO>();
		
		try {
			con = getConnection();
			sql = "SELECT * FROM product a, product_img b WHERE a.pr_pro_code = b.pi_pro_code "
					+ "AND image_use = 'main' AND pr_available != 'NOTAVAILABLE' ORDER BY pr_board_num DESC limit 20";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				prodDTO pDto = new prodDTO();
				pDto.setImage_path(rs.getString("image_path"));
				pDto.setImage_name(rs.getString("image_name"));
				pDto.setPr_product(rs.getString("pr_product"));
				pDto.setPr_price(rs.getInt("pr_price"));
				pDto.setPr_status(rs.getString("pr_status"));
				pDto.setPr_pro_code(rs.getString("pr_pro_code"));
				
				AllItemList.add(pDto);
			}
			
		} catch (Exception e) {
			System.out.println("getAllItemList에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		
		return AllItemList;
	}
	
	
	//메인 신상리스트 메소드
	public List<prodDTO> getNewItemList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		List<prodDTO> NewItemList = new ArrayList<prodDTO>();
		
		try {
			con = getConnection();
			sql = "SELECT * FROM product a, product_img b "
					+ "WHERE a.pr_pro_code = b.pi_pro_code AND pr_status = 'new' AND image_use = 'main' ORDER BY pi_num DESC limit 5";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				prodDTO pDto = new prodDTO();
				pDto.setImage_path(rs.getString("image_path"));
				pDto.setImage_name(rs.getString("image_name"));
				pDto.setPr_product(rs.getString("pr_product"));
				pDto.setPr_price(rs.getInt("pr_price"));
				pDto.setPr_status(rs.getString("pr_status"));
				pDto.setPr_pro_code(rs.getString("pr_pro_code"));
				
				NewItemList.add(pDto);
			}
			
		} catch (Exception e) {
			System.out.println("getNewItemList에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		
		return NewItemList;
	}
	
	
	//상품정보 가져오는 메소드
	public prodDTO getItem(String pr_pro_code){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		prodDTO pDto = null;
		
		try {
			con = getConnection();
			sql = "SELECT * FROM product a, product_img b "
					+ "WHERE a.pr_pro_code = b.pi_pro_code AND pr_pro_code = ? AND image_use = 'detail' ORDER BY pi_num ASC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pr_pro_code);
			
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				pDto = new prodDTO();
				pDto.setPr_board_num(rs.getInt("pr_board_num"));
				pDto.setPr_pro_code(rs.getString("pr_pro_code"));
				pDto.setPr_product(rs.getString("pr_product"));
				pDto.setPr_size(rs.getString("pr_size"));
				pDto.setPr_category(rs.getString("pr_category"));
				pDto.setPr_brand(rs.getString("pr_brand"));
				pDto.setPr_price(rs.getInt("pr_price"));
				pDto.setPr_discount(rs.getString("pr_discount"));
				pDto.setPr_buy_cnt(rs.getInt("pr_buy_cnt"));
				pDto.setPr_stock(rs.getInt("pr_stock"));
				pDto.setPr_orgin(rs.getString("pr_orgin"));
				pDto.setPr_color(rs.getString("pr_color"));
				pDto.setPr_pro_info(rs.getString("pr_pro_info"));
				pDto.setPi_pro_code(rs.getString("pi_pro_code"));
				pDto.setImage_path(rs.getString("image_path"));
				pDto.setImage_size(rs.getInt("image_size"));
				pDto.setImg_category(rs.getString("img_category"));
				pDto.setImage_name(rs.getString("image_name"));
				pDto.setPr_material(rs.getString("pr_material"));
				pDto.setPr_length(rs.getString("pr_length"));
				pDto.setPr_status(rs.getString("pr_status"));
				
			}
			
		} catch (Exception e) {
			System.out.println("getItem에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return pDto;
	}
	
	//상품정보 하나만 가져오는 메소드
	public prodDTO getOneItem(String pr_pro_code){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		prodDTO pDto = null;
		
		try {
			con = getConnection();
			sql = "SELECT * FROM product a, product_img b "
					+ "WHERE a.pr_pro_code = b.pi_pro_code AND pr_pro_code = ? AND image_use = 'main' ORDER BY pi_num ASC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pr_pro_code);
			
			rs = pstmt.executeQuery();	
			
			if (rs.next()) {
				pDto = new prodDTO();
				pDto.setPr_board_num(rs.getInt("pr_board_num"));
				pDto.setPr_pro_code(rs.getString("pr_pro_code"));
				pDto.setPr_product(rs.getString("pr_product"));
				pDto.setPr_size(rs.getString("pr_size"));
				pDto.setPr_category(rs.getString("pr_category"));
				pDto.setPr_brand(rs.getString("pr_brand"));
				pDto.setPr_price(rs.getInt("pr_price"));
				pDto.setPr_discount(rs.getString("pr_discount"));
				pDto.setPr_buy_cnt(rs.getInt("pr_buy_cnt"));
				pDto.setPr_stock(rs.getInt("pr_stock"));
				pDto.setPr_orgin(rs.getString("pr_orgin"));
				pDto.setPr_color(rs.getString("pr_color"));
				pDto.setPr_pro_info(rs.getString("pr_pro_info"));
				pDto.setPi_pro_code(rs.getString("pi_pro_code"));
				pDto.setImage_path(rs.getString("image_path"));
				pDto.setImage_size(rs.getInt("image_size"));
				pDto.setImg_category(rs.getString("img_category"));
				pDto.setImage_name(rs.getString("image_name"));
				pDto.setPr_material(rs.getString("pr_material"));
				pDto.setPr_length(rs.getString("pr_length"));
				pDto.setPr_status(rs.getString("pr_status"));
			}
			
		} catch (Exception e) {
			System.out.println("getOneItem에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }
		}
		
		return pDto;
	}
	
	//상품이미지 리스트 메소드
	public List<prodDTO> getImgList(String pi_pro_code){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		List<prodDTO> pImgList = new ArrayList<prodDTO>();
		
		try {
			con = getConnection();
			sql = "SELECT * FROM product_img WHERE pi_pro_code = ? AND image_use = 'detail' ORDER BY pi_num ASC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pi_pro_code);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				prodDTO pDto = new prodDTO();
				pDto.setImage_path(rs.getString("image_path"));
				pDto.setImage_name(rs.getString("image_name"));
				
				pImgList.add(pDto);
			}
			
		} catch (Exception e) {
			System.out.println("getpImgList에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		
		return pImgList;
	}
	
	
	//상품정보 이미지
	public String getInfoImg(String pi_pro_code){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		String infoImg = "";

		try {
			con = getConnection();
			
			sql = "SELECT image_path, image_name FROM product_img WHERE pi_pro_code = ? AND image_use = 'info' ORDER BY pi_num ASC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pi_pro_code);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				infoImg = rs.getString(1)+rs.getString(2);
			}
			
		} catch (Exception e) {
			System.out.println("getInfoImg에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		
		return infoImg;
	}
	
	
	
	//리뷰갯수 가져오는 메소드
	public int getReviewCnt(String rv_pro_code){
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = getConnection();
			
			sql = "SELECT count(*) FROM review WHERE rv_pro_code = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rv_pro_code);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("getReviewCnt에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		return count;
	}
	
	
	
	//인기상품 리스트 메소드
	public List<prodDTO> getPopularList(String pr_pro_code, String category){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		List<prodDTO> popularList = new ArrayList<prodDTO>();
		
		try {
			con = getConnection();
			sql = "SELECT * FROM product a, product_img b WHERE a.pr_pro_code != ? AND a.pr_board_num=b.pi_board_num "
					+ "AND image_use = 'main' AND pr_category = ? ORDER BY pr_buy_cnt DESC LIMIT 4";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pr_pro_code);
			pstmt.setString(2, category);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				prodDTO pDto = new prodDTO();
				pDto.setPr_product(rs.getString("pr_product"));
				pDto.setPr_price(rs.getInt("pr_price"));
				pDto.setImage_path(rs.getString("image_path"));
				pDto.setImage_name(rs.getString("image_name"));
				pDto.setPr_status(rs.getString("pr_status"));
				
				popularList.add(pDto);
			}
			
		} catch (Exception e) {
			System.out.println("getPopularList에서 오류: "+e);
		} finally {
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (con != null) { try { con.close(); } catch (Exception e) { e.printStackTrace(); }  }
			if (rs != null) { try { rs.close(); } catch (Exception e) { e.printStackTrace(); }  }			
		}
		
		return popularList;
	}
	
	
	

	public List<prodDTO> getAllProList(int startRow, int pageSize, String category, String keyField) { //상품정렬 메소드
		
		List<prodDTO> ProdList = new ArrayList<>();
	
		
		String sql = "";
		
		if(keyField.equals("newpro")){
			sql="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num "
					+ "where pr_category=? and image_use = 'main' and pr_available !='NOTAVAILABLE'  "
					+ "order by pr_reg_date desc limit ?,?";
		}else if(keyField.equals("highpro")){
			sql ="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num where pr_category=? "
					+ "and image_use = 'main' and pr_available !='NOTAVAILABLE'  "
					+ "order by pr_price desc limit ?,?";
		}else if(keyField.equals("lowpro")){
			sql ="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num where pr_category=? "
					+ "and image_use = 'main' and pr_available !='NOTAVAILABLE'"
					+ "order by pr_price asc limit ?,?";
		}else if(keyField.equals("namepro")){
			sql ="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num"
					+ " where pr_category=? and image_use = 'main' and pr_available !='NOTAVAILABLE' "
					+ "order by pr_product asc limit ?,?";
		}else if(keyField.equals("buypro")){
			sql ="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num"
					+ " where pr_category=? and image_use = 'main' and pr_available !='NOTAVAILABLE' "
					+ "order by pr_buy_cnt desc limit ?,?";
		}else if(keyField.equals("null")){
			sql="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num where pr_category=? "
					+ "and image_use = 'main' and pr_available !='NOTAVAILABLE'"
					+ "order by pr_reg_date desc limit ?,?";
			
		}
		
	
	try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
		
			rs= pstmt.executeQuery();
			
			
			while(rs.next()){
				prodDTO bean  = new prodDTO();

				bean.setPr_board_num(rs.getInt("pr_board_num"));
				bean.setPr_pro_code(rs.getString("pr_pro_code"));
				bean.setPr_product(rs.getString("pr_product"));
				bean.setPr_size(rs.getString("pr_size"));
				bean.setPr_category(rs.getString("pr_category"));
				bean.setPr_brand(rs.getString("pr_brand"));
				bean.setPr_price(rs.getInt("pr_price"));
				bean.setPr_discount(rs.getString("pr_discount"));
				bean.setPr_buy_cnt(rs.getInt("pr_buy_cnt"));
				bean.setPr_stock(rs.getInt("pr_stock"));
				bean.setPr_color(rs.getString("pr_color"));
				bean.setPr_orgin(rs.getString("pr_orgin"));
				bean.setPr_pro_info(rs.getString("pr_pro_info"));
				bean.setPr_reg_date(rs.getString("pr_reg_date"));
				bean.setPr_recent_date(rs.getString("pr_recent_date"));
				bean.setPr_orgin(rs.getString("pr_orgin_code"));
				bean.setPi_board_num(rs.getInt("pi_board_num"));
				bean.setPi_pro_code(rs.getString("pi_pro_code"));
				bean.setImage_path(rs.getString("image_path"));
				bean.setImg_category(rs.getString("img_category"));
				bean.setImage_size(rs.getInt("image_size"));
				bean.setPi_num(rs.getInt("pi_num"));
				bean.setImage_name(rs.getString("image_name"));
				bean.setPr_material(rs.getString("pr_material"));
				bean.setPr_length(rs.getString("pr_length"));
				bean.setPr_status(rs.getString("pr_status"));
				bean.setPr_available(rs.getString("pr_available"));
				
				ProdList.add(bean);
				
				
			}
			
		
		
	} catch (Exception e) {
		System.out.println("getallprolist(CROSS,BRIEFCASE,BACKCPACK)에서 오류 : "+e);
	}finally{
		
		freeResource();
	}
	
		return ProdList;
	}//상품 정렬 메소드 끝

	
	public int getSaleListCount(String status) { //DP한 상품 중 세일 또는 예약판매 제품갯수만 불려 오는 메소드
		
		int count = 0;
		
		try {
			con=getConnection();
			
			String sql = "select count(distinct pr_pro_code) from (select * from product where pr_available='AVAILABLE') a inner join product_img b on a.pr_board_num=b.pi_board_num "
					+"where pr_status=?";
			
			
			pstmt= con.prepareStatement(sql);
			
				pstmt.setString(1, status);
			
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
			
			
		} catch (Exception e) {
		
			System.out.println("getSaleListCount에서 오류 : "+e);
		}finally {
			freeResource();
		}
		
	
		return count;
		
		
	}

	public List<prodDTO> getSaleProList(int startRow, int pageSize, String status) { //DP한 상품 중 세일 또는 예약판매 제품만 불려 오는 메소드 

		List<prodDTO> ProdList = new ArrayList<>();
		try{
			con =getConnection();
			
			//메인 사진만 뿌려주기 
			String sql ="select * from product a, product_img b where a.pr_pro_code=b.pi_pro_code and a.pr_status=?"
					+ "and image_use ='main' and pr_available !='NOTAVAILABLE' "
					+ "order by pr_reg_date asc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			

			rs= pstmt.executeQuery();
			
			
			while(rs.next()){
				prodDTO bean  = new prodDTO();

				bean.setPr_board_num(rs.getInt("pr_board_num"));
				bean.setPr_pro_code(rs.getString("pr_pro_code"));
				bean.setPr_product(rs.getString("pr_product"));
				bean.setPr_size(rs.getString("pr_size"));
				bean.setPr_category(rs.getString("pr_category"));
				bean.setPr_brand(rs.getString("pr_brand"));
				bean.setPr_price(rs.getInt("pr_price"));
				bean.setPr_discount(rs.getString("pr_discount"));
				bean.setPr_buy_cnt(rs.getInt("pr_buy_cnt"));
				bean.setPr_stock(rs.getInt("pr_stock"));
				bean.setPr_color(rs.getString("pr_color"));
				bean.setPr_orgin(rs.getString("pr_orgin"));
				bean.setPr_pro_info(rs.getString("pr_pro_info"));
				bean.setPr_reg_date(rs.getString("pr_reg_date"));
				bean.setPr_recent_date(rs.getString("pr_recent_date"));
				bean.setPr_orgin(rs.getString("pr_orgin_code"));
				bean.setPi_board_num(rs.getInt("pi_board_num"));
				bean.setPi_pro_code(rs.getString("pi_pro_code"));
				bean.setImage_path(rs.getString("image_path"));
				bean.setImg_category(rs.getString("img_category"));
				bean.setImage_size(rs.getInt("image_size"));
				bean.setPi_num(rs.getInt("pi_num"));
				bean.setImage_name(rs.getString("image_name"));
				bean.setPr_status(rs.getString("pr_status"));
				bean.setPr_available(rs.getString("pr_available"));
	 
				
				ProdList.add(bean);
				
				
			}
			
		}catch(Exception e){
			System.out.println("getSaleProList에서 오류 "+e);
			
			
		}finally {
			freeResource();
		}
		
		return ProdList;
	}

	public List<prodDTO> getCateProList(int startRow, int pageSize, String keyField, String status) {
			//세일 예약 상품 상품 정렬 
	List<prodDTO> ProdList = new ArrayList<>();
	
		
		String sql = "";
		
		if(keyField.equals("newpro")){
			sql="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num "
					+ "where pr_status=? and image_use ='main' and pr_available !='NOTAVAILABLE'  "
					+ "order by pr_reg_date desc limit ?,?";
		}else if(keyField.equals("highpro")){
			sql ="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num where pr_status=? "
					+ "and image_use ='main' and pr_available !='NOTAVAILABLE'  "
					+ "order by pr_price desc limit ?,?";
		}else if(keyField.equals("lowpro")){
			sql ="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num where pr_status=? "
					+ "and image_use ='main' and pr_available !='NOTAVAILABLE'"
					+ "order by pr_price asc limit ?,?";
		}else if(keyField.equals("namepro")){
			sql ="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num"
					+ " where pr_status=? and image_use ='main' and pr_available !='NOTAVAILABLE' "
					+ "order by pr_product asc limit ?,?";
		}else if(keyField.equals("buypro")){
			sql ="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num"
					+ " where pr_status=? and image_use ='main' and pr_available !='NOTAVAILABLE' "
					+ "order by pr_buy_cnt desc limit ?,?";
		}else if(keyField.equals("null")){
			sql="select * from product a inner join product_img b on a.pr_board_num=b.pi_board_num where pr_status=? "
					+ "and image_use ='main' and pr_available !='NOTAVAILABLE'"
					+ "order by pr_reg_date desc limit ?,?";
			
		}
		
	
	try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
		
			rs= pstmt.executeQuery();
			
			
			while(rs.next()){
				prodDTO bean  = new prodDTO();

				bean.setPr_board_num(rs.getInt("pr_board_num"));
				bean.setPr_pro_code(rs.getString("pr_pro_code"));
				bean.setPr_product(rs.getString("pr_product"));
				bean.setPr_size(rs.getString("pr_size"));
				bean.setPr_category(rs.getString("pr_category"));
				bean.setPr_brand(rs.getString("pr_brand"));
				bean.setPr_price(rs.getInt("pr_price"));
				bean.setPr_discount(rs.getString("pr_discount"));
				bean.setPr_buy_cnt(rs.getInt("pr_buy_cnt"));
				bean.setPr_stock(rs.getInt("pr_stock"));
				bean.setPr_color(rs.getString("pr_color"));
				bean.setPr_orgin(rs.getString("pr_orgin"));
				bean.setPr_pro_info(rs.getString("pr_pro_info"));
				bean.setPr_reg_date(rs.getString("pr_reg_date"));
				bean.setPr_recent_date(rs.getString("pr_recent_date"));
				bean.setPr_orgin(rs.getString("pr_orgin_code"));
				bean.setPi_board_num(rs.getInt("pi_board_num"));
				bean.setPi_pro_code(rs.getString("pi_pro_code"));
				bean.setImage_path(rs.getString("image_path"));
				bean.setImg_category(rs.getString("img_category"));
				bean.setImage_size(rs.getInt("image_size"));
				bean.setPi_num(rs.getInt("pi_num"));
				bean.setImage_name(rs.getString("image_name"));
				bean.setPr_material(rs.getString("pr_material"));
				bean.setPr_length(rs.getString("pr_length"));
				bean.setPr_status(rs.getString("pr_status"));
				bean.setPr_available(rs.getString("pr_available"));
				
				ProdList.add(bean);
				
				
			}
			
		
		
	} catch (Exception e) {
		System.out.println("getallprolist(검색)에서 오류 : "+e);
	}finally{
		
		freeResource();
	}
	
		return ProdList;
	}//메소드 끝
	
	
	
	
	
}
