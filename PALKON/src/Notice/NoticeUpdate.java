package Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

public class NoticeUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeUpdate execute()");
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		String pageNum=request.getParameter("pageNum");
		
		NoticeDAO ndao=new NoticeDAO();
	
		NoticeDTO nd=ndao.getNotice(num);
		
		request.setAttribute("nd", nd);
		request.setAttribute("pageNum", pageNum);
	
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/board/notice_update.jsp");
		return forward;
	}

}
