package Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_Delivery_del implements Action {
	 @Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] check = request.getParameterValues("check");
		MemberDAO mdao = new MemberDAO();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		mdao.deleteDelivery(id, check);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/projectTForgit/mypage_deli.mr");
		
		return forward;
	}
}
