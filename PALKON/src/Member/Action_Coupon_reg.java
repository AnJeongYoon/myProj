package Member;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Admin.coupon.AdminDAO;
import Admin.coupon.Admin_couponDTO;
import Product.Action;
import Product.ActionForward;

public class Action_Coupon_reg implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cp_num = request.getParameter("cp_Input");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");	
		MemberDAO mdao = new MemberDAO();
		AdminDAO adao = new AdminDAO();
		PrintWriter out = response.getWriter();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
		String date_A = sf.format(System.currentTimeMillis());
		List<Admin_couponDTO> list = adao.getadmin_cp_info();
		if(!list.isEmpty()){
			for(int i = 0; i<list.size(); i++){
				if(list.get(i).getAd_cp_regnum().equals(cp_num)){					
					String date_B = list.get(i).getAd_cp_duedate();
					if(date_A.compareTo(date_B)<0){
						Admin_couponDTO adto = list.get(i);
						int check = mdao.insert_coupon(id, adto);
						if(check!=0){
							out.println("<script language='javascript'>");
							out.println("alert('입력성공');");
							out.println("location.href='/projectTForgit/mypage_coupon.mr';");
							out.println("</script>");
							out.close();
							return null;
						}else{
							out.println("<script language='javascript'>");
							out.println("alert('쿠폰번호 중복');");	
							out.println("history.back();");
							out.println("</script>");
							out.close();
							return null;
						}
					}else{
						out.println("<script language='javascript'>");
						out.println("alert('만료된 쿠폰입니다.');");	
						out.println("history.back();");
						out.println("</script>");
						out.close();
						return null;
					}
					
				}					
			}
			out.println("<script language='javascript'>");
			out.println("alert('해당하는 쿠폰이 없습니다');");	
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
			
		}
		out.println("<script language='javascript'>");
		out.println("alert('등록된 쿠폰이 없습니다');");	
		out.println("history.back();");
		out.println("</script>");
		out.close();
		return null;
		
	}
}
