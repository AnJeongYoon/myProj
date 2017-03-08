package Admin.Member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Product.Action;
import Product.ActionForward;

/**
 * Servlet implementation class Admin_MemberFrontController
 */
@WebServlet("*.am")
public class Admin_MemberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		requestPro(request, response); 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		requestPro(request, response); 
	}
	
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//프로젝트명 가져오기
		String RequestURI =  request.getRequestURI();
		String contextPath = request.getContextPath();
				
		//가상주소 가져오기
		String command = RequestURI.substring(contextPath.length());
				
		//Action, ActionForward 객체
		Action action = null;
		ActionForward forward=null;
		
		if(command.equals("/ad_mem_list.am")){
			action = new Action_ad_mem_list();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/ad_mem_mody.am")){
			action = new Action_ad_mem_modi();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ad_mem_del.am")){
			action = new Action_ad_mem_del();
			try {				
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
			//response.sendRedirect("TeamProj/admin/index.jsp");
		}
	
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher= request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
		
	}
	
}
