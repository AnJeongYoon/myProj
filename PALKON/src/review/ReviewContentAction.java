package review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;
import Product.prodDAO;
import Product.prodDTO;

public class ReviewContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int num=Integer.parseInt(request.getParameter("num"));
		
		String pageNum=request.getParameter("pageNum");
		
		String pr_pro_code=request.getParameter("rv_pro_code");
		System.out.println("상품코드는 : " +pr_pro_code);
		
		
		ReviewDAO rdao = new ReviewDAO();
		
		rdao.updateReadcount(num);
		
		
		List<ReviewDTO> reviewContentList=null;
		
		reviewContentList = rdao.getReviewContent(num);
		
		
		prodDAO pDao = new prodDAO();
		prodDTO pDto = pDao.getItem(pr_pro_code);
		request.setAttribute("info", pDto);
		request.setAttribute("reviewContentList", reviewContentList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pr_pro_code",pr_pro_code);
		request.setAttribute("num", num);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/board/review_content.jsp");
		return forward;
		
	}

}
