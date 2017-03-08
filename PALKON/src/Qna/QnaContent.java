package Qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;



public class QnaContent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// int num  파라미터 가져오기
		int num=Integer.parseInt(request.getParameter("num"));
		// String pageNum 파라미터 가져오기
		String pageNum=request.getParameter("pageNum");
		
		// BoardDAO bdao 객체생성
		QnaDAO qdao=new QnaDAO();
		// 조회수 증가 updateReadcount(num)
		qdao.updateReadcount(num);
		// BoardBean bb=메서드호출 getBoard(num)
		QnaDTO qd=qdao.getBoard(num);
		
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		
		request.setAttribute("id", id);
		//저장 "qd",qd
		request.setAttribute("qd", qd);
		//저장 "pageNum",pageNum
		request.setAttribute("pageNum", pageNum);
		// 이동 ./board/content.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/board/qna_content.jsp");
		return forward;
	}
}
