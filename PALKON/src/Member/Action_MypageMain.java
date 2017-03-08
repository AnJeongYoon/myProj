package Member;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Product.Action;
import Product.ActionForward;

public class Action_MypageMain implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String content="TeamProj/index.jsp?content=common/member/MypageMain.jsp";
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		
		
			MemberDAO mdao = new MemberDAO();
			MemberDTO mdto = new MemberDTO();
					
			int total = mdao.total_point(id);
			int used = mdao.used_point(id);
			mdto = mdao.loadMemInfo(id);
			int total_cp = mdao.Coupon_count(id);
			int used_cp = mdao.used_coupon(id);
			request.setAttribute("mdto", mdto);		
			request.setAttribute("total", total);
			request.setAttribute("used", used);		
			request.setAttribute("total_cp", total_cp);
			request.setAttribute("used_cp", used_cp);
			forward.setRedirect(false);
			forward.setPath(content);
			
		
		return forward;
	}
}
