package Qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class QnaContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaContentAction execute()");
		
		request.setCharacterEncoding("utf-8");
		

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String pageNum=request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String pass=request.getParameter("pass");
		
		QnaDAO qdao = new QnaDAO();
		
		int check = qdao.contentBoard(num, pass, id);
		
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
		out.println("location.href='./qna_content.br?num="+num+"&pageNum="+pageNum+"'");
		out.println("</script>");
		out.close();
		return null;
		
	}

}
