<%@page import="member.MemberBean1"%>
<%@page import="member.MemberBean"%>
<%@page import="board.BoardMgr"%>
<%@page import="board.UpFileBean"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<jsp:useBean id="cMgr" class="board.CommentMgr"/>
<jsp:useBean id="fMgr" class="board.UpFileBean"/>
<jsp:useBean id="mMgr" class="member.MemberMgr1"/>

<%
	int totalRecord = 0; //총 게시물 수
	int numPerPage = 10; //페이지당 레코드 개수(5, 10, 15, 20, 25, 30)
	int pagePerBlock = 10; //블럭당 페이지 개수
	int totalPage = 0; //총 페이지 개수
	int totalBlock = 0; //총 블럭 개수
	int nowPage = 1; //현재 페이지
	int nowBlock = 1; //현재 블럭
	
	String loginId = (String)session.getAttribute("idKey");
	session.setAttribute("idKey", loginId);
	
//	로그인한 회원 정보
	String grade = "";
	if(loginId != null){
		MemberBean1 Mbean = mMgr.getMember(loginId);
		grade = Mbean.getGrade().trim();
	}else{
		grade = "";
	}
	
	if(request.getParameter("numPerPage")!=null){
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	}
//	 검색에 필요한 변수
	String keyField = "";
	String keyWord = "";
	String category = "";
	String bValue = request.getParameter("bValue");
	
	if(request.getParameter("keyWord")!=null){
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
		category = request.getParameter("category");
		bValue = request.getParameter("bValue");
	}
	
//	페이지 클릭 또는 다른페이지 에서 호출
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

// SQL문 limit에 들어가는 변수 선언
	int start = (nowPage * numPerPage) - numPerPage;
	int cnt = numPerPage; //디폴트값 = 10
			
//	검색 후에 다시 처음 리스트 요청
	if(request.getParameter("reload")!=null && request.getParameter("reload").equals("true")){
		keyField = "";
		keyWord = "";
	}

	totalRecord = bMgr.getBoardCount(keyField, keyWord, category, bValue);
	
// 전체 페이지 개수
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
//	전체 블럭 개수
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
// 현재 블럭
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);

	
%>


<!DOCTYPE html>
<head>
<title><%= bValue %> 게시판</title>
<link href="../jsplayout/css/layout.css" rel="stylesheet">
<link href="../jspboard/css/boardList.css" rel="stylesheet">

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

function block(block) {
	document.readFrm.nowPage.value=<%=pagePerBlock%>*(block - 1) + 1;
	document.readFrm.submit();
}

function pageing(page) {
	document.readFrm.nowPage.value=page;
	document.readFrm.submit();
}

function list() {
	document.listFrm.action = "boardList.jsp?";
	document.listFrm.submit();
}

function read(num) {
	document.readFrm.num.value = num;
	document.readFrm.action = "boardRead.jsp";
	document.readFrm.submit();
}

function check() {
	if(document.searchFrm.keyWord.value=="" || document.searchFrm.keyWord.value==null){
		alert("검색어를 입력하세요.");
		document.searchFrm.keyWord.focus();
		return;
	}
	if(document.searchFrm.keyField.value=="선택"){
		alert("검색주제를 입력하세요.");
		document.searchFrm.keyField.focus();
		return;
	}
	document.searchFrm.submit();
}


function setkeyField(keyField) {
	document.searchFrm.keyField.value = keyField
}

function setCategory(category) {
	document.readFrm.category.value = category;
	document.readFrm.submit();
}

function setviewCount(numPerPage) {
	if(document.npFrm.numPerPage.value = numPerPage){
		document.readFrm.numPerPage.value = numPerPage;
		document.readFrm.submit();
	}
	
}


</script>

<script type="text/javascript">
	function deleteBoard(num) {
		document.boardFrm.action = "boardDelete";
		document.boardFrm.num.value = num ;
		document.boardFrm.submit();
	}	
</script>


<style>

</style>



