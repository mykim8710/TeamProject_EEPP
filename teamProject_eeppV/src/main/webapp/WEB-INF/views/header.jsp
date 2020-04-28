<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EEPP_header</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
	</head>
	
	<body>
		<input type="hidden" id="user_id" value="${loginUser.user_id}" />
		<input type="hidden" id="uNickname" value="${loginUser.uNickname}" />

		<c:choose>
			<c:when test="${loginUser.uNickname != null}">
				<div id="headerAll">
					<header id="headerMain">
						<div class="main_box">
						    <div class="menu common" align="left">
						    	<button class="navbar-toggle">
						    		<span class="icon-bar"></span>
							        <span id="mid" class="icon-bar"></span>
							        <span class="icon-bar"></span>
						    	</button>
						    </div>
						    
						    <div class="logo common">
						    	<a href="${pageContext.request.contextPath}"><img id="headerlogo" src="${pageContext.request.contextPath}/img/EE_logo.png"></a>
						    </div>
						    
						    <div class="login common" align="right">
						    	<div class="dropdown">
								<a href="#" class="userBtn" id="header_user_btn" data-toggle="dropdown">
								<strong id="loginNickname">${loginUser.uNickname}</strong>
									<img id="headerLogin" class="afterLoginProfile" src="${loginUser.uprofile}">
								</a>
           						 <ul class="dropdown-menu" role="menu" aria-labelledby="header_user_btn">
                					<c:choose>
                						<c:when test="${loginUser.uNickname eq '운영자' or loginUser.uNickname eq 'admin2' }">
                							<li><a href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a></li>
                						</c:when>
                						<c:otherwise>
                							<li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                						</c:otherwise>
                					</c:choose>
                					<%-- <li><a onclick="sendMessage('${hot.uNickname}',${hot.user_id});">쪽지 보내기</a></li> --%>
                					<li><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
                				</ul>
								</div>
						    </div>
						</div>
					</header>
					
					<div class="sidenav_wrap">
					<div id="mySidenav" class="sidenav" align="center">
				
						<div id="myInfo">
							<a href="javascript:void(0)" class="closebtn"><i class="fas fa-times"></i></a>
							
							<div class="box">
								<img class="profile" src="${loginUser.uprofile}">
							</div>
							
							<div id="userInfo">
								<h5>${loginUser.uNickname}님</h5>
								<h6>EE Point : <i class="fab fa-product-hunt"></i>
									<fmt:formatNumber value="${loginUser.point}" pattern="#,###" />
								</h6>
							</div>
							
							<div id="myMenu" class="btn-group btn-group-sm">
							<div class="menuBtn-wrap">
								<button type="button" class="btn btn-light" onclick="openMsg();"><i class="fas fa-envelope-square"></i><strong> Message</strong></button>&nbsp;
									<div class="msgAlert">
										<p id="msgAlertNum"></p>									
									</div>
							</div>
							<div class="menuBtn-wrap">
								<c:choose>
									<c:when test ="${loginUser.uNickname eq'운영자' or loginUser.uNickname =='admin2'}">
										<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/mypage'"><i class="fas fa-id-badge"></i><strong> MyPage</strong></button>&nbsp;
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/myPoint'"><i class="fas fa-coins"></i><strong> Point</strong></button>&nbsp;
									</c:otherwise>
								</c:choose>
							</div>
							<div class="menuBtn-wrap">
								<c:choose>
									<c:when test ="${loginUser.uNickname =='운영자' or loginUser.uNickname =='admin2'}">
										<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/adminPage'"><i class="fas fa-user-cog"></i><strong> Admin</strong></button>&nbsp;
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/mypage'"><i class="fas fa-id-badge"></i><strong> MyPage</strong></button>&nbsp;
									</c:otherwise>
								</c:choose>
							</div>
							<div class="menuBtn-wrap">
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/logout.do'"><i class="fas fa-power-off"></i><strong> Logout</strong></button>
							</div>		
							</div>
						</div>
				
						<div id="menuList">
							<div id="menu1">
								<a title="Home" href="${pageContext.request.contextPath}"><strong>HOME</strong></a>
							</div>
							<div id="menu2">
								<a title="BOARD - JOB" href="${pageContext.request.contextPath}/board/boardList"><strong>BOARD - JOB</strong></a>
							</div>
							<div id="menu3" class="subMenu">
								<a title="BOARD - IT/DEV" href="${pageContext.request.contextPath}/board/boardList?&bCategory=it_dev"><strong>IT/DEV</strong></a>
							</div>
							<div id="menu4" class="subMenu">
								<a title="BOARD - SERVICE" href="${pageContext.request.contextPath}/board/boardList?&bCategory=service"><strong>SERVICE</strong></a>
							</div>
							<div id="menu5" class="subMenu">
								<a title="BOARD - FINANCE" href="${pageContext.request.contextPath}/board/boardList?&bCategory=finance"><strong>FINANCE</strong></a>
							</div>
							<div id="menu6" class="subMenu">
								<a title="BOARD - IT/DEV" href="${pageContext.request.contextPath}/board/boardList?&bCategory=design"><strong>DESIGN</strong></a>
							</div>
							<div id="menu7" class="subMenu">
								<a title="BOARD - DESIGN" href="${pageContext.request.contextPath}/board/boardList?&bCategory=official"><strong>OFFICIAL</strong></a>
							</div>
							<div id="menu8" class="subMenu">
								<a title="BOARD - ETC" href="${pageContext.request.contextPath}/board/boardList?&bCategory=etc"><strong>ETC</strong></a>
							</div>
							<div id="menu9">
								<a title="WHAT TO EAT TODAY?" href="${pageContext.request.contextPath}/eating/eatingList"><strong>WHAT SHOULD WE EAT TODAY?</strong></a>
							</div>
							<div id="menu10">
								<a title="EE CLASS" href="${pageContext.request.contextPath}/class/classList"><strong>EE CLASS</strong></a>
							</div>
							<div id="menu11">
								<a title="ABOUT US" href="${pageContext.request.contextPath}/aboutUs"><strong>ABOUT US</strong></a>
							</div>		
						</div>
					</div>
					<div class="side_overlay"></div>
					</div>
				</div>
			</c:when>
			
			<c:otherwise>
				<div id="headerAll">
					<header id="headerMain">
						<div class="main_box">
						    <div class="menu common" align="left">
						    	<button class="navbar-toggle">
						    		<span class="icon-bar"></span>
							        <span id="mid" class="icon-bar"></span>
							        <span class="icon-bar"></span>
						    	</button>
						    </div>
						    
						    <div class="logo common">
						    	<a href="${pageContext.request.contextPath}"><img id="headerlogo" src="${pageContext.request.contextPath}/img/EE_logo.png"></a>
						    </div>
						    
						    <div class="login common" align="right">
						    	<a class="beforeLoginHeaderIcon" href="${pageContext.request.contextPath}/login/login.do">
						    		<img id="headerLogin" src="${pageContext.request.contextPath}/img/headerLogin.png">
						    	</a>
						    </div>
						</div>
					</header>
					
					<div id="mySidenav" class="sidenav" align="center">
				
						<div id="myInfo" class="beforeLoginInfo">
							<a href="javascript:void(0)" class="closebtn"><i class="fas fa-times"></i></a>
							
							<div class="box">
								<img class="profile" src="${pageContext.request.contextPath}/img/headerLogin.png">
							</div>
							
							<div id="userInfo">
								<a href="${pageContext.request.contextPath}/login/login.do">
								<h2><strong>LOGIN</strong></h2></a>  
							</div>
						</div>
				
						<div id="menuList">
							<div id="menu1">
								<a title="Home" href="${pageContext.request.contextPath}"><strong>HOME</strong></a>
							</div>
							<div id="menu2">
								<a title="BOARD - JOB" href="${pageContext.request.contextPath}/board/boardList"><strong>BOARD - JOB</strong></a>
							</div>
							<div id="menu3" class="subMenu">
								<a title="BOARD - IT/DEV" href="${pageContext.request.contextPath}/board/boardList?&bCategory=it_dev"><strong>IT/DEV</strong></a>
							</div>
							<div id="menu4" class="subMenu">
								<a title="BOARD - SERVICE" href="${pageContext.request.contextPath}/board/boardList?&bCategory=service"><strong>SERVICE</strong></a>
							</div>
							<div id="menu5" class="subMenu">
								<a title="BOARD - FINANCE" href="${pageContext.request.contextPath}/board/boardList?&bCategory=finance"><strong>FINANCE</strong></a>
							</div>
							<div id="menu6" class="subMenu">
								<a title="BOARD - IT/DEV" href="${pageContext.request.contextPath}/board/boardList?&bCategory=design"><strong>DESIGN</strong></a>
							</div>
							<div id="menu7" class="subMenu">
								<a title="BOARD - DESIGN" href="${pageContext.request.contextPath}/board/boardList?&bCategory=official"><strong>OFFICIAL</strong></a>
							</div>
							<div id="menu8" class="subMenu">
								<a title="BOARD - ETC" href="${pageContext.request.contextPath}/board/boardList?&bCategory=etc"><strong>ETC</strong></a>
							</div>
							<div id="menu9">
								<a title="WHAT TO EAT TODAY?" href="${pageContext.request.contextPath}/eating/eatingList"><strong>WHAT SHOULD WE EAT TODAY?</strong></a>
							</div>
							<div id="menu10">
								<a title="EE CLASS" href="${pageContext.request.contextPath}/class/classList"><strong>EE CLASS</strong></a>
							</div>
							<div id="menu11">
								<a title="ABOUT US" href="${pageContext.request.contextPath}/aboutUs"><strong>ABOUT US</strong></a>
							</div>		
						</div>
					</div>
					<div class="side_overlay"></div>
				</div>
			</c:otherwise>
		</c:choose>
		
		<script src="${pageContext.request.contextPath}/js/header.js"></script>
	</body>
</html>