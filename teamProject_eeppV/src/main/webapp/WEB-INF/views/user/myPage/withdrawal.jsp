<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="UTF-8">
		<title>Community EE 회원 탈퇴</title>
		<%@ include file="/WEB-INF/include/forImport.jspf"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user/mypage.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
	</head>
	
	<body>
		<!-- header -->
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<!-- header -->
		<section class="withdrawWrap">
		<div class="form-group">
			<c:choose>
				<c:when test="${loginUser.snsType != null}">
					<form role="form" method="post" class="drop_form">
						<img alt="bye" src="${pageContext.request.contextPath}/img/withdrawal.png" style="max-width: 25%; margin-bottom: 30px;">
						<p><b style="color:#e7438b;">회원탈퇴</b>를 위해 회원가입시 등록한 <b style="color:#e7438b;">휴대폰번호</b>를 입력해주세요.</p>
						<br>
						<p><span class="required">&#8226;</span>핸드폰 번호</p>
						<select name="uPhone_1" class="custom-select" id="uPhone">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="019">019</option>
						<option value="080">080</option>
						</select> 
						- <input type="text" class="uPhone_2" name="uPhone_2" maxlength="4" size="6" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
						- <input type="text" class="uPhone_3"  name="uPhone_3" maxlength="4" size="6"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
						<br>
						<c:if test="${msg == false}">
							<p>입력하신 정보가 잘못되었습니다.</p>
						</c:if>
						<br><br>
	
						<button type="submit" class="btn btn-info" id="dropBtn" >회 원 탈 퇴</button>
					</form>
				</c:when>
			
				<c:otherwise>
					<img alt="bye" src="${pageContext.request.contextPath}/img/withdrawal.png" style="max-width: 25%; margin-bottom: 30px;">
					<p><b style="color:#e7438b;">회원 탈퇴</b>를 위해 정확한 <b style="color:#e7438b;">비밀번호</b>를 입력해주세요</p>
					<br>
					<form role="form" method="post">
						<span class="required">•</span>이메일 : ${loginUser.uEmail} <br>
						<span class="required">&#8226;</span>비밀번호 : 
						<input type="password" name="uPassword" placeholder="Password">
						
						<c:if test="${msg == false }">
							<p>입력하신 정보가 잘못되었습니다.</p>
						</c:if>
						<br><br>
						
						<p><button type="submit" class="btn btn-info" id="dropBtn">회 원 탈 퇴</button></p>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
		</section>
	
		<!-- chatting -->
		<%@ include file="/WEB-INF/views/chat/chatRoomList.jsp"%>
		<!-- chatting -->
		
		<!-- footer -->
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<!-- footer -->

		<script src="${pageContext.request.contextPath}/js/user/mypage/mypage.js"></script>	
	</body>
</html>