package Member;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

public class Action_SignUp implements Action{
@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	MemberDAO sign = new MemberDAO();
	int check = sign.insertMember(request, response);	
	String content = null;
	
	if(check==1){				
				
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email"); 
		System.out.println(name);
		//content ="TeamProj/index.jsp?content=common/member/success.jsp?id="+id+"&email="+email+"&name="+name;
		content = "TeamProj/index.jsp?content=common/member/success.jsp";
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		sign.insert_FirstPoint(id);
	
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath(content);
		//System.out.println(forward.getPath());
		return forward;
		
	}else{
		PrintWriter out = response.getWriter();
		System.out.println("에러다!!");
		out.println("<script language='javascript'>");
		out.println("alert('이미 가입된 아이디입니다');");
		out.println("location.href='/projectTForgit/TeamProj/index.jsp';");
		out.println("</script>");
		out.close();
		return null;
		
	}
	
	
}
}
