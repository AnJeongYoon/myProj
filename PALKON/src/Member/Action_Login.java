package Member;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Order.OrderDAO;
import Product.Action;
import Product.ActionForward;
import Product.prodDTO;


public class Action_Login implements Action{	
		
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String content = null;
		MemberDAO mdao = new MemberDAO();
		
		OrderDAO odao = new OrderDAO();
		PrintWriter out = response.getWriter();
		int check = mdao.do_login(request, response);
		if(check==1){		
			String id = request.getParameter("login_id");
			String cookie_id = request.getParameter("rem_id");
			if(mdao.loadMemInfo(id).getMb_status().equals("차단")){
				out.println("<script language='javascript'>");
				out.println("alert('님 벤');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			}else{
				if(cookie_id != null){
					Cookie cookie = new Cookie("cookie_id", id);
					cookie.setMaxAge(60*60*24);
					response.addCookie(cookie);
				}else{
					Cookie cookie = new Cookie("cookie_id", null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				mdao.log_date(id);				
				mdao.checkPointDate(id);
				mdao.CheckCouponDate(id);
				
				content = request.getParameter("path");
				
				//System.out.println("con : "+content);
				if(content.contains("/SignUpConfrim.mr")){
					content = "/projectTForgit/TeamProj/index.jsp";
				}else if(content.contains("/LogServlet.mr")){
					content = "/projectTForgit/TeamProj/index.jsp";
				}else if(content.contains("success")){
					content = "/projectTForgit/TeamProj/index.jsp";
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("mb_status", mdao.loadMemInfo(id).getMb_status());
				System.out.println(mdao.loadMemInfo(id).getMb_status());
				List<prodDTO> cart_list = odao.getAllCart(id);
				session.setAttribute("cart_list", cart_list);
				ActionForward forward = new ActionForward();
				forward.setPath(content);
				forward.setRedirect(true);
				return forward;
			}
			
		}else if(check==0){
			out.println("<script language='javascript'>");
			out.println("alert('비밀번호를 확인해주세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}else{				
			out.println("<script language='javascript'>");
			out.println("if(confirm('아이디가 존재하지 않습니다. 회원가입하시겠습니까')==true){location.href='TeamProj/index.jsp?content=common/member/SignUp.jsp';}else{history.back();}");
			out.println("</script>");
			out.close();
			return null;
		}
		
		
	}
	
}
