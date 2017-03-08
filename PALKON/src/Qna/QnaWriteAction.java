package Qna;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Member.MemberDTO;
import Product.Action;
import Product.ActionForward;


public class QnaWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			System.out.println("QnaWriteAction execute()");
			//한글처리
			request.setCharacterEncoding("utf-8");
			
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			String realFolder="";
			String saveFolder="./common/board/qnaupload";
			boolean result=false;
			
			int fileSize=5*1024*1024;
			
			realFolder = "C:/Users/itwillbs06-04/git/doTeam/projectTForgit/WebContent/TeamProj/common/board/qnaupload";
			
			QnaDTO qd=new QnaDTO();
			QnaDAO qdao= new QnaDAO();
			ActionForward forward=new ActionForward();
			try{
				
			
			MultipartRequest multi=null;
			multi=new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
			
			qd.setQna_pass(multi.getParameter("pass"));
			qd.setQna_subject(multi.getParameter("subject"));
			qd.setQna_content(multi.getParameter("content"));
			qd.setQna_name(multi.getParameter("name"));
			qd.setDate(multi.getParameter("date"));
			qd.setTextck(multi.getParameter("textck"));
			qd.setQna_file(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			
			
			//  insertBoard(qd)메서드 호출
			result = qdao.insertBoard(qd);
			// 이동  ./qna_list.br
			
			request.setAttribute("qd", qd);
			
			
			if(result==false){
				System.out.println("게시판 등록 실패");
				return null;
			}
			System.out.println("게시판 등록 완료");
			
			forward.setRedirect(true);
			forward.setPath("./qna_list.br");
			return forward;
			
			}catch(Exception e){
				e.printStackTrace();
			}
			return null;
		}
	}


