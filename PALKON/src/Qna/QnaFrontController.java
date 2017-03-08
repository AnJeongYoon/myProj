package Qna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;



@WebServlet("*.br")
public class QnaFrontController extends HttpServlet{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String RequestURI=request.getRequestURI();
		System.out.println(RequestURI);
	
		String contextPath=request.getContextPath();
		System.out.println(contextPath);
		System.out.println(contextPath.length());
		
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
		//주소비교
		ActionForward forward=null;
		Action action=null;
		
		String content = null;
		//resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(command.equals("/qna_list.br")){
			//QnaListAction 
			action=new QnaListAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("qna_list_search.br")){
			//QnaListSearchAction();
			action=new QnaListSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/qna_write.br")){
			
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/index.jsp?content=common/board/qna_write.jsp");
		}else if(command.equals("/qna_write_action.br")){
			action=new QnaWriteAction();
			try{
				forward=action.execute(request, response);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/qna_contentck.br")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/index.jsp?content=common/board/qna_contentck.jsp");
		}else if(command.equals("/qna_content_action.br")){
			action = new QnaContentAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/qna_content.br")){
			// BoardContentAction   execute()
			action=new QnaContent();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/qna_update.br")){
			//  boardUpdate   
			action=new QnaUpdate();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/qna_update_action.br")){
			//  QnaUpdateAction
			action=new QnaUpdateAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			}else if(command.equals("/qna_delete.br")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/index.jsp?content=common/board/qna_delete.jsp");
		}else if(command.equals("/qna_delete_action.br")){
			action=new QnaDeleteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/qna_rewrite.br")){
			//  ./center/reWrite.jsp
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/index.jsp?content=common/board/qna_rewrite.jsp");
		}else if(command.equals("/qna_rewrite_action.br")){
			//  BoardReWriteAction
			action=new QnaReWriteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/FileDownloadAction.br")){
			action=new FileDownloadAction();
			try{
				forward=action.execute(request, response);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		//이동
		if(forward!=null){
			if(forward.isRedirect()){//true
				response.sendRedirect(forward.getPath());
			}else{//false
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}