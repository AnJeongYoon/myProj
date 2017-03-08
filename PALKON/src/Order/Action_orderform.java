package Order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_orderform implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		//session내 저장된 아이디값을 가져와서 request영역 내에 저장시킴
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		

		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/order/orderform.jsp");
		
		return forward;
	}

	
	
	
}
