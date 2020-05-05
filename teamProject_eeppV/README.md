<br />

<h1 align="center">👩🏼‍🍳 🧑🏼‍🏭 👩🏽‍💻  👩🏼‍🎨 Community EE 🧑🏼‍🔧 👩🏼‍🚀 🧑🏼‍🔬 👩🏼‍⚕️</h1>

<br/>

<p align="center"><img src="https://user-images.githubusercontent.com/53379734/79706065-dc6c4100-82f2-11ea-9ba6-38d5803cc731.jpg" width="60%"></img></p>

<br/>
<br/>

📌[Community EE 웹사이트 바로가기](<http://ec2-13-124-180-143.ap-northeast-2.compute.amazonaws.com:8282/eepp/>)

<br/>

> Community EE는 직장생활에 대한 애환들을 서로 소통하며, 직무별 정보를 공유할 수있는 커뮤니티 사이트입니다!

    * 직무별 게시판
    * 클래스 강좌 플랫폼
    * 오늘 뭐 먹지
    * 채팅


<br/>

<img src="https://user-images.githubusercontent.com/55972630/80184067-e79dd480-8644-11ea-98b7-d21672436006.jpg" width="100%"></img>

<br/>
<br/>
<br/>

<h1 align="center">👩🏻‍💻 👩🏽‍💻 Team PP 👩🏼‍💻 🧑🏻‍💻</h1>

<br/>

> Team PP는 비트캠프 JAVA 143기 교육생들이 모여 만든 팀입니다.

**Since** : 2020.01.28 ~ 2020.04.22

<br/>

👍🏽 **Collaborator**

| [이혜인](<https://github.com/java-hyein>) | [도희정](<https://github.com/doeez>) | [박찬경](<https://github.com/rtnbrnch>) | [김민영](<https://github.com/mykim8710>) |
| :-----------------------------------: | :---------------------------------------: | :-------------------------------------: | :-------------------------------------: |


<p align="center" style="display:inline!important"><img src="https://user-images.githubusercontent.com/53379734/79709802-1bec5a80-82fe-11ea-9587-d7f3013b8df9.png" width="40%" /><img src="https://user-images.githubusercontent.com/53379734/79709810-1f7fe180-82fe-11ea-8459-b1becabf5eaa.png" width="40%" /></p>

<p align="center" style="display:inline!important"><img src="https://user-images.githubusercontent.com/53379734/79708328-15f47a80-82fa-11ea-8dbe-9e021e5630a4.png" width="40%" /><img src="https://user-images.githubusercontent.com/53379734/79708325-14c34d80-82fa-11ea-9274-012d1b1736e1.png" width="40%" /></p>

##### 본 프로젝트에서의 역할

[팀 구성원으로의 역할 : 팀장]  
[서비스 구현에서 맡은 역할]

1. AWS RDS DB setup
> - 개념적 설계, 논리적설계, 물리적 설계 과정을 거친 DB모델링 결과를 토대로  
AWS의 RDS서비스를 이용하여 Oracle 11g 버전으로 DB setup

2. 직무별 커뮤니티 게시판 기능 구현
> - Spring MVC 패턴을 토대로 CRUD가 가능하도록 게시판 전체 틀 구현  
> - 댓글 CRUD, 추천/비추천, 스크랩, 컨텐츠 신고 기능 : Ajax를 사용하여 비동기통신형태로 구현  
> - 컨텐츠 삭제의 경우, Delete 쿼리문이 아닌 Update 쿼리문을 이용하여 flag처리 형태로 구현

3. 오프라인 클래스 플랫폼 게시판 구현
> - 기본 게시글 작성은 Spring MVC 패턴 CRUD // 댓글 CRUD : Ajax를 사용하여 구현  
> - 클래스 강좌 신청 시 서비스 내에서만 통용되는 화폐인 포인트를 통한 구매가 가능하도록 구현했으며  
    신청자에게 강좌신청 완료문자를 전송하기 위해 회원가입 시 사용되는 SMS 문자발송 기능을 응용해서 추가
> - 강좌개설 시 대표사진 업로드를 위해 파일업로드기능 응용해서 추가

4. 다대다 채팅 기능 구현
> - Spring WebSocket과 SockJS를 이용하여 다대다 채팅기능 구현
> - 전체 웹페이지 어디에서 채팅기능을 이용가능하게 구현
> - 채팅방 목록 페이징 : ajax를 이용하여 더보기 형태로 구현
> - C, R, D 가능 : 채팅방 개설(로그인 후), 채팅참여(팝업형태로 여러방 동시에 참여가능), 채팅방 삭제(개설자만 가능)

<h6 align="right">Created by Team PP</h6>
