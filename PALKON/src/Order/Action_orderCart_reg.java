package Order;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;
import Product.prodDAO;
import Product.prodDTO;

public class Action_orderCart_reg implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		prodDAO pdao = new prodDAO();		
		prodDTO pdto = pdao.getOneItem(request.getParameter("pr_pro_code"));
		
		OrderDAO odao = new OrderDAO();
		int check = odao.CheckCart(pdto, id);
		
		if(check==0){
			odao.updateCart(pdto, id);
			PrintWriter out = response.getWriter();			
			out.println("중복");
			out.close();
		}else{
			odao.insertCart(pdto, id);			
			
		}
		List<prodDTO> cart_list = odao.getAllCart(id);
		session.setAttribute("cart_list", cart_list);
		return null;
	}
}
