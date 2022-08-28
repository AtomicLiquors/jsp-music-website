<%@page import="java.util.Vector"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<jsp:useBean id="bBean" class="board.BoardBean"/>
<%
	String loginId = (String)session.getAttribute("idKey");
	String oriBValue = request.getParameter("bValue");
	String oriCategory = request.getParameter("category");
	int num = Integer.parseInt(request.getParameter("num"));
	bBean = bMgr.getBoard(num);
	
	if(loginId == null){
		response.sendRedirect("../jspmember/login.jsp");
		return;	
	}
	
%>


<head>
<title><%=oriBValue %> 게시글의 답글 작성</title>
<link href="../jsplayout/css/layout.css" rel="stylesheet">
<link href="../jspboard/css/boardReply.css" rel="stylesheet">
<!-- 부트스트랩 요소 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function setCategory(category) {
		document.replyFrm.category.value = category;
	}
	
	function setbValue(bValue) {
		document.replyFrm.bValue.value = bValue;
	}

	function check() {
		if(document.replyFrm.bValue.value=="게시판을 선택하세요." ){
			alert("게시판을 선택하세요.");
			document.replyFrm.bValue.focus();
			return;
		}
		if(document.replyFrm.subject.value =="└ " || document.replyFrm.subject.value =="" || document.replyFrm.subject.value == null ){
			alert("제목을 입력하세요.");
			document.replyFrm.subject.focus();
			document.replyFrm.subject.value =="└ "
			return;
		}
		if(document.replyFrm.category.value=="카테고리를 선택하세요."){
			alert("카테고리를 선택하세요.");
			document.replyFrm.category.focus();
			return;
		}
		if(document.replyFrm.content.value =="" || document.replyFrm.content.value == null){
			alert("내용을 입력하세요.");
			document.replyFrm.content.focus();
			return;
		}
		document.replyFrm.submit();
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
	<div id="post-title"><h2>답변글 작성</h2></div>
	<form name="replyFrm" method="post" action="boardReply" enctype="multipart/form-data">
		<div class="layout-top w-container">
			<div class="post-subject">
				<input class="form-control" type="text" placeholder="제목을 입력하세요." aria-label="default input example" name="subject" size="150" value="└ ">
				<div class="post-type">
					<%
						Vector<BoardBean> bVVlist = bMgr.getbValue();
						int bVSize = bVVlist.size(); //마지막페이지 개수 고려
					%>
					
					<div class="dropdown">
						<input class="btn btn-secondary dropdown-toggle" type="text" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" value="<%=oriBValue %>" name="bValue">
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<%
							for(int i=0; i<bVSize; i++){
								BoardBean caBean = bVVlist.get(i);
								String bValue = caBean.getType_cat();//게시판 개수 고려
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
						<input class="btn btn-secondary dropdown-toggle" type="text" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" value="<%=oriCategory %>" name="category">
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
	</div>
	
	<div class="layout-upper-bottom w-container">
			<div id="fileupload" class="mb-3">
				<label for="formFile" class="form-label"> 첨부파일 </label> 
				<div class="insert">
					<input type="file" onchange="addFile(this);" multiple  name="filename1"/><br>
					<input type="file" onchange="addFile(this);" multiple  name="filename2"/><br>
					<input type="file" onchange="addFile(this);" multiple  name="filename3"/><br>
					<input type="file" onchange="addFile(this);" multiple  name="filename4"/><br>
					<input type="file" onchange="addFile(this);" multiple  name="filename5"/><br>
				</div>
			</div>

			

		</div>
	<div class="layout-lower-bottom w-container">
		<input type="button" value="저장" class="btn btn-dark" onclick="javascript:check()">
		<a href="javascript:history.back()"><button type="button" class="btn btn-dark">취소</button></a>
		<a href="javascript:location.href='boardList.jsp'"><button type="button" class="btn btn-dark">리스트</button></a>
	</div>
	
	<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
	<input type="hidden" name="id" value="<%=loginId%>">
 	<input type="hidden" name="ref" value="<%=bBean.getRef()%>">
 	<input type="hidden" name="pos" value="<%=bBean.getPos()%>">
 	<input type="hidden" name="depth" value="<%=bBean.getDepth()%>">
	</form>
			<!-- ==============페이지 내용 끝============== -->
		</div>
		
		<%@ include file="../jsplayout/right.jsp" %>
		
	</div>
<%@ include file="../jsplayout/bottom.jsp" %>
	
</body>
</html>