</head>
<body class="body">
	
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="../jsplayout/top.jsp" %>
	<div class="ateam_columns">
		<%@ include file="../jsplayout/left.jsp" %>
		
		<div class="ateam_contents w-col w-col-8" style="overflow:auto">
	<!-- 상단 영역 시작 -->
	<div class="board-top-container w-container">
		<div class="board-category wf-section">
			<div class="div-block">
				<div class="text-block"><%=bValue%></div>
			</div>
		</div>
		<div class="board-btns-top w-row" style="margin-bottom:0.5vw;">
			<div class="column w-col w-col-10 w-col-small-10 w-col-tiny-10">
				<a href="javascript:setCategory('')" class="category-btn w-button">전체</a>
				<a href="javascript:setCategory('음악')" class="category-btn w-button">음악</a>
				<a href="javascript:setCategory('리뷰')" class="category-btn w-button">리뷰</a>
				<a href="javascript:setCategory('가사해석')" class="category-btn w-button">가사해석</a>
				<a href="javascript:setCategory('인증/후기')" class="category-btn w-button">인증/후기</a>
				<a href="javascript:setCategory('그림/아트웍')" class="category-btn w-button">그림/아트웍</a>
				<a href="javascript:setCategory('일반')" class="category-btn w-button">일반</a>
				<a href="javascript:setCategory('공지')" class="category-btn w-button">공지</a>
			</div>
		<form name="npFrm" method="post">
			<div class="w-col w-col-2 w-col-small-2 w-col-tiny-2">
				<div class="dropdown">
					<input class="btn btn-outline-secondary dropdown-toggle" type="text"
						id="dropdownMenuButton2" data-bs-toggle="dropdown"
						aria-expanded="false" value="10" name="numPerPage" size="1">개씩보기
						
						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
							<li><a class="dropdown-item active" href="javascript:setviewCount(5)">5개씩 보기</a></li>
							<li><a class="dropdown-item" href="javascript:setviewCount(10)">10개씩 보기</a></li>
							<li><a class="dropdown-item" href="javascript:setviewCount(15)">15개씩 보기</a></li>
							<li><a class="dropdown-item" href="javascript:setviewCount(20)">20개씩 보기</a></li>
						</ul>
				</div>
			</div>
		</form>
		<script>document.npFrm.numPerPage.value = <%=numPerPage%>;</script>

		</div>
	</div>
	<!-- 상단 영역 끝 -->


	<!-- 게시판 영역 시작 -->
	<div class="board-main-container w-container" >
	<form name="boardFrm" method="post" action="">
		<table witdh="100%">
			<tr>
				<td align="center" colspan="2">
					<table cellspacing="0">
									<tr align="center" bgcolor="#D0D0D0">
										<td width="100">번 호</td>
										<td width="250">제 목</td>
										<td width="100">아이디</td>
										<td width="150">날 짜</td>
										<td width="100">조회수</td>
									</tr>
					<%
						
						Vector<BoardBean> Bvlist = bMgr.getBoardList(keyField, keyWord, start, cnt, category, bValue);
						int listSize = Bvlist.size(); //마지막페이지 개수 고려
						if(Bvlist.isEmpty()){
					%>
								<tr>
									<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
								</tr>
							</table>
					<%
								
						}else{
							
					%>	
					<%
							for(int i=0; i<numPerPage; i++){
								if(i == listSize){
									break;
								}
//								게시물 정보
								BoardBean Bbean = Bvlist.get(i);
								int num = Bbean.getNum();
								String subject = Bbean.getSubject();
								String id = Bbean.getId();
								String regdate = Bbean.getRegdate();
								String content = Bbean.getContent();
								int depth = Bbean.getDepth();
								int count = Bbean.getCount();
								String Type_cat = Bbean.getType_cat();
//								파일
								Vector<UpFileBean> Fvlist = bMgr.getOneBoardFileAll(num);
								int fileListSize = Fvlist.size();
//								댓글 수
								int bcount = cMgr.getBCommentCount(num);
								%>
										<tr>
											<td align="center">
												<%=totalRecord - start - i %>
												<%if(id.equals(loginId) || grade.equals("1")) { %>
													<a href="javascript:deleteBoard('<%=num%>')"><img src="../icon/delete.png" align="middle"></a>
												<%} %>
											</td>
											<td >
												<%
													for(int j=0;j<depth;j++){
														out.println("&nbsp;&nbsp;&nbsp;");
													}%>
												<a href="javascript:read('<%=num %>')"><%=subject %></a>
												<%
													for(int k=0; k<fileListSize; k++){ 
														UpFileBean Fbean = Fvlist.get(k);
														String filename = Fbean.getFilename();
												%>
													<%if(fileListSize != 0) {%>
														<%
	//															파일 확장자 구분
																int point = filename.lastIndexOf( "." );
																String ext = filename.substring(point + 1).toLowerCase();
														%>	
														<%if(ext.trim().equals("jpg") || ext.trim().equals("gif") || ext.trim().equals("jpeg") || ext.trim().equals("bmp") || ext.trim().equals("png") || ext.trim().equals("tif") || ext.trim().equals("tga") || ext.trim().equals("rle") || ext.trim().equals("dib") || ext.trim().equals("tiff") || ext.trim().equals("raw")){ %>
															<img src="../icon/photo.png" align="middle">
														<%}else if(ext.trim().equals("mp4") || ext.trim().equals("avi") || ext.trim().equals("wms") || ext.trim().equals("mwa") || ext.trim().equals("asf") || ext.trim().equals("mpg") || ext.trim().equals("mpeg") || ext.trim().equals("ts") || ext.trim().equals("mkv") || ext.trim().equals("mov") || ext.trim().equals("3gp") || ext.trim().equals("3g2") || ext.trim().equals("webm")) { %>
															<img src="../icon/video.png" align="middle">
														<%}else if(ext.trim().equals("mp3") || ext.trim().equals("wav")) { %>
															<img src="../icon/music.png" align="middle">
														<%}else{%>
															<img src="../icon/file.png" align="middle">
														<%} %>
													<%} %>
												<%} %>
												<%if(content.contains("<iframe width=")) { %>
													<img src="../icon/youtube.png" align="middle">
												<%} %>
												<%if(bcount > 0) {%>
														<font color="red">[<%=bcount %>]</font>
												<%} %>
												&nbsp;&nbsp;<font color="green">[<%=Type_cat %>]</font>
											</td>
											<td align="center"><%=id %></td>
											<td align="center"><%=regdate %></td>
											<td align="center"><%=count %></td>
										</tr>
										
							<%}%>
								</table>
						<%}	%>
				</td>
			</tr>
		</table>
		<input type="hidden" value="" name="num">
		</form>
	</div>
	<!-- 게시판 영역 끝 -->

	<!-- 하단 영역 시작 -->
	<div class="board-bottom-container w-container">
		<table>
			<tr>
				<td>
					<div class="board-bottom-container w-container">
						<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
							<div class="btn-group me-2" role="group" aria-label="Second group" >
								<!-- 이전블록 -->
								<% if(nowBlock > 1) {%>
									<a href="javascript:block('<%=nowBlock - 1%>')">
										<button type="button" class="btn btn-secondary" ><</button>
										<input type="hidden" class="btn btn-secondary" value="<"readonly>
									</a>
								<%}	%>
								<!-- 블록번호 -->
								<%
									int pageStart = (nowBlock - 1) * pagePerBlock + 1;
									int pageEnd = (pageStart + pagePerBlock) < totalPage ? pageStart + pagePerBlock : totalPage + 1; 
									for(;pageStart<pageEnd;pageStart++){
								%>
								<a href="javascript:pageing('<%=pageStart%>')">
									<button type="button" class="btn btn-secondary" ><%=pageStart %></button>
									<input type="hidden" class="btn btn-secondary" value="<%=pageStart %>" size="1" readonly>
								</a>
								<%} %>
								<!-- 다음블록 -->
								<% if(nowBlock < totalBlock) {%>
									<a href="javascript:block('<%=nowBlock + 1%>')">
										<button type="button" class="btn btn-secondary" >></button>
										<input type="hidden" class="btn btn-secondary" value=">" size="1" readonly> 
									</a>
								<%}	%>
							</div>
						</div>
					</div>
				</td>
			<form name="btnFrm" action="boardPost.jsp?bValue=<%=bValue%>">
				<td align="right">
					<a style="color: white;" href="javascript:document.btnFrm.submit()"><button type="button" class="btn btn-dark">글쓰기</button></a> 
					<a href="javascript:list()"><button type="button" class="btn btn-light">처음으로</button></a>
					<input type="hidden" name="bValue" value="<%=bValue%>">
				</td>
			</form>
			</tr>
		</table>

	<form name="searchFrm" >
		<table>
			<tr>
				<hr width="100%">
			</tr>
			<tr>
				<td align="center">
					<div class="input-group mb-3">
						<input class="btn btn-outline-secondary dropdown-toggle"
							type="text" data-bs-toggle="dropdown" aria-expanded="false" name="keyField" value="선택" size="1">
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="javascript:setkeyField('id')">아이디</a></li>
							<li><a class="dropdown-item" href="javascript:setkeyField('subject')">제목</a></li>
							<li><a class="dropdown-item" href="javascript:setkeyField('content')">내용</a></li>
						</ul>
						<input type="text" class="form-control" placeholder="검색 키워드를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" name="keyWord" >
						<button class="btn btn-outline-secondary" type="button" id="button-addon2" value="" onclick="check()">검색</button>
						<input type="hidden" name="nowPage" value="<%=nowPage%>">
						<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
						<input type="hidden" name="category" value="<%=category%>">
						<input type="hidden" name="bValue" value="<%=bValue%>">
						<input type="hidden" name="num" >
					</div>

				</td>
			</tr>
		</table>
	</form>
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
			<input type="hidden" name="bValue" value="<%=bValue%>">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
			<input type="hidden" name="keyField" value="<%=keyField%>">
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
			<input type="hidden" name="category" value="<%=category%>">
			<input type="hidden" name="bValue" value="<%=bValue%>">
			<input type="hidden" name="num" >
		</form>
	</div>
	<!-- 하단 영역 끝 -->
</div>
		
		<%@ include file="../jsplayout/right.jsp" %>
		
	</div>
<%@ include file="../jsplayout/bottom.jsp" %>
	
</body>
</html>





