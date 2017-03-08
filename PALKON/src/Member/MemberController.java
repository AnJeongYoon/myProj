package Member;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Order.Action_orderCart;
import Product.Action;
import Product.ActionForward;


@WebServlet("*.mr")
public class MemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}
	
	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;");
		PrintWriter out = response.getWriter();
		
		
		String RequestURI = request.getRequestURI();
		//System.out.println(RequestURI);
		
		//프로젝트명 가져오기
		String contextPath = request.getContextPath();
		//System.out.println(contextPath);
		
		//가상주소 가져오기
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		String content = "";
		String index = "TeamProj/index.jsp?content=";
		Action action = null;
		ActionForward forward=null;
		MemberDAO mdao = new MemberDAO();
		/*action = new Action_orderCart();
		try {
			action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		//회원가입 페이지로 이동
		if(command.equals("/SignUp.mr")){
			
			content = "common/member/SignUp.jsp";
			response.sendRedirect(index+content);
			//RequestDispatcher rd = request.getRequestDispatcher(index+content);
			//rd.forward(request, response);
		
		//회원가입 처리
		}else if(command.equals("/SignUpConfrim.mr")){
			action = new Action_SignUp();
			try {
				forward = action.execute(request, response);
				System.out.println("컨트롤러 :"+ forward.getPath());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		//로그인 처리
		}else if(command.equals("/LogServlet.mr")){
			action = new Action_Login();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		//로그아웃 처리	
		}else if(command.equals("/Logout.mr")){			
			
			action = new Action_Logout();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//아이디 중복 체크
		}else if(command.equals("/idcheck.mr")){
			
			int check_num = mdao.idcheck(request, response);
			//System.out.println("ccc:"+check_num);
			out.print(check_num);
			
		//이메일 중복 체크
		}else if(command.equals("/emailcheck.mr")){
			String email = request.getParameter("email");			
			//response.sendRedirect("TeamProj/common/member/SendMail.jsp?email="+email);
			RequestDispatcher rd = request.getRequestDispatcher("TeamProj/common/member/SendMail.jsp?email="+email);
			rd.forward(request, response);	
		
		//회원정보 수정 페이지
		}else if(command.equals("/mypage.mr")){
			action = new Action_Modify();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
				
		//회원정보 수정 처리
		}else if(command.equals("/ModifyConfrim.mr")){
			action = new Action_ModifyConfirm();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//메인으로 이동	
		}else if(command.equals("/go_main.mr")){	
			
			response.sendRedirect("/projectTForgit/TeamProj/index.jsp");
			//System.out.println("간다 메인");
			/*RequestDispatcher dispatcher=request.getRequestDispatcher("/projectTForgit/TeamProj/index.jsp");
			dispatcher.forward(request, response);*/
			
		//마이페이지 메인
		}else if(command.equals("/mypageMain.mr")){
			action = new Action_MypageMain();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		//적립금 조회
		}else if(command.equals("/myPoint.mr")){
			action = new Action_point();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//배송지 조회
		}else if(command.equals("/mypage_deli.mr")){
			action = new Action_Delivery();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//배송지 등록 페이지로 이동
		}else if(command.equals("/mypage_deli_insert.mr")){
			action = new Action_Delivery_reg_check();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//response.sendRedirect(index+"common/member/reg_delivery.jsp");
		//배송지 등록
		}else if(command.equals("/mypage_deli_reg.mr")){
			action = new Action_Delivery_reg();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//배송지 삭제
		}else if(command.equals("/mypage_deli_delete.mr")){
			action = new Action_Delivery_del();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//배송지 수정 페이지로 이동
		}else if(command.equals("/mypage_deli_Modi.mr")){
			
			action = new Action_Delivery_modi();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		//베송지 수정
		}else if(command.equals("/mypage_deli_modi_Confrim.mr")){
			action = new Action_Delivery_modi_conf();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//쿠폰보기	
		}else if(command.equals("/mypage_coupon.mr")){
			action = new Action_Coupon();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		//쿠폰입력	
		}else if(command.equals("/mypage_coupon_reg.mr")){
			action = new Action_Coupon_reg();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//관리자페이지로이동
		}else if(command.equals("/go_admin.mr")){
			action = new Action_go_main();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		
		
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
				//System.out.println("foward"+forward.getPath());
			}else{
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}	
		
		
	}

}
