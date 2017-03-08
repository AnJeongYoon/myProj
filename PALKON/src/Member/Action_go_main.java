package Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_go_main implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		mdto = mdao.loadMemInfo(id);
		session.setAttribute("mb_status", mdto.getMb_status());
		
		ActionForward forward = new ActionForward();
		forward.setPath("TeamProj/admin/index.jsp");
		forward.setRedirect(true);
		return forward;
	}
}
