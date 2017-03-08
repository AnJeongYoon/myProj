package review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

public class ReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pageNum=request.getParameter("pageNum");
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println(num+"이 왔다고!!");
		String pw=request.getParameter("pw");
		
		
		ReviewDAO rdao=new ReviewDAO();
		
		int check =rdao.deleteReview(num, pw);
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
		out.println("alert('삭제성공');");
		out.println("location.href='./review_list.bo?pageNum="+pageNum+"'");
		out.println("</script>");
		out.close();
		return null;
	}
}