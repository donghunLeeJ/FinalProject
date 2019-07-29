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
		String hostSMTPpw = "1q2w3e4r%T^Y"; // 비밀번호

		// 보내는 사람

		String fromEmail = "cwg94@naver.com"; // 보내는사람이메일
		String fromName = "develLover";


		String subject = "[AGGABI] 회원가입 확인 ";
		String msg = "<!DOCTYPE html>\r\n" + "<html lang=\"en\">\r\n" + "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n" + "    <title>Document</title>\r\n" + "\r\n" + "</head>\r\n"
				+ "<body>\r\n" + "    <div class=\"wrapper\">\r\n"
				+ "        <div class=\"header\"><h1 style=\"padding-top:7pxfont-size:30px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AGGABI</h1></div>\r\n"
				+ "        <div class=\"body\">\r\n"
				+ "            <p style=\"margin-top:15px;font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;안녕하세요 " + id
				+ "님</p>\r\n"
				+ "            <p  style=\"margin-top:15px;font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>AGGABI</strong> 회원가입을 감사드립니다.</p>\r\n"
				+ "            <p  style=\"margin-top:15px;font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;안전한 서비스를 위하여 이메일 인증을 완료하여 주시기 바랍니다.</p>\r\n"
				+ "            <br>\r\n"
				+ "            <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=\"http://192.168.60.33/member/verifiedId?id="
				+ id + "\" style=\"text-decoration: none\">이메일 인증을 하시려면 여기를 클릭하세요.</a></div>\r\n" + "        <br>\r\n"
				+ "        <br>\r\n"
				+ "        <p style=\"font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value Exchange. <strong>AGGABI</strong></p>\r\n"
				+ "      \r\n" + "       \r\n" + "        </div>\r\n" + "     \r\n"
				+ "        <div class=\"footer\">\r\n" + "           <br>\r\n"
				+ "            <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주(AGGABI) 서울특별시 중구 남대문로 1가 남대문로 118 하늘빌딩 </p>\r\n"
				+ "            <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;16층 | &nbsp;&nbsp;대표 이동훈 &nbsp; 010-5400-6121</p>\r\n"
				+ "            <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객센터 info@aggabi.co.kr</p>\r\n"
				+ "            <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © AGGABI Corp. All rights reserved.</p>\r\n"
				+ "            \r\n" + "        </div>\r\n" + "        \r\n" + "        \r\n" + "    </div>\r\n"
				+ "</body>\r\n" + "</html>";


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

	public static void findPw(String id) throws Exception {

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; // SMTP 서버명
		String hostSMTPid = "cwg94"; // 아이디
		String hostSMTPpw = "1q2w3e4r%T^Y"; // 비밀번호

		// 보내는 사람

		String fromEmail = "cwg94@naver.com"; // 보내는사람이메일
		String fromName = "develLover";


		String subject = "[AGGABI] 비밀번호 찾기 ";
		String msg = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n"
				+ "<html>\r\n" + "<head>\r\n"
				+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n"
				+ "<title>비밀번호 찾기 인증번호</title>\r\n" + "\r\n" + "<!-- jQuery library -->\r\n"
				+ "<link rel=\"stylesheet\" href=\"/css/style2.css\">" + "<script\r\n"
				+ "   src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\r\n"
				+ "<style>\r\n" + ".wrapper {\r\n" + "   border: 1px solid blue;\r\n" + "}\r\n" + "</style>\r\n"
				+ "</head>\r\n" + "<body>\r\n" +

				"   <div class=\"wrapper\">\r\n" + "      <div style=\"text-align: center; padding-bottom: 30px\">\r\n"
				+ "         <h1 style=\"color: blue\">비밀번호 찾기 인증 절차 입니다.</h1>\r\n" + "      </div>\r\n"
				+ "      <div style=\"text-align: center\">\r\n" + "         <div\r\n"
				+ "            style=\"padding-bottom: 30px; border-bottom: 3px solid #D7E4F0; color: #D7E4F0; font-size: 25px\">\r\n"
				+ "            <div>이메일 인증 안녕하세요," + id + "  님. 아래 버튼을 클릭해 등록된 이메일 주소를 인증해 주세요.</div>\r\n" + "\r\n"
				+ "         </div>\r\n" + "         <div style=\"text-align: center\">\r\n"
				+ "            <div style=\"padding-bottom: 30px; margin-top: 40px\">\r\n"
				+ "               <a href=\"http://192.168.60.33/member/yourPW?id=" + id
				+ "\"><input class=\"btn akame-btn btn-3 mt-15 active\" type=\"button\" id=\"btn\" value=\"비밀번호 찾기\"\r\n"
				+ "                  style=\"width: 100px; height: 60px; border-radius: 3px;\"></a>\r\n"
				+ "            </div>\r\n" + "         </div>\r\n" + "         <div>\r\n" + "            \r\n"
				+ "         </div>\r\n" + "\r\n" + "      </div>\r\n" + "   </div>\r\n" + "   \r\n" + "</body>\r\n"
				+ "</html>";

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
			mail.addTo(id); // 받는사람 이메일 주소
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg); // 보낼HTML
			mail.send();

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
