package Admin.Product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;
import Product.prodDTO;

public class AdminGoodsListController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		AdprodDAO adDao = new AdprodDAO();
		
		//페이징처리
		int count = adDao.getGoodsListCnt(); //전체 글 갯수
		int pageSize = 15;	//리스트에 뿌려질 글 개수
		String pageNum = request.getParameter("pageNum"); //선택한 페이지번호
		if(pageNum == null){ pageNum = "1"; }
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize;	//시작 글 번호
		int endRow = currentPage*pageSize;	//끝번호
		
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		int pageBlock = 5;	//한화면에 보여줄 페이지수 설정
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1; // 한화면에 보여줄 시작페이지 구하기  
		int endPage = startPage+pageBlock-1; // 한화면에 보여줄 끝페이지 구하기
		if(endPage > pageCount){ endPage = pageCount; }
		
		
		//리스트
		List<AdprodDTO> pGoodsList = null;
		String status = request.getParameter("status");
		String category = request.getParameter("category");
		String orderby = request.getParameter("orderby");
		
		if(status == null || status.equals("default")){
			status = "";
		}
		
		if(category == null || category.equals("default")){
			category = "";
		}
		
		if(count > 0){
			pGoodsList = adDao.getGoodsList(startRow, pageSize, status, category, orderby);
			request.setAttribute("pGoodsList", pGoodsList);
			System.out.println("controller: "+status+" / "+category+" / "+orderby);
		}
		
		//뿌려줄 내용
		request.setAttribute("pGoodsList",pGoodsList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		
		request.setAttribute("status", status);
		request.setAttribute("category", category);
		request.setAttribute("orderby", orderby);
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/admin/index.jsp?content=common/goods/product_list.jsp");
		
		return forward;
	}
	
	

}
