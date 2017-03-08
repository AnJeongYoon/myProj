package Admin.Board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.Paging;
import Notice.NoticeDAO;
import Notice.NoticeDTO;
import Product.Action;
import Product.ActionForward;

public class AdminNoticeListController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		NoticeDAO andao = new NoticeDAO();
		
		//페이징처리
				int count = andao.getNoticeCount(); //전체 글 갯수
				int pageSize = 15;	//리스트에 뿌려질 글 개수
				String pageNum = request.getParameter("pageNum"); //선택한 페이지번호
				if(pageNum == null){ pageNum = "1"; }
				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage-1)*pageSize+1;	//시작 글 번호
				int endRow = currentPage*pageSize;	//끝번호
				
				int pageCount = count/pageSize+(count%pageSize==0?0:1);
				int pageBlock = 10;	//한화면에 보여줄 페이지수 설정
				int startPage = ((currentPage-1)/pageBlock)*pageBlock+1; // 한화면에 보여줄 시작페이지 구하기  
				int endPage = startPage+pageBlock-1; // 한화면에 보여줄 끝페이지 구하기
				if(endPage > pageCount){ endPage = pageCount; }
				
		 List<NoticeDTO> AdNotiList = null;
		 
		 if(count!=0){
			 AdNotiList=andao.getNoticeList(startRow, pageSize);
		 }
		 
		 request.setAttribute("AdNotiList", AdNotiList);
		 request.setAttribute("count", count);
		 request.setAttribute("pageNum", pageNum);
		 request.setAttribute("pageCount", pageCount);
		 request.setAttribute("pageBlock", pageBlock);
		 request.setAttribute("startPage", startPage);
		 
		//페이지이동
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/admin/index.jsp?content=common/boards/notice_list.jsp");
			
			return forward;
		}
		
		

	}

