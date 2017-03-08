package Qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;


public class QnaReWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaReWriteAction execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");
		// BoardBean bb 객체 생성
		QnaDTO qd=new QnaDTO();
		// qd 멤버변수 qna_reWrite.jsp 파라미터  값 저장
		// ip 주소 저장
		qd.setQna_num(Integer.parseInt(request.getParameter("num")));
		qd.setQna_ref(Integer.parseInt(request.getParameter("qna_ref")));
		qd.setQna_lev(Integer.parseInt(request.getParameter("qna_lev")));
		qd.setQna_seq(Integer.parseInt(request.getParameter("qna_seq")));
		qd.setQna_name(request.getParameter("name"));
		qd.setQna_pass(request.getParameter("pass"));
		qd.setQna_subject(request.getParameter("subject"));
		qd.setQna_content(request.getParameter("content"));
		qd.setTextck(request.getParameter("textck"));
		
		
		
		// QnaDAO  qdao
		QnaDAO qdao= new QnaDAO();
		// 메서드호출  reInsertBoard(qd)
		qdao.reInsertBoard(qd);
		// 이동  ./BoardList.bo
		
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./qna_list.br");
		return forward;
	}
}