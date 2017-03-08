package Order;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;
import Product.prodDTO;

public class Action_orderCart_cntUp implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int upCount = Integer.parseInt(request.getParameter("upCount"));
		String sc_pro_code = request.getParameter("sc_pro_code");
		OrderDAO odao = new OrderDAO();
		HttpSession session = request.getSession();
		
		int cnt = odao.updateCount((String)session.getAttribute("id"), upCount, sc_pro_code);
		List<prodDTO> cart_list = odao.getAllCart((String)session.getAttribute("id"));
		session.setAttribute("cart_list", cart_list);
		PrintWriter out = response.getWriter();
		out.println(cnt);
		return null;
	}
}
