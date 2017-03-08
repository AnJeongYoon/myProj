package Admin.Member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_ad_mem_del implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Admin_Member_dao amdao = new Admin_Member_dao();
		if(request.getParameterValues("Checked[]")!=null){
			String checked[] = request.getParameterValues("Checked[]");
			for(int i = 0; i<checked.length; i++) {
				
				amdao.ban_member(checked[i]);
			};
			ActionForward forward = new ActionForward();
			forward.setPath("/projectTForgit/ad_mem_list.am");
			forward.setRedirect(true);
			
			return forward;
		}else{
			String id = request.getParameter("id");
			PrintWriter out = response.getWriter();
			if(!id.equals("admin")){
				amdao.del_member(id);
				out.println("삭제완료");
			}else{
				out.print("관리자는 삭제할 수 없습니다");
			}
			return null;
		}
		
	}
}
