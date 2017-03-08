package Qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;


public class QnaUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaUpdateAction execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");
		//  pageNum 파라미터    
		String pageNum=request.getParameter("pageNum");
		// BoardBean bb 객체 생성
		QnaDTO qd=new QnaDTO();
		// bb 멤버변수 <- num name pass subject  content 파라미터
		qd.setQna_content(request.getParameter("content"));
		qd.setQna_name(request.getParameter("name"));
		qd.setQna_pass(request.getParameter("pass"));
		qd.setQna_subject(request.getParameter("subject"));
		qd.setQna_num(Integer.parseInt(request.getParameter("num")));
		// BoardDAO bdao 객체 생성
		QnaDAO qdao=new QnaDAO();
		
		int check=qdao.updateBoard(qd);
		
		if(check==0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else if(check==-1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('num없음');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('수정성공');");
		out.println("location.href='./qna_list.br?pageNum="+pageNum+"'");
		out.println("</script>");
		out.close();
		return null;
	}
}
