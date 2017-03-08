package Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_Delivery_modi_conf implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(request.getParameter("de_num"));
		//int de_num = Integer.parseInt(request.getParameter("de_num"));
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberDAO mdao = new MemberDAO();
		mdao.ModifyDelivery(id, request, response);
		ActionForward forward = new ActionForward();
		forward.setPath("/projectTForgit/mypage_deli.mr");
		forward.setRedirect(true);
		return forward;
		
	}
	
}
