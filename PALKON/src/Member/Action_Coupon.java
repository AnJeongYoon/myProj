package Member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_Coupon implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO mdao = new MemberDAO();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");		
		List<Member_CouponDTO> list = new ArrayList<>();
		
		Paging page = new Paging();
		
		page.setPageNo(request.getParameter("pageNo"));			
		page.setPageSize(request.getParameter("pageSize"));
		//page.setPageSize(3);
		
		System.out.println(page.getPageNo());
		page.setTotalCount(mdao.Coupon_count(id));
		mdao.setStartPageNo(page.getPageNo());
		mdao.setPageSize(page.getPageSize());
		list = mdao.getCouponList(id);
		request.setAttribute("mcp", page);
		request.setAttribute("cp_list", list);
		request.setAttribute("total_cp", mdao.Coupon_count(id));
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/member/coupon.jsp");		
		return forward;
	}
}

