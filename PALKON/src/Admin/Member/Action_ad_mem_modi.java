package Admin.Member;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;

import Product.Action;
import Product.ActionForward;

public class Action_ad_mem_modi implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		if(request.getParameter("mb_id").equals("admin")){
			out.println("최고 관리자는 수정 불가");
		}else{
			MemberDAO mdao = new MemberDAO();
			mdao.updateMember(request.getParameter("mb_id"), request);			
			out.println("수정완료");
		}
		
		return null;
	}
}
