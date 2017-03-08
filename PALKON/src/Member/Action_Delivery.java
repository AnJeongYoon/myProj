package Member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_Delivery implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		mdto = mdao.loadMemInfo(id);
		List<Member_DeliveryDTO> De_list = mdao.getDeliveryAddr(id);
		//System.out.println(De_list.get(6).getDe_addr());
		request.setAttribute("mdto", mdto);
		request.setAttribute("De_list", De_list);
		ActionForward forward = new ActionForward();
		forward.setPath("TeamProj/index.jsp?content=common/member/Delivery.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
