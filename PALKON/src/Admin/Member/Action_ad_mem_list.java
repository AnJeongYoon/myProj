package Admin.Member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberDTO;
import Member.Paging;
import Product.Action;
import Product.ActionForward;

public class Action_ad_mem_list implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Admin_Member_dao amdao = new Admin_Member_dao();
		
		Paging page = new Paging();
		page.setPageNo(request.getParameter("pageNo"));				
		page.setPageSize(request.getParameter("pageSize"));
		System.out.println("count:"+amdao.getCountMember(request, response));
		page.setTotalCount(amdao.getCountMember(request, response));
		amdao.setStartPageNo(page.getPageNo());
		amdao.setPageSize(page.getPageSize());
		
		List<MemberDTO> list =  amdao.getAllMember(request, response);
		//page.setTotalCount(list.size());
		//System.out.println(list.get(2).getMb_id());
		request.setAttribute("total_member", amdao.getCountMember(request, response));
		request.setAttribute("mem_list", list);
		request.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();
		forward.setPath("TeamProj/admin/index.jsp?content=common/member/memberList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
