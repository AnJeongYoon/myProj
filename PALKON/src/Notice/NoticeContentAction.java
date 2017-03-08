package Notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;


public class NoticeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// int num  파라미터 가져오기
		int num=Integer.parseInt(request.getParameter("num"));
		// String pageNum 파라미터 가져오기
		String pageNum=request.getParameter("pageNum");
		
		
		
		// BoardDAO ndao 객체생성
		NoticeDAO ndao=new NoticeDAO();
		// 조회수 증가 updateReadcount(num)
		ndao.updateReadcount(num);
		
		int count = ndao.getNoticeCount();
		
		request.setAttribute("count", count);
		// BoardBean bb=메서드호출 getBoard(num)
		NoticeDTO nd=ndao.getNotice(num);
		
		NoticeDTO backList = ndao.backpage(num);
		request.setAttribute("backList", backList);
		
		NoticeDTO goList = ndao.gopage(num);
		request.setAttribute("goList", goList);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		request.setAttribute("id", id);
		
		//저장 "nd",nd
		request.setAttribute("nd", nd);
		//저장 "pageNum",pageNum
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		
		// 이동 ./board/content.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/board/notice_content.jsp");
		return forward;
	}
}
