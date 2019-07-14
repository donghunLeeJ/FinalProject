<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style2.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/module/adminHeaderAndNavi.jsp"></jsp:include>
<!-- 
private String member_id;
	private String member_pw;
	private String member_name;
	private String member_birth;
	private String member_gender;
	private int member_phone;
	private String member_postcode;
	private String member_address1;
	private String member_address2;
  	private String member_imgpath;
	private String member_intro;
 -->

<c:forEach var="i" items="${memberList}">
${i.member_id} : ${i.member_name} : ${i.member_phone}<br>
</c:forEach>


<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>