package Order;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;
import Member.MemberDTO;
import Product.Action;
import Product.ActionForward;
import Product.prodDAO;
import Product.prodDTO;

public class Action_orderCart implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");	
		
		PrintWriter out = response.getWriter();
		
		OrderDAO odao = new OrderDAO();
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.loadMemInfo(id);
		
		int coupon_cnt = mdao.Coupon_count(id);
		int total_point = mdao.total_point(id);
		int used_point = mdao.used_point(id);
		List<prodDTO> cart_list = odao.getAllCart(id);
		
		request.setAttribute("mdto", mdto);
		request.setAttribute("total_point", total_point);
		request.setAttribute("used_point", used_point);
		request.setAttribute("coupon_cnt", coupon_cnt);
		request.setAttribute("cart_list", cart_list);
		
//		int total = 0;
//		
//		String[] check = request.getParameterValues("check");
//		String all_check =  request.getParameter("all_check");
//		
//		if(request.getParameterValues("check")!=null){
//			if(request.getParameter("all_check") != null){
//				if(all_check.equals("1")){
//					request.setAttribute("all_check", 2);
//				}				
//			}else{
//				request.setAttribute("all_check", 1);
//			}
//			check = request.getParameterValues("check");			
//			for(int i=0; i<check.length; i++){
//				
//				prodDTO pdto = new prodDTO();
//				prodDAO pdao = new prodDAO();
//				OrderCartDTO ocdto = new OrderCartDTO();
//				
//				ocdto = odao.getOneCartCnt(id, check[i]);
//				pdto = pdao.getOneItem(ocdto.getSc_pro_code());
//				
//				total = total + (pdto.getPr_price()*ocdto.getSc_pro_cnt());
//			}
//			request.setAttribute("check", check);
//			request.setAttribute("total", total);
//			
//		}else{
//			request.setAttribute("total", 0);
//		}
		
		//등급에 따른 할인률 표시
		int GR_discountRate = 0;
	
		if(mdto.getMb_grade().equals("D")){
			GR_discountRate = 5;
		}else if(mdto.getMb_grade().equals("C")){
			GR_discountRate = 10;
		}else if(mdto.getMb_grade().equals("B")){
			GR_discountRate = 15;
		}else if(mdto.getMb_grade().equals("A")){
			GR_discountRate = 20;
		}
		
		request.setAttribute("GR_discountRate", GR_discountRate);
		
		ActionForward forward = new ActionForward();
		forward.setPath("TeamProj/index.jsp?content=common/cart/order_cart.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
