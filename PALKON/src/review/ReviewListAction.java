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

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		ReviewDAO rdao = new ReviewDAO();
		
		
		int count = rdao.getReviewCount();
		
		int pageSize = 15;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum ="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		List<ReviewDTO> reviewList=null;
		
		prodDAO pdao = new prodDAO();
		prodDTO pdto = (prodDTO)session.getAttribute("rvinfo");
		
		/*prodDTO pDto = pdao.getItem(pr_pro_code);
		request.setAttribute("info", pDto);*/
		
		/*System.out.println("rvinfo" +pdto);*/
		
		
		if(count!=0){
			reviewList = rdao.getReviewList(startRow, pageSize);
			
		}
		
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		
		int pageBlock = 10;
		
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		
		int endPage = startPage+pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		
	
		request.setAttribute("count", count);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("startRow", startRow);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/board/review_list.jsp");
		
		
		return forward;
		
		
	}

}


