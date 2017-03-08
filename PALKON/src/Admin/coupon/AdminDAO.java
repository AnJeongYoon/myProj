package Admin.coupon;

import java.util.ArrayList;
import java.util.List;

import Member.Dbaccess;

public class AdminDAO extends Dbaccess {

	public List<Admin_couponDTO> getadmin_cp_info() {
		List<Admin_couponDTO> list = new ArrayList<>();
		try {
			
			con = ds.getConnection();
			sql = "select * from admin_coupon";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Admin_couponDTO acdto = new Admin_couponDTO();
				acdto.setAd_cp_duedate(rs.getString("ad_cp_duedate"));
				acdto.setAd_cp_limit_price(rs.getInt("ad_cp_limit_price"));
				acdto.setAd_cp_no(rs.getInt("ad_cp_no"));
				acdto.setAd_cp_num_of_person(rs.getInt("ad_cp_num_of_person"));
				acdto.setAd_cp_price(rs.getInt("ad_cp_price"));
				acdto.setAd_cp_regnum(rs.getString("ad_cp_regnum"));
				acdto.setAd_cp_content(rs.getString("ad_cp_content"));
			
				list.add(acdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return list;
	}
}
