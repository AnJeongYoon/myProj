package Order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;
import Member.MemberDTO;
import Member.Member_DeliveryDTO;
import Product.Action;
import Product.ActionForward;

public class Action_destinationList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//뷰페이지에서 필요한 정보를 이전 페이지에서 가져와 담아둘 객체 생성
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		//orderform 뷰페이지에 공통적으로 뿌려줄 정보를 가져와 담아둘 객체를 생성하고 request영역에 저장
		
		
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO mdto = new MemberDTO();
		mdto = mdao.loadMemInfo(id);
		request.setAttribute("mdto", mdto);
		
		List<Member_DeliveryDTO> De_list = mdao.getDeliveryAddr(id);
		request.setAttribute("De_list", De_list);
		//System.out.println(De_list.get(6).getDe_addr());
		
		ActionForward forward = new ActionForward();
		
		
		
		forward.setPath("TeamProj/common/order/destinationList.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

	
	
}
