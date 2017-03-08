package Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_Logout implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		if(request.getParameter("path2")!=null){
			String content = request.getParameter("path2");
			//System.out.println("con1:"+content);
			if(content.contains("mypage")){
				content="/projectTForgit/TeamProj/index.jsp";
			}else if(content.contains("mypoint")){
				content="/projectTForgit/TeamProj/index.jsp";
			}
			
			
			System.out.println("con2:"+content);
			
			
			forward.setPath(content);
			forward.setRedirect(true);
		}else{
			forward.setPath("/projectTForgit/TeamProj/index.jsp");
			forward.setRedirect(true);
		}
		session.invalidate();
		return forward;
	}
}
