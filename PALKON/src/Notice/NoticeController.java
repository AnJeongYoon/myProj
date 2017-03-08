package Notice;

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

@WebServlet("*.no")
public class NoticeController extends HttpServlet {
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
		
		if(command.equals("/notice_list.no")){
			//QnaListAction 
			action=new NoticeListAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("notice_list_search.no")){
			//QnaListSearchAction();
			action=new NoticeListSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/notice_write.no")){
			
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/index.jsp?content=common/board/notice_write.jsp");
		}else if(command.equals("/notice_write_action.no")){
			action=new NoticeWriteAction();
			try{
				forward=action.execute(request, response);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/notice_content.no")){
			
			action=new NoticeContentAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/notice_update.no")){
			
			action=new NoticeUpdate();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/notice_update_action.no")){
			
			action=new NoticeUpdateAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			}else if(command.equals("/notice_delete.no")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/index.jsp?content=common/board/notice_delete.jsp");
		}else if(command.equals("/notice_delete_action.no")){
			action=new NoticeDeleteAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
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