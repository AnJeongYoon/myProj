package Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

public class NoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeWriteAction 왔다");
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		NoticeDTO nd=new NoticeDTO();
		// nd.set  멤버변수 <= 파라미터 저장 name  pass  subject content
		nd.setNotice_name(request.getParameter("name"));
		nd.setNotice_pass(request.getParameter("pass"));
		nd.setNotice_subject(request.getParameter("subject"));
		nd.setNotice_content(request.getParameter("content"));
		
		NoticeDAO ndao= new NoticeDAO();
		//  insertBoard(bb)메서드 호출
		ndao.insertNotice(nd);
		// 이동  ./BoardList.bo
		request.setAttribute("nd", nd);
		request.setAttribute("subject", subject);
		request.setAttribute("content", content);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./notice_list.no");
		return forward;
	}

}

