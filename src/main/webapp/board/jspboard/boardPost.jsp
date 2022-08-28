<%@page import="java.util.Vector"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<%
	String loginId = (String)session.getAttribute("idKey");
	String bValue = request.getParameter("bValue");
	session.setAttribute("bValue", bValue);
	if(loginId == null) {
		out.println("<script>");
		out.println("alert('로그인이 필요합니다.')");
		out.println("javascript:location.href='../jspmember/login.jsp'");
		out.println("</script>");
		return;
	}
%>

<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com -->
<!-- Last Published: Wed May 04 2022 05:27:50 GMT+0000 (Coordinated Universal Time) -->
<html data-wf-domain="6832s-dandy-site.webflow.io"
	data-wf-page="6271f01e889d5b745d71a96b"
	data-wf-site="6271f01e889d5b73f171a96a">
<head>
<title>게시물 작성</title>
<link href="../jsplayout/css/layout.css" rel="stylesheet">
<link href="../jspboard/css/boardPost.css" rel="stylesheet">


<!-- 부트스트랩 요소 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function setCategory(category) {
		document.postFrm.category.value = category;
	}
	
	function setbValue(bValue) {
		document.postFrm.bValue.value = bValue;
	}
	

	function check() {
		if(document.postFrm.bValue.value=="게시판을 선택하세요." ){
			alert("게시판을 선택하세요.");
			document.postFrm.bValue.focus();
			return;
		}
		if(document.postFrm.subject.value =="" || document.postFrm.subject.value == null){
			alert("제목을 입력하세요.");
			document.postFrm.subject.focus();
			return;
		}
		if(document.postFrm.category.value=="카테고리를 선택하세요."){
			alert("카테고리를 선택하세요.");
			document.postFrm.category.focus();
			return;
		}
		if(document.postFrm.content.value =="" || document.postFrm.content.value == null){
			alert("내용을 입력하세요.");
			document.postFrm.content.focus();
			return;
		}
		
		var yValue = document.postFrm.youtube.value;
		if(yValue !="" && yValue != null){
			yValue = yValue.replace("watch?v=","embed/");
			document.postFrm.content.value = '<iframe width="640" height="360" src="'+ yValue + '" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><br>' + document.postFrm.content.value;
		}
		
		document.postFrm.submit();
	}
</script>
<!-- webflow 요소 -->
<style>

</style>

</head>
<body class="body">
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="../jsplayout/top.jsp" %>
	<div class="ateam_columns">
		<%@ include file="../jsplayout/left.jsp" %>
		
		<div class="ateam_contents w-col w-col-8" style="overflow:auto">
			<!-- ==============페이지 내용 시작============= -->
	<div id="post-title"><h2>새 게시글 작성</h2></div>
	<form name="postFrm" method="post" action="boardPost"  onsubmit="return false;" enctype="multipart/form-data">
		<div class="layout-top w-container">
			<div class="post-subject">
				<input class="form-control" type="text" placeholder="제목을 입력하세요." aria-label="default input example" name="subject" size="150">
				<div class="post-type">
					<%
						Vector<BoardBean> bVVlist = bMgr.getbValue();
						int bVSize = bVVlist.size(); //마지막페이지 개수 고려
					%>
					
					<div class="dropdown">
						<input class="btn btn-secondary dropdown-toggle" type="text" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" value="<%=bValue %>" name="bValue" readonly>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<%
							for(int i=0; i<bVSize; i++){
								BoardBean caBean = bVVlist.get(i);
								bValue = caBean.getType_cat();//게시판 개수 고려
							%>
								<li><a class="dropdown-item" href="javascript:setbValue('<%=bValue %>')"><%=bValue %></a></li>
							<%} %>
						</ul>
					</div>
					<%
						Vector<BoardBean> caVlist = bMgr.getCategory();
						int caSize = caVlist.size(); //카테고리 개수 고려
					%>
					<div class="dropdown">
						<input class="btn btn-secondary dropdown-toggle" type="text" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" value="카테고리를 선택하세요." name="category" readonly>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<%
									for(int i=0; i<caSize; i++){
										BoardBean caBean = caVlist.get(i);
										String category = caBean.getType_cat();
							%>
										<li><a class="dropdown-item" href="javascript:setCategory('<%=category %>')"><%=category %></a></li>
							
							<%} %>
						</ul>
					</div>
				</div>
			</div>
		</div>
	<div class="post-main w-container">
		<div class="mb-3">
			내용
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="12" name="content"></textarea>
		</div>
		<div class="mb-3">
			Youtube 동영상 넣기
			<input class="form-control" type="text" placeholder="여기에 URL을 붙여넣으세요. ex) https://www.youtube.com/watch?v=VJhdfwLjaSI" aria-label="default input example" name="youtube" size="150">	
		</div>
		
	</div>
	
	<div class="layout-upper-bottom w-container">
			<div id="fileupload" class="mb-3">
				<label for="formFile" class="form-label"> 첨부파일 </label> 
				<div class="insert" align="left">
					<input type="file" onchange="addFile(this);"  name="filename1"/><br>
					<input type="file" onchange="addFile(this);"  name="filename2"/><br>
					<input type="file" onchange="addFile(this);"  name="filename3"/><br>
					<input type="file" onchange="addFile(this);"  name="filename4"/><br>
					<input type="file" onchange="addFile(this);"  name="filename5"/><br>
				</div>
			</div>

			

		</div>
	<div class="layout-lower-bottom w-container">
		<input type="button" value="저장" class="btn btn-dark" onclick="javascript:check()">
		<a href="javascript:history.back()"><button type="button" class="btn btn-dark">취소</button></a>
	</div>
	<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
	<input type="hidden" name="loginId" value="<%=loginId%>">
	
	</form>
<!-- ==============페이지 내용 끝============== -->
		</div>
		
		<%@ include file="../jsplayout/right.jsp" %>
		
	</div>
<%@ include file="../jsplayout/bottom.jsp" %>
	
</body>
</html>
