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

		String msg = "<!DOCTYPE html><html lang=\"en\">\r\n" + "    <head>\r\n" + "        <meta charset=\"UTF-8\">\r\n"
				+ "        <title>Document</title> \r\n" + "    </head> \r\n" + "    <body>\r\n"
				+ "        <div class=\"wrapper\" style=\"text-align: center;width:800px\" >\r\n"
				+ "            <div class=\"header\" style=\"padding-top:20px;\">\r\n"
				+ "                <h1 style=\"padding-top:7pxfont-size:30px;\">\r\n"
				+ "                    <img src=\"https://postfiles.pstatic.net/MjAxOTA3MjhfMjY0/MDAxNTY0MjkzMzM4OTQy.VbghILPDbg3x60F9IhhNdGLLNfc4yJx0y4H5idffVqQg.fFc3eAkY19CfrKAAfm5SnpH5NGNxkCHl2WTjefxQTPQg.PNG.cwg94/logo4.png?type=w580\" style=\"width:150px;height:100px;margin-left:20px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 60px\">AGGABI</span></h1>\r\n"
				+ "            </div><div class=\"body\"><br><br>\r\n"
				+ "            <p style=\"margin-top:15px;font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;안녕하세요. &nbsp;<strong>\r\n"
				+ "\r\n" + "        " + id + "        </strong>님</p>\r\n"
				+ "            <p  style=\"margin-top:15px;font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>AGGABI</strong> 회원가입을 감사드립니다.</p> \r\n"
				+ "            <p  style=\"margin-top:15px;font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;안전한 서비스를 위하여 이메일 인증을 완료하여 주시기 바랍니다.</p>  <br>\r\n"
				+ "            <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n"
				+ "                <a href=\"http://192.168.60.33/member/verifiedId?id=" + id + "\"\r\n"
				+ "                   style=\"text-decoration: none\">이메일 인증을 하시려면 여기를 클릭하세요.</a>\r\n"
				+ "            </div>           <br><br>\r\n"
				+ "            <p style=\"font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value Exchange. <strong>AGGABI</strong></p>\r\n"
				+ "\r\n" + "            </div>\r\n"
				+ "            <div class=\"footer\" style=\"padding-bottom:50px\"> <br>\r\n"
				+ "                <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주(AGGABI) 서울특별시 중구 남대문로 1가 남대문로 118 하늘빌딩 </p>\r\n"
				+ "                <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;16층 | &nbsp;&nbsp;대표 이동훈 &nbsp; 010-5400-6121</p>\r\n"
				+ "                <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객센터 info@aggabi.co.kr</p>\r\n"
				+ "                <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © AGGABI Corp. All rights reserved.</p>\r\n"
				+ "            </div></div></body></html>";


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

		String msg = "<!DOCTYPE html><html lang=\"en\">\r\n" + "    <head>\r\n"
				+ "        <meta charset=\"UTF-8\"><title>Document</title>\r\n" + "    </head>\r\n" + "    <body>\r\n"
				+ "        <div class=\"wrapper\" style=\"text-align: center;width:800px\" >\r\n"
				+ "            <div class=\"header\" style=\"padding-top:20px;\">\r\n" + "\r\n"
				+ "                <h1 style=\"padding-top:7pxfont-size:30px;\"><img src=\"https://postfiles.pstatic.net/MjAxOTA3MjhfMjY0/MDAxNTY0MjkzMzM4OTQy.VbghILPDbg3x60F9IhhNdGLLNfc4yJx0y4H5idffVqQg.fFc3eAkY19CfrKAAfm5SnpH5NGNxkCHl2WTjefxQTPQg.PNG.cwg94/logo4.png?type=w580\" style=\"width:150px;height:100px;margin-left:20px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 60px\">AGGABI</span></h1>\r\n"
				+ "            </div>\r\n" + "            <div class=\"body\"><br><br>\r\n"
				+ "                <p style=\"margin-top:15px;font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;안녕하세요. &nbsp;<strong>\r\n"
				+ "                   " + id + " </strong> &nbsp;님</p>\r\n"
				+ "                <p  style=\"margin-top:15px;font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>AGGABI</strong> 비밀번호 찾기 페이지 입니다. </p>\r\n"
				+ "                <br>     <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n"
				+ "                <a href=\"http://192.168.60.33/member/yourPW?id=" + id + "\"\r\n"
				+ "                   style=\"text-decoration: none\">비밀번호 찾기를 하시려면 여기를 클릭하세요.</a>\r\n"
				+ "                </div> <br><br>\r\n"
				+ "                <p style=\"font-size:20px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value Exchange. <strong>AGGABI</strong></p>\r\n"
				+ "            </div>         \r\n"
				+ "            <div class=\"footer\" style=\"padding-bottom:50px\"> <br>\r\n"
				+ "                <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주(AGGABI) 서울특별시 중구 남대문로 1가 남대문로 118 하늘빌딩 </p>\r\n"
				+ "                <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;16층 | &nbsp;&nbsp;대표 이동훈 &nbsp; 010-5400-6121</p>\r\n"
				+ "                <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객센터 info@aggabi.co.kr</p>\r\n"
				+ "                <p  style=\"margin-top:15px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copyright © AGGABI Corp. All rights reserved.</p>\r\n"
				+ "            </div></div></body>\r\n" + "</html>";


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
