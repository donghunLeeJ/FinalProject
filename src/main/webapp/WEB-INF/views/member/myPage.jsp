<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="./img/core-img/favicon.ico">
<link rel="stylesheet" href="../css/style2.css">
<style>
.float {
	float: left;
}

#findAdd {
	padding: 5px;
	width: 50px;
	height: 50px;
}

#myinfo {
	width: 200px;
	height: 200px;
}

.no {
	padding: 0px;
	margin: 0px;
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<jsp:include page="/WEB-INF/views/module/headerAndNavi.jsp"></jsp:include>


	<div class="container">



		<form action="/member/edit_mypage" method="post">
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">���대��</label>
				<div class="col-lg-9">
					<input class="form-control" type="text" name="member_name"
						value="${id.member_id }" readonly>


				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">�대�</label>
				<div class="col-lg-9">
					<input class="form-control" name="member_id" type="text"
						value="${id.member_name }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">����</label>
				<div class="col-lg-9">
					<input class="form-control" type="text" value="${id.member_birth}"
						readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">�깅�</label>
				<div class="col-lg-9">
					<input class="form-control" type="text"
						value="${id.member_gender }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">�고�몃���
					<!--                             <button type="button" onclick="sample4_execDaumPostcode()" -->
					<!--                            class="btn btn-primary p-1"data-aria-haspopup="true"aria-expanded="false" id="findAdd">蹂�寃�</button>       -->
					<img src="/img/core-img/find_addr.png"
					onclick="sample4_execDaumPostcode()" class="mx-auto img-circle"
					data-aria-haspopup="true" aria-expanded="false" id="findAdd">
				</label>
				<div class="col-lg-9">
					<input class="form-control" id="postcode" name="member_postcode"
						type="text" value="${id.member_postcode}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">��濡�紐�
					二쇱�� </label>
				<div class="col-lg-9">
					<input class="form-control" id="add1" name="member_address1"
						type="text" value="${id.member_address1}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">���몄＜��
				</label>
				<div class="col-lg-9">
					<input class="form-control" id="add2" name="member_address2"
						type="text" value="${id.member_address2}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">�몃����
					踰���</label>
				<div class="col-lg-9">
					<input class="form-control" id="phone" name="member_phone"
						type="text" value="${id.member_phone}"
						placeholder=" '-' ���명��怨� ����">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">��湲�
					��媛�</label>
				<div class="col-lg-9">
					<input class="form-control" id="intro" name="member_intro"
						type="text" value="${id.member_intro}">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">鍮�諛�踰���</label>
				<div class="col-lg-9">
					<input class="form-control" type="password" name="member_pw"
						id="pw1">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">鍮�諛�踰���
					����</label>
				<div class="col-lg-9">
					<input class="form-control" type="password" id="pw2">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label"></label>
				<div class="col-lg-9">

					<input type="submit" id="edit_info" class="btn btn-primary"
						value="��蹂� ����"> <input type="button" id="delId"
						class="btn btn-primary" value="���� ����">
				</div>
			</div>
		</form>
	</div>
	</div>


	<script>
		$("#file").hide();
		$("#change").on("click", function() {
			$("#file").click();//�ъ�蹂�寃� 踰��� ��瑜대㈃ file踰��� �대┃��

		});

		$("#file").on("change", function() {
			file = $("#file").prop("files")[0];
			ImgURL = window.URL.createObjectURL(file);
			$("#preview img").attr('src', ImgURL);
			$("#preview").show();
		})

		$("#edit_info").on("click", function() {//��蹂댁���� 踰��� �대┃��

			var regnum = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

			if ($("#postcode").val() == "") {
				alert("二쇱��瑜� ���ν���몄��");
			} else if ($("#phone").val() == "") {
				alert("�몃���� 踰��몃�� ���ν���몄��");
				$("#phone").focus();
			} else if (!regnum.test($("#phone").val())) {
				alert("�몃���� 踰��멸� ������ 留�吏� ���듬����");
				$("#phone").focus();
			} else if ($("#pw1").val() == "") {
				alert("鍮�諛�踰��몃�� ���ν�댁＜�몄��");
				$("#pw1").focus();
			} else if ($("#pw2").val() == "") {
				alert("鍮�諛�踰��� ���몄�� ���ν�댁＜�몄��");
				$("#pw2").focus();
			} else if ($("#pw1").val() != $("#pw2").val()) {
				alert("鍮�諛�踰��멸� 媛����� �⑸����");
				$("#pw2").focus();
			} else if ($("#add2").val() == "") {
				var result = confirm("���몄＜��媛� ���듬����.\n蹂�寃쏀����寃��듬��源�?");
				if (result)
					$("#edit_mypage").submit();
				else
					return;
			}

		});
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	<!--二쇱���깅�-->
		//蹂� ���������� ��濡�紐� 二쇱�� ��湲� 諛⑹���� ���� 踰��뱀�� �곕��, �대�ㅼ�ㅻ�� �곗�댄�곕�� 議고�⑺���� �щ�瑜� 二쇱��瑜� 援ъ�깊���� 諛⑸��� �ㅻ��⑸����.
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// �������� 寃���寃곌낵 ��紐⑹�� �대┃������ �ㅽ���� 肄���瑜� ���깊���� 遺�遺�.

					// ��濡�紐� 二쇱���� �몄� 洹�移��� �곕�� 二쇱��瑜� ��������.
					// �대�ㅼ�ㅻ�� 蹂���媛� 媛��� ���� 寃쎌�곗�� 怨듬갚('')媛��� 媛�吏�誘�濡�, �대�� 李멸����� 遺�湲� ����.
					var roadAddr = data.roadAddress; // ��濡�紐� 二쇱�� 蹂���
					var extraRoadAddr = ''; // 李멸� ��紐� 蹂���

					// 踰�����紐��� ���� 寃쎌�� 異�媛�����. (踰���由щ�� ����)
					// 踰������� 寃쎌�� 留�吏�留� 臾몄��媛� "��/濡�/媛�"濡� ������.
					if (data.bname !== '' && /[��|濡�|媛�]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 嫄대Ъ紐��� ��怨�, 怨듬��二쇳���� 寃쎌�� 異�媛�����.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// ������ 李멸���紐⑹�� ���� 寃쎌��, 愿��멸�吏� 異�媛��� 理�醫� 臾몄���댁�� 留�����.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// �고�몃��몄�� 二쇱�� ��蹂대�� �대�� ������ �ｋ����.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("add1").value = roadAddr;
					//                                              document
					//                                                    .getElementById("add2").value = data.jibunAddress;
					document.getElementById("add2").value = "";//��濡�紐�留� 諛�湲�

				}
			}).open();
		}
	</script>


	<jsp:include page="/WEB-INF/views/module/footer.jsp"></jsp:include>
</body>
</html>