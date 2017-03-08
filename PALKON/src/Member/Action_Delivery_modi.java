package Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_Delivery_modi implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int de_num = Integer.parseInt(request.getParameter("de_num"));
		MemberDAO mdao = new MemberDAO();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");		
		Member_DeliveryDTO mddto = mdao.getDeliveryAddr(id, de_num);
		String[] addr = mddto.getDe_addr().split("-");
		String addr1 = addr[0];
		String addr2 = addr[1];
		String addr3 = addr[2];
		request.setAttribute("addr1", addr1);
		request.setAttribute("addr2", addr2);
		request.setAttribute("addr3", addr3);
		
		request.setAttribute("mddto", mddto);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/member/modi_reg_delivery.jsp");
		return forward;
	}
}
