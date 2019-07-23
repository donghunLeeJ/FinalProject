<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
</head>
<body oncontextmenu="return false" ondragstart="return false"	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>

<div class="tab-pane" id="messages">
						<div class="alert alert-info alert-dismissable">
							<a class="panel-close close" data-dismiss="alert">×</a> 최근 받은 쪽지
							목록입니다
						</div>
						<table class="table table-hover table-striped">
							<tbody>
								<tr>
									<td><span class="float-right font-weight-bold">3
											hrs ago</span> Here is your a link to the latest summary report from
										the..</td>
								</tr>
								<tr>
									<td><span class="float-right font-weight-bold">Yesterday</span>
										There has been a request on your account since that was..</td>
								</tr>
								<tr>
									<td><span class="float-right font-weight-bold">9/10</span>
										Porttitor vitae ultrices quis, dapibus id dolor. Morbi
										venenatis lacinia rhoncus.</td>
								</tr>
								<tr>
									<td><span class="float-right font-weight-bold">9/4</span>
										Vestibulum tincidunt ullamcorper eros eget luctus.</td>
								</tr>
								<tr>
									<td><span class="float-right font-weight-bold">9/4</span>
										Maxamillion ais the fix for tibulum tincidunt ullamcorper
										eros.</td>
								</tr>
							</tbody>
						</table>
					</div>
	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>