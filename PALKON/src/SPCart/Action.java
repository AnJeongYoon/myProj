//1월 10일 파일 생성
//1월 10일 코딩 완료

package SPCart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}
