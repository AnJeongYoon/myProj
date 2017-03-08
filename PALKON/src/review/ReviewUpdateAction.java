package review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

public class ReviewUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewUpdateAction execute()");
		request.setCharacterEncoding("utf-8");
		
		String pageNum=request.getParameter("pageNum");
		String pr_pro_code = request.getParameter("pr_pro_code");
		System.out.println("넘값"+request.getParameter("num"));
		ReviewDTO rd = new ReviewDTO();
		rd.setRv_num(Integer.parseInt(request.getParameter("num")));
		rd.setRv_content(request.getParameter("content"));
		rd.setRv_name(request.getParameter("name"));
		rd.setRv_pw(request.getParameter("pw"));
		rd.setRv_email(request.getParameter("email"));
		rd.setRv_score(request.getParameter("score"));
		rd.setRv_pro_code(pr_pro_code);
		rd.setRv_title(request.getParameter("title"));
		ReviewDAO rdao = new ReviewDAO();
		
		int check =rdao.updateReview(rd);
		
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
		out.println("location.href='./review_list.bo?pageNum="+pageNum+"&pr_pro_code="+pr_pro_code+"'");
		out.println("</script>");
		out.close();
		return null;
	}
}