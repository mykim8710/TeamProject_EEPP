<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>직무별 커뮤니티 게시판</title>
		<%@ include file="/WEB-INF/include/forImport.jspf"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/board/board.css">
	</head>
	
	<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<!-- header -->

		<input type="hidden" id="userNickname" name="loginUser" value="${loginUser.uNickname}">
		<input type="hidden" id="pageMakerTotalCount" value="${pageMaker.totalCount}">
		<input type="hidden" id="pageMakerCriPage" value="${pageMaker.cri.page}">
		<input type="hidden" id="pageMakeQuery" value="${pageMaker.makeQuery(1)}">
		
		<section id="boardWrapper">
		
		<div class="boardSideWrap col-sm-2">
		<!-- 직무 게시판 카테고리 -->
			<a class="category ct-all" href="boardList">All</a>
			<a class="category ct-notice" href="boardList?&bCategory=notice">공지사항</a>
			<a class="category ct-it" href="boardList?&bCategory=it_dev">IT & 개발</a>
			<a class="category ct-service" href="boardList?&bCategory=service">서비스</a>
			<a class="category ct-finance" href="boardList?&bCategory=finance">금융</a>
			<a class="category ct-design" href="boardList?&bCategory=design">디자인</a>
			<a class="category ct-offi" href="boardList?&bCategory=official">공무원</a>
			<a class="category ct-etc" href="boardList?&bCategory=etc">기타</a>
		</div>
		
		<div class="boardList-Wrap col-sm-10">
		
		<div class="boardTitle"></div>
		
		<div class="boardSelectorWrap">
			<div class="selectSortType">
			<a class="sort-Date" href="boardList?page=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}&sortType=bWrittenDate&bCategory=${bCategory}">최신순</a>&nbsp;&nbsp;&nbsp;
			<a class="sort-Hit" href="boardList?page=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}&sortType=bHit&bCategory=${bCategory}">조회순</a>&nbsp;&nbsp;&nbsp;
			<a class="sort-Like" href="boardList?page=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}&sortType=bLike&bCategory=${bCategory}">추천순</a>&nbsp;&nbsp;&nbsp;
			<a class="sort-Reply" href="boardList?page=${pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}&sortType=rpCount&bCategory=${bCategory}">댓글순</a>
			</div>
			
			<div class="writeBtnWrap"><a class="writeBtn">새 글 쓰기</a></div>
		</div>
			<form name="form1" role="form" method="post">
			<input type="hidden" name="page" value="${scri.page}" />
			<input type="hidden" name="perPageNum" value="${scri.perPageNum}" />
			<input type="hidden" name="searchType" id="scriSearchType" value="${scri.searchType}" />
			<input type="hidden" name="keyword" id="scriKeyword" value="${scri.keyword}" />
			<input type="hidden" name="sortType" id="sortType" value="${sortType}" />
			<input type="hidden" name="bCategory" id="bCategory" value="${bCategory}" />
			</form>
		
		<div class="boardSelectorWrap02">
		<!-- 게시글 n개씩 보기 -->
		<div class="sortCount">
			<select id="cntPerPage" class="custom-select" name="perPageNum">
				<option value="5"  <c:out value="${pageMaker.cri.perPageNum eq '5' ? 'selected' : ''}"/>>5줄 보기</option>
				<option value="10" <c:out value="${pageMaker.cri.perPageNum eq '10' ? 'selected' : ''}"/>>10줄 보기</option>
				<option value="15" <c:out value="${pageMaker.cri.perPageNum eq '15' ? 'selected' : ''}"/>>15줄 보기</option>
				<option value="20" <c:out value="${pageMaker.cri.perPageNum eq '20' ? 'selected' : ''}"/>>20줄 보기</option>
				<option value="30" <c:out value="${pageMaker.cri.perPageNum eq '30' ? 'selected' : ''}"/>>30줄 보기</option>
				<option value="40" <c:out value="${pageMaker.cri.perPageNum eq '40' ? 'selected' : ''}"/>>40줄 보기</option>
				<option value="50" <c:out value="${pageMaker.cri.perPageNum eq '50' ? 'selected' : ''}"/>>50줄 보기</option>
			</select>
		</div>
		
		<!-- 검색 부분  -->
		<div class="search">
			<select name="searchType" class="selectSearchType">
				<option value="n" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색조건</option>
				<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
			</select> 
			
			<div class="input-group md-form form-sm form-2 pl-0">
  				<input class="form-control my-0 py-1 amber-border" type="text" placeholder="검색어" aria-label="Search" name="keyword" id="bKeywordInput" value="${scri.keyword}">
  				<div class="input-group-append">
  					<a id="searchBtn">
  						<span class="input-group-text lighten-3" id="basic-text1"><i class="fas fa-search"
       			 		aria-hidden="true"></i></span>
       				</a>
  				</div>
			</div>
		</div>
		<!-- 검색 부분 끝  -->
		
	</div>
		
		<!-- 게시물 리스트 -->
		<div class="listTable">
			<table>
				<tr class="listTable-title listWidth">
					<td></td>
					<td class="bId">글번호</td>	
					<td class="bSubject">말머리</td>
					<td class="bCategory">카테고리</td>
					<td class="bTitle">글제목</td>
					<td class="bWriter">작성자</td>
					<td class="bHit">조회수</td>
					<td class="bLike">추천 / 비추천</td>
				</tr>
				
				<!-- 공지사항 상위노출 2개 -->
				<c:forEach items="${notice}" var="notice">
					<tr class="listTable-list listWidth isNoticeList">
						<td class="isNoticeContent"><i class="fas fa-flag"></i></td>
						<td class="bId">${notice.bId}</td>
						<td class="bSubject">공지</td>
						<td class="bCategory">공지</td>
						<td class="bTitle">
							<a style="text-decoration: none" href="contentView${pageMaker.makeQuery(pageMaker.cri.page)}&bId=${notice.bId}&searchType=${scri.searchType}&keyword=${scri.keyword}&sortType=${sortType}&bCategory=${notice.bCategory}">${notice.bTitle}  [${notice.rpCount}]</a>
						</td>
						
						<td class="bWriter">
						<a class="userBtn">${notice.uNickname}</a>
							<span>${notice.bWrittenDate}</span>
						</td>
						
						<td class="bHit">${notice.bHit}</td>
						<td class="bLike">${notice.bLike} / ${notice.bUnlike}</td>
					</tr>
				</c:forEach>
				
				<!-- 인기글 상위노출 3개 -->
				<c:forEach items="${hotArticle}" var="hot" varStatus="btn">
					<tr class="listTable-list listWidth isHotList">
						<td class="isHotContent"><i class="fab fa-hotjar"></i></td>
						<td class="bId">${hot.bId}</td>
						<td class="bSubject">
						<c:choose>
							<c:when test="${hot.bSubject eq 'daily'}">
								일상
							</c:when>
							<c:when test="${hot.bSubject eq 'qna'}">
								QnA
							</c:when>
							<c:when test="${hot.bSubject eq 'info'}">
								정보
							</c:when>
						</c:choose>
						</td>
						
						<td class="bCategory">
						<c:choose>
							<c:when test="${hot.bCategory eq 'it_dev'}">
								IT/개발
							</c:when>
							<c:when test="${hot.bCategory eq 'service'}">
								서비스
							</c:when>
							<c:when test="${hot.bCategory eq 'finance'}">
								금융
							</c:when>
							<c:when test="${hot.bCategory eq 'design'}">
								디자인
							</c:when>
							<c:when test="${hot.bCategory eq 'official'}">
								공무원
							</c:when>
							<c:when test="${hot.bCategory eq 'etc'}">
								기타
							</c:when>
						</c:choose>
						</td>
						<td class="bTitle">
							<a style="text-decoration: none" href="contentView${pageMaker.makeQuery(pageMaker.cri.page)}&bId=${hot.bId}&searchType=${scri.searchType}&keyword=${scri.keyword}&sortType=${sortType}&bCategory=${hot.bCategory}">${hot.bTitle}  [${hot.rpCount}]</a>
						</td>
						
						<td class="bWriter">
						<c:choose>
						<c:when test="${hot.uNickname eq loginUser.uNickname or hot.uNickname eq '운영자' or hot.uNickname eq 'admin2' or loginUser.uNickname == null}">
						<a class="userBtn">${hot.uNickname}</a>
						</c:when>
						
						<c:otherwise>
						<div class="dropdown">
						<a href="#" class="userBtn" id="user_hot_${hot.user_id}${btn.index}" data-toggle="dropdown">${hot.uNickname}</a>
           				 <ul class="dropdown-menu" role="menu" aria-labelledby="user_hot_${hot.user_id}${btn.index}">
                			<li><a onclick="memberInfo('${hot.uNickname}',${hot.user_id});">회원정보</a></li>
                			<li><a onclick="sendMessage('${hot.uNickname}',${hot.user_id});">쪽지 보내기</a></li>
                			<li><a data-toggle="modal" data-target="#report_user_${hot.user_id}${btn.index}" data-backdrop="static" data-keyboard="false">신고하기</a></li>
                		</ul>
						</div>
						<!-- 유저 신고 modal -->	
                			<div class="modal fade reportModalBox" id="report_user_${hot.user_id}${btn.index}" role="dialog">
                				<div class="modal-dialog">
                				<div class="modal-content">
                						
                				<!-- Modal Header -->
                				<div class="modal-header">
                					<button type="button" class="close" data-dismiss="modal">
                					<span aria-hidden="true">&times;</span>
			                    	<span class="sr-only">Close</span>
			                		</button>
			               			<h4 class="modal-title">&#8988;${hot.uNickname}&#8991;님 신고</h4>
			            		</div>
			            		<!-- Header -->
			            				
			            		<!-- Modal Body -->
			            		<div class="modal-body">
			            			<form id="declaration_user_${hot.user_id}${btn.index}" role="formDeclaration_user_${hot.user_id}${btn.index}" name="dform">
			            			<input type="hidden" name="reporter_id" value="${loginUser.user_id}">
			            			<input type="hidden" name="reported_id" value="${hot.user_id}">
			            			
			            			<p class="reportBoxIcon"><img src="${pageContext.request.contextPath}/img/reportBoxIcon.png"></p>
			            			<div class="form-group">
			            			<input type="radio" name="dReason" value="부적절한 홍보 게시글" onclick="this.form.etc_${hot.user_id}${btn.index}.disabled=true">  부적절한 홍보 게시글<br>
			            			<input type="radio" name="dReason" value="음란성 또는 청소년에게 부적합한 내용" onclick="this.form.etc_${hot.user_id}${btn.index}.disabled=true">  음란성 또는 청소년에게 부적합한 내용<br>
			            			<input type="radio" name="dReason" value="명예훼손/사생활 침해 및 저작권침해등" onclick="this.form.etc_${hot.user_id}${btn.index}.disabled=true">  명예훼손/사생활 침해 및 저작권침해등<br>
			            			<input type="radio" name="dReason" value="etc" onclick="this.form.etc_${hot.user_id}${btn.index}.disabled=false">  기타<br>
			            			<textarea class="form-control" id="etc_${hot.user_id}${btn.index}" name="dReason" disabled></textarea>
			            			</div>
			                		</form>
			                		<!-- declaration -->
			           		 	</div>
			           		 	<!-- modal-body -->
            
			            		<!-- Modal Footer -->
			            		<div class="modal-footer">
			                		<button type="button" class="btn reportBtn" onclick="reportUser(${hot.user_id}${btn.index},'${hot.uNickname}');">신고</button>
			            		</div>
			            		<!-- Footer -->
			            		
			        			</div>
			        			<!-- modal-content -->
    							</div>
    							<!-- modal-dialog -->
							</div>
							<!-- modal -->
						</c:otherwise>
						</c:choose>
							<span class="grText">${hot.bWrittenDate}</span>
						</td>
						
						<td class="bHit grText">${hot.bHit}</td>
						<td class="bLike grText">${hot.bLike} / ${hot.bUnlike}</td>
					</tr>
				</c:forEach>
				
				<c:choose>
					<c:when test="${fn:length(boardList) > 0 }">
						<c:forEach items="${boardList}" var="vo" varStatus="btn">
						<c:choose>
							<c:when test="${vo.dCount > 10}">
								<tr class="listTable-list listWidth blindContent">
							</c:when>
							<c:otherwise>
							<tr class="listTable-list listWidth">
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${newArticle le vo.isNew}">
							<td class="isNewContent">NEW</td>
							</c:when>
							<c:otherwise><td></td></c:otherwise>
						</c:choose>
								<td class="bId">${vo.bId}</td>
								<td class="bSubject">
								<c:choose>
									<c:when test="${vo.bSubject eq 'daily'}">
										일상
									</c:when>
									<c:when test="${vo.bSubject eq 'qna'}">
										QnA
									</c:when>
									<c:when test="${vo.bSubject eq 'info'}">
										정보
									</c:when>
									<c:when test="${vo.bSubject eq 'notice'}">
										공지
									</c:when>
								</c:choose>
								</td>
								<td class="bCategory">
								<c:choose>
									<c:when test="${vo.bCategory eq 'it_dev'}">
										IT/개발
									</c:when>
									<c:when test="${vo.bCategory eq 'service'}">
										서비스
									</c:when>
									<c:when test="${vo.bCategory eq 'finance'}">
										금융
									</c:when>
									<c:when test="${vo.bCategory eq 'design'}">
										디자인
									</c:when>
									<c:when test="${vo.bCategory eq 'official'}">
										공무원
									</c:when>
									<c:when test="${vo.bCategory eq 'etc'}">
										기타
									</c:when>
									<c:when test="${vo.bCategory eq 'notice'}">
										공지
									</c:when>
								</c:choose>
								</td>
								
									<c:choose>
										<c:when test="${vo.dCount > 10}">
											<td class="bTitle isBlind">
											 해당 게시글은 블라인드처리된 게시글입니다.
											 </td>
										</c:when>
										<c:otherwise>
											<td class="bTitle">
										<a style="text-decoration: none" href="contentView${pageMaker.makeQuery(pageMaker.cri.page)}&bId=${vo.bId}&searchType=${scri.searchType}&keyword=${scri.keyword}&sortType=${sortType}&bCategory=${vo.bCategory}">
											<c:choose>
												<c:when test="${fn:length(vo.bTitle) > 33}">
												${fn:substring(vo.bTitle, 0, 33)}... [${vo.rpCount}]
												</c:when>
								
											<c:otherwise>
											${vo.bTitle} [${vo.rpCount}]
											</c:otherwise>
											</c:choose>
											</a>
											</td>
										</c:otherwise>
									</c:choose>
								
								<td class="bWriter">
								<c:choose>
								<c:when test="${vo.uNickname eq loginUser.uNickname or vo.uNickname eq '운영자' or vo.uNickname eq 'admin2' or loginUser.uNickname == null}">
								<a class="userBtn">${vo.uNickname}</a>
								</c:when>
								
								<c:otherwise>
								<div class="dropdown">
									<a href="#" class="userBtn" id="user_${vo.user_id}${btn.index}" data-toggle="dropdown">${vo.uNickname}</a>
           				 			<ul class="dropdown-menu" role="menu" aria-labelledby="user_${vo.user_id}${btn.index}">
                					<li><a onclick="memberInfo('${vo.uNickname}',${vo.user_id});">회원정보</a></li>
                					<li><a onclick="sendMessage('${vo.uNickname}',${vo.user_id});">쪽지 보내기</a></li>
                					<li><a data-toggle="modal" data-target="#report_user_${vo.user_id}${btn.index}" data-backdrop="static" data-keyboard="false">신고하기</a></li>
                					</ul>
								</div>
								<!-- 유저 신고 modal -->	
                			<div class="modal fade reportModalBox" id="report_user_${vo.user_id}${btn.index}" role="dialog">
                				<div class="modal-dialog">
                				<div class="modal-content">
                						
                				<!-- Modal Header -->
                				<div class="modal-header">
                					<button type="button" class="close" data-dismiss="modal">
                					<span aria-hidden="true">&times;</span>
			                    	<span class="sr-only">Close</span>
			                		</button>
			               			<h4 class="modal-title">&#8988;${vo.uNickname}&#8991; 님 신고</h4>
			            		</div>
			            		<!-- Header -->
			            				
			            		<!-- Modal Body -->
			            		<div class="modal-body">
			            			<form id="declaration_user_${vo.user_id}${btn.index}" role="formDeclaration_user_${vo.user_id}${btn.index}" name="dform">
			            			<input type="hidden" name="reporter_id" value="${loginUser.user_id}">
			            			<input type="hidden" name="reported_id" value="${vo.user_id}">
			            			<input type="hidden" class="reported_nickname" value="${vo.uNickname}">
			            				
			            			<p class="reportBoxIcon"><img src="${pageContext.request.contextPath}/img/reportBoxIcon.png"></p>
			            			<div class="form-group">
			            			<input type="radio" name="dReason" value="부적절한 홍보 게시글" onclick="this.form.etc_${vo.user_id}${btn.index}.disabled=true">  부적절한 홍보 게시글<br>
			            			<input type="radio" name="dReason" value="음란성 또는 청소년에게 부적합한 내용" onclick="this.form.etc_${vo.user_id}${btn.index}.disabled=true">  음란성 또는 청소년에게 부적합한 내용<br>
			            			<input type="radio" name="dReason" value="명예훼손/사생활 침해 및 저작권침해등" onclick="this.form.etc_${vo.user_id}${btn.index}.disabled=true">  명예훼손/사생활 침해 및 저작권침해등<br>
			            			<input type="radio" name="dReason" value="etc" onclick="this.form.etc_${vo.user_id}${btn.index}.disabled=false">  기타<br>
			            			<textarea class="form-control" id="etc_${vo.user_id}${btn.index}" name="dReason" disabled></textarea>
			            			</div>
			                		</form>
			                		<!-- declaration -->
			           		 	</div>
			           		 	<!-- modal-body -->
            
			            		<!-- Modal Footer -->
			            		<div class="modal-footer">
			                		<button type="button" class="btn reportBtn" onclick="reportUser(${vo.user_id}${btn.index},'${vo.uNickname}');">신고</button>
			            		</div>
			            		<!-- Footer -->
			            		
			        			</div>
			        			<!-- modal-content -->
    							</div>
    							<!-- modal-dialog -->
							</div>
							<!-- modal -->
								</c:otherwise>
								</c:choose>
									<span>${vo.bWrittenDate}</span>
								</td>
								<td class="bHit">${vo.bHit}</td>
								<td class="bLike">${vo.bLike} / ${vo.bUnlike}</td>
							</tr>
						</c:forEach>
					</c:when>
				
					<c:otherwise>
						<tr class="listTable-list listWidth">
							<td class="searchResult" colspan="9">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		
		<!-- 페이징 -->
		<div class="boardListpaging">
			<ul class="pagination justify-content-center">
				<li class="page-item">
				<a class="page-link" href="boardList${pageMaker.makeSearch(pageMaker.startPage - 1)}&sortType=${sortType}&bCategory=${bCategory}">
				<i class="fas fa-angle-left"></i>
				</a>
				</li>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item boardPaging">
				<a id="boardPage_${idx}" class="page-link boardPaging" href="boardList${pageMaker.makeSearch(idx)}&sortType=${sortType}&bCategory=${bCategory}">${idx}</a></li>
				</c:forEach>
				
				<li class="page-item">
				<a class="page-link boardPaging" href="boardList${pageMaker.makeSearch(pageMaker.endPage + 1)}&sortType=${sortType}&bCategory=${bCategory}">
				<i class="fas fa-angle-right"></i>
				</a>
				</li>
			</ul>
		</div>
		<!-- paging -->
		</div>
		<!-- boardList-Wrap -->
		</section>
		<!-- boardWrapper -->
		
		
	<!-- chat -->
	<%@ include file="/WEB-INF/views/chat/chatRoomList.jsp"%>
	<!-- chat -->
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<!-- footer -->

		<script src="${pageContext.request.contextPath}/js/board/boardMain.js"></script>
		<script src="${pageContext.request.contextPath}/js/common.js"></script>
	</body>
</html>