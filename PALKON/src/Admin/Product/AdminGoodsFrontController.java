package Admin.Product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;

@WebServlet("*.ad")
public class AdminGoodsFrontController extends HttpServlet{
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
		
		if(command.equals("/admin_goodsList.ad")){	//상품목록
			action = new AdminGoodsListController();
			
			try{
				forward=action.execute(req, resp);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		} else if(command.equals("/admin_saleQty.ad")){	//세일,재고관리
			action = new AdminGoodsSaleQtyController();
			
			try{
				forward=action.execute(req, resp);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		} else if(command.equals("/admin_product.ad")){ //등록 화면 보여주기 
	        //상품 페이지 컨트롤러 
			forward = new ActionForward();
			
			forward.setRedirect(false);
			
			forward.setPath("TeamProj/admin/index.jsp?content=common/goods/product_form.jsp");
	         
	         try{
	            forward=action.execute(req, resp);
	         }catch(Exception e){
	            e.printStackTrace();
	         }
	         
	    } else if(command.equals("/AdminProAction.ad")){
			//상품 등록 컨트롤러		
			action = new AdminProductController();
			try{
				forward=action.execute(req, resp);
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
		
		
	}
	

}
