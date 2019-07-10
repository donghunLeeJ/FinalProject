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
		String msg = "<!DOCTYPE html>\r\n" + 
				"<html lang=\"en\">\r\n" + 
				"<head>\r\n" + 
				"	<meta charset=\"UTF-8\">\r\n" + 
				"	<title>Document</title>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				"	<h1>회원가입 인증</h1>\r\n" + 
				"	<a href=\"localhost/member/verifiedId?id="+id+"\"><button>인증버튼</button></a>\r\n" + 
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
