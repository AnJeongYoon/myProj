package Notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class NoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		//  게시판 전체 글의 개수 
				// 디비 객체 생성 NoticeDAO  ndao
			NoticeDAO ndao=new NoticeDAO();
			
			int count=ndao.getNoticeCount();
			
			int pageSize=15;
			
			String pageNum=request.getParameter("pageNum");
			if(pageNum==null){
				pageNum="1";
			}
			
			int currentPage=Integer.parseInt(pageNum);
			int startRow=(currentPage-1)*pageSize+1;
			
			int endRow=currentPage*pageSize;
			List<NoticeDTO> noticeList=null;
		
			if(count!=0){
				noticeList=ndao.getNoticeList(startRow, pageSize);
			}
			
			int pageCount =count/pageSize+(count%pageSize==0?0:1);
			
			int pageBlock=10;
			
			int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
			
			int endPage=startPage+pageBlock-1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			
			request.setAttribute("id", id);
			request.setAttribute("count", count); //모든속성저장 Integer -> Object형저장
			request.setAttribute("noticeList", noticeList); // List -> Object 저장
			request.setAttribute("pageNum", pageNum); //String -> Object 저장
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			// 이동   ./center/notice.jsp
			ActionForward forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/index.jsp?content=common/board/notice_list.jsp");
			return forward;
	}

}
