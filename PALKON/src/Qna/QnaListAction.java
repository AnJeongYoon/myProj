package Qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;



public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
	//  게시판 전체 글의 개수 
			// 디비 객체 생성 BoardDAO  qdao
		QnaDAO qdao=new QnaDAO();
		// int count =  메서드호출  getBoardCount()   count(*)
		int count=qdao.getBoardCount();
		// 게시판 가져오기  2페이지 10개 => 시작행 끝행
		// 한페이지에 15개 글을 가져오도록 설정
		int pageSize=15;
		// 페이지 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		// 시작행번호 구하기  10  1페이지  1번행   2페이지  11번행   3  21번행
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		// 끝행번호
		int endRow=currentPage*pageSize;
		List<QnaDTO> boardList=null;
	//  시작행번호  몇개(10) 가져오기
		// boardList=메서드호출  getBoardList(시작행startRow,몇개pageSize)
		if(count!=0){
			boardList=qdao.getBoardList(startRow, pageSize);
		}
		//전체 페이지 수 구하기  50개 글  10개씩 보여주기 => 5+0
				//                 55개 글 10개씩 보여주기 => 5+1
		
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
		String textck = request.getParameter("textck");
		// request  count boardList pageNum 
				// pageCount pageBlock startPage endPage저장
		request.setAttribute("count", count); //모든속성저장 Integer -> Object형저장
		request.setAttribute("boardList", boardList); // List -> Object 저장
		request.setAttribute("pageNum", pageNum); //String -> Object 저장
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("textck", textck);
		// 이동   ./center/notice.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("TeamProj/index.jsp?content=common/board/qna_list.jsp");
		return forward;
	}
}