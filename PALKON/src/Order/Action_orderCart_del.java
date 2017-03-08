package Order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;
import Product.prodDTO;

public class Action_orderCart_del implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		OrderDAO odao = new OrderDAO();
		if(request.getParameterValues("check")!=null){
			String[] check = request.getParameterValues("check");
			
			
			odao.cart_delete(id, check);
			
			forward.setRedirect(true);
			forward.setPath("/projectTForgit/order_cart.or");
			session.removeAttribute("cart_list");
			List<prodDTO> cart_list = odao.getAllCart(id);
			session.setAttribute("cart_list", cart_list);
			return forward;
		}else if(request.getParameter("sc_num") !=null){
			odao.cart_delete(id, request.getParameter("sc_num"));						
			session.removeAttribute("cart_list");
			List<prodDTO> cart_list = odao.getAllCart(id);
			session.setAttribute("cart_list", cart_list);
			
			System.out.println("삭제");
			
			
			return null;
		}else{
			return null;
		}
		
		
		
		
		
		
	}
}
