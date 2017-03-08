package Product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoodsSaleController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String status = request.getParameter("status");
		
		//전체 검색
		prodDAO pdao = new prodDAO();
		
		//게시판 전체 개수
		int count  = pdao.getSaleListCount(status);
		
		//한페이지 개수 
		int pageSize = 16;
		
		String pageNum = request.getParameter("PageNum");
		
		if(pageNum==null){
			pageNum="1";			
		}
		
		//현재페이지
		int currentPage = Integer.parseInt(pageNum);
		//시작번호 
		int startRow = (currentPage-1)*pageSize+1;
	
		//끝번호
		int endRow=currentPage*pageSize;
	
		
		List<prodDTO> ProList = null;
		
		if(count!=0){
		
			ProList = pdao.getSaleProList(startRow, pageSize,status);
			
		}
		
		int pageCount =count/pageSize+(count%pageSize==0?0:1);
		//한화면에 보여줄 페이지수 설정
		int pageBlock=5;
		// 한화면에 보여줄 시작페이지 구하기  
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		// 한화면에 보여줄 끝페이지 구하기
		int endPage=startPage+pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
	
	
		
		//product_list 페이지에 뿌려주기 위한  객체 request에 담기
		request.setAttribute("ProList",ProList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("status", status);
		
		
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/goods/product_list.jsp");
		
		return forward;
		
		
		
	}
	
	

}
