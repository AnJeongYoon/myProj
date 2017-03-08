package Order;

import java.util.ArrayList;
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

public class Action_orderform_direct implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			
		//뷰페이지에서 필요한 정보를 이전 페이지에서 가져와 담아둘 객체 생성
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String or_page_code = (String)request.getParameter("or_page_code"); //or_page_code : 어떤 페이지에서 넘어왔는지 알려주는 변수
		String or_pro_code = request.getParameter("or_pro_code");
		
		//orderform 뷰페이지에 공통적으로 뿌려줄 정보를 가져와 담아둘 객체를 생성하고 request영역에 저장
		prodDAO pdao = new prodDAO();
		MemberDAO mdao = new MemberDAO();
		OrderDAO odao = new OrderDAO();
		ActionForward forward = new ActionForward();
		
		MemberDTO mdto = mdao.loadMemInfo(id);
		request.setAttribute("mdto", mdto);
		
		int coupon_cnt = mdao.Coupon_count(id);
		request.setAttribute("coupon_cnt", coupon_cnt);
		
		int total_point = mdao.total_point(id);
		request.setAttribute("total_point", total_point);
		
		int used_point = mdao.used_point(id);
		request.setAttribute("used_point", used_point);
		
		String addr = (String)mdto.getMb_addr();
		String[] addrs = addr.split("/");
		request.setAttribute("addrs", addrs);
		
		
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

		
		if(or_page_code.equals("fromItem")){
			prodDTO pdto = pdao.getOneItem(or_pro_code);
			List<prodDTO> orderlist = new ArrayList<>();
			orderlist.add(pdto);
			request.setAttribute("orderlist", orderlist);
			
		}else if(or_page_code.equals("fromTopSPC")){
			
			List<prodDTO> orderlist = odao.getAllCart(id);
			request.setAttribute("orderlist", orderlist);

			//상품 합계
//			int total = 0;
//			for(int i=0; i<orderlist.size(); i++){
//				
//				prodDTO pdto = new prodDTO();
//				OrderCartDTO ocdto = new OrderCartDTO();
//				
//				ocdto = odao.getOrderList(id, or_pro_code);
//				pdto = pdao.getOneItem(ocdto.getSc_pro_code());
//				
//				System.out.println("xxxxxx : "+ocdto.getSc_pro_code()+" / "+or_pro_code);
//				
//				total = total + (pdto.getPr_price()*ocdto.getSc_pro_cnt());
//			}
//			
//			request.setAttribute("total", total);
			
		}else if(or_page_code.equals("fromSPC")){
			

		}
		
		
		
		
		forward.setPath("TeamProj/index.jsp?content=common/order/orderform.jsp?or_pro_code="+or_pro_code);
		forward.setRedirect(false);
		
		return forward;
		
		
		
	}

}
