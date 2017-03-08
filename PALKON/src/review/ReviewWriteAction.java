package review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;
import Product.prodDAO;
import Product.prodDTO;

public class ReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ReviewWriteActionexecute()");
		
		request.setCharacterEncoding("utf-8");
		System.out.println("pr_pro_code"+request.getParameter("pr_pro_code"));
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pr_pro_code = request.getParameter("pr_pro_code");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String score = request.getParameter("score");
		String email = request.getParameter("email");
		String name1 = request.getParameter("name1");
		
		
		//상품정보
		prodDAO pDao = new prodDAO();
		prodDTO pDto = pDao.getItem(pr_pro_code);
		session.setAttribute("rvinfo", pDto);
		
		
		
		
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO rd = new ReviewDTO();
		rd.setRv_content(content);
		rd.setRv_title(title);
		rd.setRv_id(name);
		rd.setRv_name(name);
		rd.setRv_score(score);
		rd.setRv_pw(pw);
		rd.setRv_email(email);
		rd.setRv_pro_code(pr_pro_code);
		rd.setRv_name(name1);
		
		
		rdao.insertBoard(rd);
		
		
		request.setAttribute("rd", rd);
		request.setAttribute("title",title);
		request.setAttribute("content", content);
		request.setAttribute("id", id);
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./review_list.bo");
		return forward;
		
		
	}

}
