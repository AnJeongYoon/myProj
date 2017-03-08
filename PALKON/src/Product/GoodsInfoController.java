package Product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.ReviewDAO;
import review.ReviewDTO;

public class GoodsInfoController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		prodDAO pDao = new prodDAO();
		
		//상품정보
		String pr_pro_code = request.getParameter("pr_pro_code");
		prodDTO pDto = pDao.getItem(pr_pro_code);
		request.setAttribute("info", pDto);
		
		//상품이미지 리스트
		String pi_pro_code = request.getParameter("pr_pro_code");
		List<prodDTO> pImgList = pDao.getImgList(pi_pro_code);
		request.setAttribute("pImg", pImgList);
		
		//상품설명 이미지
		String infoImg = pDao.getInfoImg(pi_pro_code);
		request.setAttribute("infoImg", infoImg);		
		
		//리뷰게시판 갯수
		String rv_pro_code = request.getParameter("pr_pro_code");
		int ReviewCnt = pDao.getReviewCnt(rv_pro_code);
		request.setAttribute("reviewCnt", ReviewCnt);
		
		//리뷰 내용
		ReviewDAO rDao = new ReviewDAO();
		List<ReviewDTO> reviewContentList = rDao.getReviewContent(rv_pro_code);
		request.setAttribute("reviewContentList", reviewContentList);
		
		//리뷰 별점 평균
		double AvgReviewScore = rDao.getAvgReviewScore(rv_pro_code);
		request.setAttribute("AvgReviewScore", AvgReviewScore);
		
		//베스트셀러 리스트
		String category = request.getParameter("category");
		List<prodDTO> popularList = pDao.getPopularList(pr_pro_code, category);
		request.setAttribute("popularList", popularList);
		
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/goods/item.jsp");
		
		return forward;
	}

}
