package com.project.dao;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Component;

@Component
public class HtmlEmailDAO {

	public static void sendMail(String id) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; // SMTP 서버명
		String hostSMTPid = "cwg94"; // 아이디
		String hostSMTPpw = "1q2w3e4r%T"; // 비밀번호

		// 보내는 사람

		String fromEmail = "cwg94@naver.com"; // 보내는사람이메일
		String fromName = "develLover";

		String subject = "[JH!] 회원가입 확인 ";
		String msg = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n" + 
				"<html>\r\n" + 
				"<head>\r\n" + 
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n" + 
				"<title>이메일 인증번호</title>\r\n" + 
				"\r\n" + 
				"<!-- jQuery library -->\r\n" + 
				"<script\r\n" + 
				"   src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n" + 
				"<style>\r\n" + 
				".wrapper {\r\n" + 
				"   border: 1px solid blue;\r\n" + 
				"}\r\n" + 
				"</style>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 

				"   <div class=\"wrapper\">\r\n" + 
				"      <div style=\"text-align: center; padding-bottom: 30px\">\r\n" + 
				"         <h1 style=\"color: blue\">회원가입 인증 절차 입니다.</h1>\r\n" + 
				"      </div>\r\n" + 
				"      <div style=\"text-align: center\">\r\n" + 
				"         <div\r\n" + 
				"            style=\"padding-bottom: 30px; border-bottom: 3px solid #D7E4F0; color: #D7E4F0; font-size: 25px\">\r\n" + 
				"            <div>이메일 인증 안녕하세요,"+id+"  님. 아래 버튼을 클릭해 등록된 이메일 주소를 인증해 주세요.</div>\r\n" + 
				"\r\n" + 
				"         </div>\r\n" + 
				"         <div style=\"text-align: center\">\r\n" + 
				"            <div style=\"padding-bottom: 30px; margin-top: 40px\">\r\n" + 
				"               <a href=\"localhost/member/verifiedId?id="+id+"\"><input type=\"button\" id=\"btn\" value=\"가  입  하  기\"\r\n" + 
				"                  style=\"width: 100px; height: 60px; border-radius: 3px;\"></a>\r\n" + 
				"            </div>\r\n" + 
				"         </div>\r\n" + 
				"         <div>\r\n" + 
				"            \r\n" + 
				"         </div>\r\n" + 
				"\r\n" + 
				"      </div>\r\n" + 
				"   </div>\r\n" + 
				"   \r\n" + 

				"	<h1>회원가입 인증</h1>\r\n" + 
				"	<a href=\"http://localhost/member/verifiedId?id="+id+"\"><button>인증버튼</button></a>\r\n" + 

				"</body>\r\n" + 
				"</html>";

		// email 전송

		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true); // SSL사용 (TLS가 없는 경우 SSL사용)

			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587); // 포트번호

			mail.setAuthentication(hostSMTPid, hostSMTPpw);
			mail.setStartTLSEnabled(true); // TLS사용
			mail.addTo(id); // 받는놈 이메일 주소
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg); // 보낼HTML
			mail.send();

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
