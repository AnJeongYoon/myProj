package Admin.Product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

public class AdminGoodsSaleQtyController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		AdprodDAO adDao = new AdprodDAO();
		
		//페이징 처리
		int count = adDao.getQtyListCnt();
		int pageSize = 15;
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize;
		int endRow = currentPage*pageSize;
		
		List<AdprodDTO> qtyList = null;
		if(count > 0){
			//세일,재고상태 뿌림
			qtyList = adDao.getSaleQty(startRow, pageSize);
			request.setAttribute("qtyList", qtyList);
		}
		
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		int pageBlock = 5;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/admin/index.jsp?content=common/goods/product_sale_qty.jsp");
		
		return forward;
	}

}
