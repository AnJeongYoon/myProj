package Member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_Delivery_reg_check implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		PrintWriter out = response.getWriter();
		MemberDAO mdao = new MemberDAO();
		int count = mdao.getDeliveryCount(id);
		System.out.println(count);
		if(count>9){
			out.println("<script language='javascript'>");
			out.println("alert('이미 10개의 주소가 등록되었습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else{
			ActionForward forward = new ActionForward();
			forward.setPath("TeamProj/index.jsp?content=common/member/reg_delivery.jsp");
			forward.setRedirect(true);
			return forward;
		}
		
	}
}
	
