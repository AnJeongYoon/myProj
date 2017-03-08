package review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;
import Product.prodDAO;
import Product.prodDTO;

public class ReviewUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		String pageNum = request.getParameter("pageNum");
		String pr_pro_code=request.getParameter("pr_pro_code");
		
		ReviewDAO rdao = new ReviewDAO();

		ReviewDTO rd = rdao.getReview(num);
		
		prodDAO pDao = new prodDAO();
		prodDTO pDto = pDao.getItem(pr_pro_code);
		
		request.setAttribute("info", pDto);
		request.setAttribute("rd", rd);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/board/review_update.jsp");
		return forward;
		
	}

}