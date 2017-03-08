package Product;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Order.Action_orderCart;

@WebServlet("*.pr")
public class GoodsFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
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
		/*action = new Action_orderCart();
		try {
			action.execute(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}*/

		
		if(command.equals("/product_list.pr")){//상품 카테고리별로 뿌리기 
			
			action = new GoodsListController();
			try{
				forward=action.execute(req, resp);
				

			}catch(Exception e){
				
				e.printStackTrace();
			}
			
		} else if(command.equals("/product_search.pr")){//상품정렬
			
			action = new GoodsSearchController();
			
			try{
				forward = action.execute(req, resp);
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		} else if(command.equals("/product_item.pr")) {
				
			action = new GoodsInfoController();
			try{
				forward = action.execute(req, resp);
			} catch(Exception e) {
				e.printStackTrace();
			}
	
		} else if(command.equals("/product_sale.pr")){//sale/preorder항목으로 보내기 
			
		action = new GoodsSaleController();
		
		try{
			
			forward = action.execute(req, resp);
			
		}catch(Exception e){
			e.printStackTrace();
			}

		}
	
		
		
		
		//시작
		if(forward!=null){
			if(forward.isRedirect()){//true
				resp.sendRedirect(forward.getPath());
				
			}else{//false
				RequestDispatcher dispatcher=req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}//끝
		
		
		
	}//doProcess 끝
	
	

}
