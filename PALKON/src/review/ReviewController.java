package review;

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
import Qna.QnaDeleteAction;
import Qna.QnaUpdateAction;
import Qna.QnaWriteAction;

@WebServlet("*.bo")
public class ReviewController extends HttpServlet {
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String ReuqestURI = request.getRequestURI();
		System.out.println(ReuqestURI);
		
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		System.out.println(contextPath.length());
		
		String command = ReuqestURI.substring(contextPath.length());
		System.out.println(command);
		
		
		ActionForward forward = null;
		Action action = null;
		String content = null;
		
		PrintWriter out = response.getWriter();
		String pr_pro_code = request.getParameter("pr_pro_code");
		
		if(command.equals("/review_list.bo")){
			
			action = new ReviewListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/review_write.bo")){
			
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/index.jsp?content=common/board/review_write.jsp?pr_pro_code="+pr_pro_code);
			
		}else if(command.equals("/review_write_action.bo")){
			action=new ReviewWriteAction();
			try{
				forward=action.execute(request, response);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/review_content.bo")){
			
			action = new ReviewContentAction();
			
			try{
				forward=action.execute(request,  response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/review_update.bo")){
			
			action = new ReviewUpdate();
			try{
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/review_update_action.bo")){
			//  QnaUpdateAction
			action=new ReviewUpdateAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/review_delete.bo")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("TeamProj/index.jsp?content=common/board/review_delete.jsp");
		}else if(command.equals("/review_delete_action.bo")){
			action=new ReviewDeleteAction();
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