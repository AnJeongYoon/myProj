package Order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.Action;
import Product.ActionForward;


@WebServlet("*.or")
public class OrderFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doService(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doService(request, response);
	}

	protected void doService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		

		// 사용자의 요청 전체주소 알아오기 (프로젝트명을 포함한 전체주소 알아오기)
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		// System.out.println(RequestURI);

		// 가상주소 가져오기
		String command = RequestURI.substring(contextPath.length());

		// Action, ActionForward 객체
		Action action = null;
		ActionForward forward = null;
		action = new Action_orderCart();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//장바구니 뷰페이지에서 주문하기 뷰페이지로 넘어가는 경우

		 if(command.equals("/order_orderform_direct.or")){
			action = new Action_orderform_direct();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		 }else if(command.equals("/order_orderform.or")){
			action = new Action_orderform();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();	
			}
			
		//장바구니 메인화면	
		}else if(command.equals("/order_cart.or")){
			action = new Action_orderCart();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//장바구니 추가
		}else if(command.equals("/or_cart_reg.or")){
			action = new Action_orderCart_reg();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}		
		//장바구니 상품 개수증가
		}else if(command.equals("/or_cart_cntUp.or")){
			action = new Action_orderCart_cntUp();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}		
		//장바구니 지우기
		}else if(command.equals("/or_delete_cart.or")){
			action = new Action_orderCart_del();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//주문서 품목 지우기
		}else if(command.equals("/or_delete_orderform.or")){
			action = new Action_orderForm_del();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//orderform에서 주소록을 클릭했을 때 주소록 리스트를 연결
		}else if(command.equals("/order_destinationList.or")){
			
			action = new Action_destinationList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		//orderform에서 주문하기 클릭했을 때 주문하기 테이블에 정보들이 insert
		}else if(command.equals("/order_payAgree.or")){
			

			action = new Action_payAgree();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/order_history.or")){
			
			action = new Action_history();
			try{
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/my_order_history.or")){
			
			action = new Action_my_history();
			try{
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		//이동
		if(forward!=null){
			if(forward.isRedirect()){//true
				response.sendRedirect(forward.getPath());
			}else{//false
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}
}