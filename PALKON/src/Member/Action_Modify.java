package Member;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_Modify implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MemberDTO mdto = new MemberDTO();
		MemberDAO mdao = new MemberDAO();
		String content = "TeamProj/index.jsp?content=common/member/modify.jsp";
		mdto = mdao.loadMemInfo(id);
		String addr = (String)mdto.getMb_addr();
		String[] addrs = addr.split("/");
		request.setAttribute("mdto",mdto);
		request.setAttribute("addrs", addrs);
		
		ActionForward forward = new ActionForward();
		forward.setPath(content);
		forward.setRedirect(false);
		
	
		return forward;
	}
}
