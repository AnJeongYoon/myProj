package Member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_ModifyConfirm implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");	
		MemberDAO mdao = new MemberDAO();
		int check = mdao.updateMember(id, request);
		PrintWriter out = response.getWriter();
		if(check==1){				
			out.println("<script language='javascript'>");
			out.println("alert('수정 완료');");
			out.println("location.href='/projectTForgit/mypageMain.mr'");
			out.println("</script>");			
			out.close();				
		}else{
			out.println("<script language='javascript'>");
			out.println("alert('수정 실패\n관리자에게 문의하세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();		
		}
		
		
		return null;
	}

}
