<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>
<%@ page import="pe.hoyanet.mail.*" %> 


<%
request.setCharacterEncoding("UTF-8");

StringBuffer buffer = new StringBuffer();
for (int i=0; i<=6;i++){
	int n=(int)(Math.random()*10);
	buffer.append(n);
	}
boolean result=false;
String message="";
String sender = " gongpk.extra@gmail.com"; // 보내는 메일주소 구글로 입력해주세요. 
//String receiver = (String)request.getAttribute("email");
String receiver = request.getParameter("email");

System.out.print(receiver);
String subject = "Shopping 회원가입 인증번호입니다. ";
String content = "인증번호는 ["+buffer.toString()+"] 입니다. \n 인증번호를 사이트에 입력해서 인증을 완료하세요";

// 정보를 담기 위한 객체
Properties p = new Properties();

// SMTP 서버의 계정 설정
// Naver와 연결할 경우 네이버 아이디 지정
// Google과 연결할 경우 본인의 Gmail 주소
p.put("mail.smtp.user", "gongpk.extra@gmail.com");

// SMTP 서버 정보 설정
// 네이버일 경우 smtp.naver.com
// Google일 경우 smtp.gmail.com
p.put("mail.smtp.host", "smtp.gmail.com");
    
// 아래 정보는 네이버와 구글이 동일하므로 수정하지 마세요.
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");


try {
    Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(p, auth);

    // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
    ses.setDebug(true);
        
    // 메일의 내용을 담기 위한 객체
    MimeMessage msg = new MimeMessage(ses);

    // 제목 설정
    msg.setSubject(subject);
        
    // 보내는 사람의 메일주소
    Address fromAddr = new InternetAddress(sender);
    msg.setFrom(fromAddr);
        
    // 받는 사람의 메일주소
    Address toAddr = new InternetAddress(receiver);
    msg.addRecipient(Message.RecipientType.TO, toAddr);
        
    // 메시지 본문의 내용과 형식, 캐릭터 셋 설정
    msg.setContent(content, "text/html;charset=UTF-8");
        
    // 발송하기
    Transport.send(msg);
        
    message="메일 발송 성공";
	result = true;
	
} catch (Exception mex) {
	message="이메일 발송에 실패했습니다.\n올바른 이메일 형식을 입력해 주세요(123@123.com)";
    mex.printStackTrace();
    result = false;
 	
}
    
/* String script = "<script type='text/javascript'>\n";
script += "alert('메일발송에 성공했습니다.');\n";
script += "document.form.submit();"; 
script += "</script>";

out.print(script); */

	
%>

<?xml version='1.0' encoding='UTF-8'?>
<login>
	<result><%=result %></result>
	<message><%=message %></message>
	<random><%=buffer.toString()%></random>
</login>
