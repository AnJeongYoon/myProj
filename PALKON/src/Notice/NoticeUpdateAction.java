package Notice;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

public class NoticeUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeUpdateAction execute()");
		//한글처리
		request.setCharacterEncoding("utf-8");
		//  pageNum 파라미터    
		String pageNum=request.getParameter("pageNum");
		// BoardBean bb 객체 생성
		NoticeDTO nd=new NoticeDTO();
		// bb 멤버변수 <- num name pass subject  content 파라미터
		nd.setNotice_content(request.getParameter("content"));
		nd.setNotice_name(request.getParameter("name"));
		nd.setNotice_pass(request.getParameter("pass"));
		nd.setNotice_subject(request.getParameter("subject"));
		nd.setNotice_num(Integer.parseInt(request.getParameter("num")));
		
		NoticeDAO ndao=new NoticeDAO();
		
		int check=ndao.updateNotice(nd);
		
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
		out.println("location.href='./notice_list.no?pageNum="+pageNum+"'");
		out.println("</script>");
		out.close();
		return null;
	}

}
