package Member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_Delivery_reg implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		PrintWriter out = response.getWriter();
		MemberDAO mdao = new MemberDAO();

		int check = mdao.insertDeliveryAddr(id, request, response);
		if(check!=0){
			ActionForward forward = new ActionForward();
			forward.setPath("/projectTForgit/mypage_deli.mr");
			forward.setRedirect(true);
			return forward;
		}else{
			
			out.println("<script language='javascript'>");
			out.println("alert('정확한 값을 입력해주세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
	
	
		
	}
}
