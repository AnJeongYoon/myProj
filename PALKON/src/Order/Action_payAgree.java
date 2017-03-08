package Order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;
import Product.ActionForward;
import Product.prodDAO;
import Product.prodDTO;
import Product.Action;

public class Action_payAgree implements Action {

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		OrderDAO odao = new OrderDAO();
		OrderDTO odto = new OrderDTO();
		String content = null;
		
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		request.setAttribute("id", id);
		
		
		
		odao.insertOrderList(request, response);
		//content ="TeamProj/index.jsp?content=common/member/success.jsp?id="+id+"&email="+email+"&name="+name;
		
		

		
		List<prodDTO> orderlist = odao.getAllCart(id); //카트에서 가져오는게 아니라 새로운 주문테이블에서 가져와야 함
		request.setAttribute("orderlist", orderlist);
		
		
		content = "TeamProj/index.jsp?content=common/order/orderresult.jsp";
		



		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath(content);
		//System.out.println(forward.getPath());
		return forward;
		
		
	}
	
	
	
	
	
	
}
