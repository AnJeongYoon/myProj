package Member;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_point implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = null;
		if(id!=null){
			MemberDAO mdao = new MemberDAO();						
			Paging mpp = new Paging();
			mpp.setPageNo(request.getParameter("pageNo"));			
			mpp.setPageSize(request.getParameter("pageSize"));
			mpp.setTotalCount(mdao.point_count(id));
			mdao.setStartPageNo(mpp.getPageNo());		
			mdao.setPageSize(mpp.getPageSize());		
			List<Member_PointDTO> list = mdao.loadMPoint(id);		
			int total = mdao.total_point(id);
			int used = mdao.used_point(id);
			int refund = mdao.refund_point(id);
			int will = mdao.will_point(id);
			request.setAttribute("mpp", mpp);
			request.setAttribute("list", list);
			request.setAttribute("total", total);
			request.setAttribute("used", used);
			request.setAttribute("refund", refund);
			request.setAttribute("will", will);
			String content = "TeamProj/index.jsp?content=common/member/Point.jsp";
			
			forward = new ActionForward();
			forward.setPath(content);
			forward.setRedirect(false);
			
		}else{
			forward = new ActionForward();
			forward.setPath("TeamProj/index.jsp?content=");
			forward.setRedirect(true);
		}
	
		return forward;
	}
}
