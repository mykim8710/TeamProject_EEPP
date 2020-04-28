<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<title>마이페이지 - 내 리뷰</title>
<%@ include file="/WEB-INF/include/forImport.jspf"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user/mypage.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
		<!-- header -->
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<!-- header -->
	<input type="hidden" id="mypageMakerCriPage" value="${myPagePageMaker.cri.page_my}">
	 
	<c:choose>
		<c:when test="${loginUser.uNickname != null}">
			<!-- 로그인 성공 -->
			<br>
			<div class="container" id="MPwrap">
				<br>
				<br>
				<div class="row">
					<div class="col-sm-3">
						<table class="text-wrap">
							<tr>
								<td class="text_bold"><span class="required">• </span><a href="${pageContext.request.contextPath}/mypage">회원정보</a></td>
							</tr>
							<tr class="bordered">
								<td><a href="${pageContext.request.contextPath}/mypage">${loginUser.uNickname}</a></td>
							</tr>
							
							<tr>
								<td class="text_bold"><span class="required">• </span><a href="${pageContext.request.contextPath}/myPoint">내 포인트</a></td>
							</tr>
							<tr class="bordered">
							<td><a href="${pageContext.request.contextPath}/myPoint"><fmt:formatNumber value="${loginUser.point}" pattern="###,###,###" /> P</a></td>
							</tr>
							
							<tr>
							<td class="text_bold"><span class="required">• </span><a href="${pageContext.request.contextPath}/myContent">내 컨텐츠</a></td>
							</tr>
							
							<tr class="bordered">
							<td><div class="content_count">
							<a href="${pageContext.request.contextPath}/myContent">게시물 ${mypage.listCount}</a></div></td>
							<!-- <a style="cursor:pointer" onclick="location.href='mypage?board=board'"> -->
							</tr>
							
							<tr>
							<td class="text_bold"><span class="required">• </span><a href="${pageContext.request.contextPath}/myClass?tabType=myClassJoin">내 클래스</a></td>
							</tr>
							
							<tr class="bordered">
							<td><a href="${pageContext.request.contextPath}/myClass?tabType=myClassJoin">가입 ${mypage.joinClassCount}&nbsp;&nbsp;&nbsp;&nbsp;개설 ${mypage.openClassCount}</a></td>
							</tr>
							
							<tr>
							<td class="text_bold" style="color:#e74386"><span class="required">• </span><a href="${pageContext.request.contextPath}/myReview">내 리뷰</a></td>
							</tr>
							
							<tr class="bordered">
							<td><div class="review_count"><a href="${pageContext.request.contextPath}/myReview">${mypage.reviewListCount}건</a></div></td>
							</tr>
							
							<tr>
							<td class="text_bold"><span class="required">• </span><a href="${pageContext.request.contextPath}/myScrap?tabType=myScrapBoard">내 스크랩</a></td>
							</tr>
							
							<tr class="bordered">
							<td><div class="scrap_count"><a href="${pageContext.request.contextPath}/myScrap?tabType=myScrapBoard">게시글 ${mypage.scrapCount} &nbsp;&nbsp;클래스 ${mypage.scrapClassCount}&nbsp;&nbsp;&nbsp;맛집 ${mypage.scrapEatingCount}</a></div></td>
							</tr>
							
							<tr>
							<td class="text_bold" style="cursor:pointer" onclick="openMsg();"><span class="required">• </span>내 쪽지</td>
							</tr>
							
							<tr class="bordered">
							<td class="liwrap" value="open_message" style="cursor:pointer" onclick="openMsg();" >받은쪽지 ${mypage.messageRes}&nbsp;&nbsp;&nbsp;&nbsp;보낸 쪽지 ${mypage.messageSen}</td>
							</tr>
							
							<tr>
							<td class="drop"><a href="withdrawal" id=drop onclick="drop();">회원탈퇴</a></td>
							</tr>
							
						</table>


					</div><!-- col-sm-4 -->

					<div class="col-sm-9">
  						<!-- content_list -->
						<div class="myreview-wrap">
							<h3 id="mpRVBtn1">내 리뷰</h3>
							<hr>
							<p>'오늘 뭐 먹지?'에서 작성하신 음식점 후기를 확인 할 수 있습니다.</p>
							<br>
							<br>
							<div class="review_list">
						<!--  리뷰 -->
								<table class="table table-bordered">
									<thead class="thead-color">
										<tr class="content_tr">
											<th>리뷰 번호</th>
											<th>음식점</th>
											<th>후기</th>
											<th>평점</th>
											<th>작성일</th>
										</tr>
									</thead>
									<c:choose>
										<c:when test="${fn:length(mypage.reviewList) > 0 }">
											<c:forEach items="${mypage.reviewList}" var="reviewList">
												<tr>
													<td class="gray">${reviewList.rvId}</td>
													<td class="gray">${reviewList.ename}</td>
													<td><a href="eating/eatingView?eId=${reviewList.eID}&eThema=${reviewList.eThema}" target="blank">${reviewList.rvComment}</a></td>
													<td>${reviewList.rvScore}</td>
													<td class="gray"><fmt:formatDate value="${reviewList.rvWrittenDate}" pattern="yyyy/MM/dd HH:mm"/></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="9">조회된 결과가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
				<div class="boardpaging">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a class="page-link" href="myReview${myPagePageMaker.makeQuery(myPagePageMaker.startPage - 1)}">
							<i class="fas fa-angle-left"></i>
						</a>
					</li>
				<c:forEach begin="${myPagePageMaker.startPage}" end="${myPagePageMaker.endPage}" var="idx">
					<li class="page-item">
						<a id ="boardpaging_${idx}" class="page-link" href="myReview${myPagePageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>
					<li class="page-item">
						<a class="page-link" href="myReview${myPagePageMaker.makeQuery(myPagePageMaker.endPage + 1)}">
							<i class="fas fa-angle-right"></i>
						</a>
					</li>
				</ul>
			</div><!-- paging -->
							</div><!-- review_List -->
						</div>
							
						
					</div>
					<!-- col-sm-8 -->
				</div>
				<!-- row -->
			</div><!-- container -->
	<br>
		</c:when>
		<c:otherwise>
			<!-- 로그인 전 -->
			<h3>please login</h3>
			<button type="button" onclick="location.href='login/login.do'">로그인</button>

		</c:otherwise>
	</c:choose>
	<script src="${pageContext.request.contextPath}/js/user/mypage/mypage.js"></script>
	<script type="text/javascript">
		function getContextPath() {
			var hostIndex = location.href.indexOf(location.host) + location.host.length;
			return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
		};
		
		function openMsg(){
			 var tw = window.open(getContextPath() +"/message?messageType=myReceiveMsg","message","left="+(screen.availWidth-700)/2
					 +",top="+(screen.availHeight-440)/2+",width=700,height=440");
		}
	</script>
<%@ include file="/WEB-INF/views/chat/chatRoomList.jsp"%>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>