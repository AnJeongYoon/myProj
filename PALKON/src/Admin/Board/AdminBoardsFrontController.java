package Admin.Board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

public class AdminBoardsFrontController extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		requestPro(req, resp); 
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		requestPro(req, resp); 
	}
	
	protected void requestPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		//프로젝트명 가져오기
		String RequestURI =  req.getRequestURI();
		String contextPath = req.getContextPath();
				
		//가상주소 가져오기
		String command = RequestURI.substring(contextPath.length());
				
		//Action, ActionForward 객체
		Action action = null;
		ActionForward forward=null;
		
		if(command.equals("/admin_booardsList.ab")){
			action = new AdminNoticeListController();
			
			try{
				forward=action.execute(req,  resp);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

}


