package SPCart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.GoodsListController;

@WebServlet("*.SPC")
public class SPCartController extends HttpServlet {

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
		PrintWriter out = response.getWriter();

		// 사용자의 요청 전체주소 알아오기 (프로젝트명을 포함한 전체주소 알아오기)
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		// System.out.println(RequestURI);

		// 가상주소 가져오기
		String command = RequestURI.substring(contextPath.length());

		// Action, ActionForward 객체
		Action action = null;
		ActionForward forward = null;

		
		if (command.equals("/shopping-cart.SPC")) {
			//SPClistAction
			action = new SPClistAction();
			try {
				forward=action.execute(request, response);
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