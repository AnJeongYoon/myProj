package Qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

public class QnaUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("boardUpdate execute()");
		// int num  파라미터 가져오기
		int num=Integer.parseInt(request.getParameter("num"));
		String pass=request.getParameter("pass");
		// String pageNum 파라미터 가져오기
		String pageNum=request.getParameter("pageNum");
		// BoardDAO qdao 객체 생성
		QnaDAO qdao=new QnaDAO();
		// BoardBean qd = 메서드호출 getBoard(num)
		QnaDTO qd=qdao.getBoard(num);
		// 저장  qd, pageNum
		request.setAttribute("qd", qd);
		request.setAttribute("pageNum", pageNum);
		// 이동 ./board/update.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/board/qna_update.jsp");
		return forward;
	}

}
