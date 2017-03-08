//1월 10일 파일 생성
//1월 10일 코딩 완료


package SPCart;


public class ActionForward {
	private boolean isRedirect = false; //페이지주소(경로)를 노출하지 않음

	//이동페이지 경로 주소값 저장변수
	private String path = null;

	//페이지 이동방식 여부값 리턴 메소드
	public boolean isRedirect (){
		return isRedirect;
	}

	//페이지 이동방식 여부값 저장메소드
	public void setRedirect(boolean isRedirect){
		this.isRedirect = isRedirect;
	}

	//이동페이지 경로 주소값 리턴 메소드
	public String getPath(){
		return path;
	}
	
	//이동할 페이지 경로 주소값 저장 메소드
	public void setPath(String path){
		this.path = path;
	}
	
}
