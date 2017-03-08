package Admin.Product;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Product.Action;
import Product.ActionForward;
import Product.prodDAO;

public class AdminProductController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("admincontroller까지 옴");
		
		String realFolder="";
		String saveFolder="./assets/img/product";
		int fileSize=5*1024*1024;
		
		realFolder="C:/Users/itwillbs06-20/git/doTeam/projectTForgit/WebContent/TeamProj/assets/img/product";
		
		AdprodDTO addto = new AdprodDTO();
		
		MultipartRequest multi=null;
		multi=new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
		
		addto.setPr_pro_code(multi.getParameter("procode"));
		addto.setPr_product(multi.getParameter("proname"));
		addto.setPr_category(multi.getParameter("procate"));
		addto.setPr_brand(multi.getParameter("probrand"));
		addto.setPr_price(Integer.parseInt(multi.getParameter("proprice")));
		addto.setPr_stock(Integer.parseInt(multi.getParameter("prostock")));
		addto.setPr_orgin(multi.getParameter("prorgin"));
		addto.setPr_color(multi.getParameter("procolor"));
		addto.setPr_orgin_code(multi.getParameter("orgincode"));
		addto.setPr_material(multi.getParameter("promt"));		
		addto.setPr_length(multi.getParameter("prolength"));
		addto.setPr_status(multi.getParameter("prosale"));
		addto.setPr_discount(multi.getParameter("discnt"));
		addto.setPr_pro_info(multi.getParameter("proinfo"));
		addto.setImage_name(multi.getParameter("proimg"));
		addto.setPr_available(multi.getParameter("proab"));
		addto.setPr_reg_date(new Timestamp(System.currentTimeMillis()).toString());
		addto.setImage_path(saveFolder);
		
		//등록 성공시 담을 변수 선언
		 boolean result= false;
		
		//회원 정보 
		AdprodDAO adprodao = new AdprodDAO();	
	
	
		//상품 등록 매소드 
		result = adprodao.insertBoard(addto);
		
		
		
		if(result==false){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('등록 실패');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;

			
		}else{
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('등록 성공');");
			out.println("history.back();");
			out.println("</script>");	
			out.close();
		
			request.setAttribute("addto", addto);
			request.setAttribute("result", result);
			
			//페이지 이동 여부값 및 이동할 페이지 경로 주소값 저장
			ActionForward forward = new ActionForward();
			//false 이면 sendredirect 
			forward.setRedirect(false);
			
			//list 페이지로 이동 
			forward.setPath("TeamProj/admin/index.jsp?content=common/goods/product_form.jsp");
			
			return forward;
			
			
		}

		
	}
	
	

}