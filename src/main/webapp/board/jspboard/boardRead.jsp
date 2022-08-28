<%@page import="board.CommentBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.UpFileBean"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	String category = request.getParameter("category");
	String bValue = request.getParameter("bValue");
	
	String loginId = (String)session.getAttribute("idKey");
	String SbValue = (String)session.getAttribute("bValue");
	if(bValue != null){
		session.setAttribute("bValue", bValue);
	}else{
		session.setAttribute("bValue", SbValue);
	}
	String title = "";
	if(bValue != null){
		title = bValue;
	}else{
		title = SbValue;
	}
	
	
%>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<jsp:useBean id="cMgr" class="board.CommentMgr"/>
<jsp:useBean id="lMgr" class="board.LikesMgr"/>
<jsp:useBean id="cLMgr" class="board.CmtLikesMgr"/>
<jsp:useBean id="sMgr" class="board.SavePostMgr"/>



<!DOCTYPE html>
<head>
<title><%=title %> 게시글</title>
<link href="../jsplayout/css/layout.css" rel="stylesheet">
<link href="../jspboard/css/boardRead.css" rel="stylesheet">
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

// 공유하기
url_default_ks = "https://story.kakao.com/share?url="; 
var url_default_fb = "https://www.facebook.com/sharer/sharer.php?u="; 
var url_default_tw_txt = "https://twitter.com/intent/tweet?text="; 
var url_default_tw_url = "&url="; 
var url_default_band = "http://band.us/plugin/share?body="; 
var url_route_band = "&route="; 
var url_default_naver = "http://share.naver.com/web/shareView.nhn?url="; 
var title_default_naver = "&title="; 

var url_this_page = location.href; 
var title_this_page = document.title; 

var url_combine_ks = url_default_ks + url_this_page; 
var url_combine_fb = url_default_fb + url_this_page; 
var url_combine_tw = url_default_tw_txt + document.title + url_default_tw_url + url_this_page; 
var url_combine_band = url_default_band + encodeURI(url_this_page)+ '%0A' + encodeURI(title_this_page)+'%0A' + '&route=tistory.com'; 
var url_combine_naver = url_default_naver + encodeURI(url_this_page) + title_default_naver + encodeURI(title_this_page);



	function down(filename) {
		document.downFrm.filename.value=filename;
		document.downFrm.submit();
	}
	
	function insertLike() {
		document.likeFrm.action = "insertLikes";
		document.likeFrm.submit();
	}
	
	function deleteLike() {
		document.likeFrm.action = "deleteLikes";
		document.likeFrm.submit();
	}
	function insertSavePost() {
		document.savePostFrm.action = "insertSavePost";
		document.savePostFrm.submit();
	}
	
	function deleteSavePost() {
		document.savePostFrm.action = "deleteSavePost";
		document.savePostFrm.submit();
	}
	
	function insertComment() {
		if(document.commentFrm.cComment.value == "" || document.commentFrm.cComment.value == null){
			alert("댓글을 입력하세요.");
			document.commentFrm.cComment.focus();
			return;
		}
		document.commentFrm.submit();
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
			
<div class="page">
	<%
		bMgr.upCount(num);
		BoardBean bBean = bMgr.getBoard(num);
		Vector<UpFileBean> fVlist = bMgr.getOneBoardFileAll(num);
		int fCount = fVlist.size();
	%>
	<div class="layout-top w-container">
		<div><b><%=bBean.getType_board() %></b> <font color="#E83038"><%=bBean.getType_cat() %></font></div>
		<div><h2><%=bBean.getSubject() %></h2></div>
		<div><img src="../icon/info_large.jpg" width="20vw"> <%=bBean.getId() %> | <%=bBean.getRegdate() %> | 조회수 <%=bBean.getCount() %> </div>
		
		<!-- 첨부파일영역 -->
		<div class="w-col w-col-2 w-col-small-2 w-col-tiny-2">
			<div class="dropdown" align="right">
				<input class="btn btn-outline-secondary dropdown-toggle" type="text" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false" value="첨부파일 (<%=fCount %>)" size="10">
				<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
				<%	
					for(int i=0; i<fCount; i++){ 
						
						UpFileBean fBean = fVlist.get(i);
						String fileN = fBean.getFilename();
				%>
						<%if(fileN != null && !fileN.equals("")){ %>
								<li><a class="dropdown-item active" href="javascript:down('<%=fBean.getFilename()%>')"><%= fBean.getFilename()%></a></li>
						<%}else{ %>
								<li><a class="dropdown-item active" href="#">파일이 없습니다.</a></li>
						<%} %>
				<%} %>
				</ul>
			</div>
		</div>
		<!-- 첨부파일영역 -->
	</div>
	
	
	<div class="post-main w-container">
		
		<%	
			for(int i=0; i<fCount; i++){ 
				UpFileBean fBean = fVlist.get(i);
				String filename = fBean.getFilename();
		%>
		<%
//				파일 확장자 구분
				int point = filename.lastIndexOf( "." );
				String ext = filename.substring(point + 1).toLowerCase();
		%>	
				<%if(ext.trim().equals("jpg") || ext.trim().equals("gif") || ext.trim().equals("jpeg") || ext.trim().equals("bmp") || ext.trim().equals("png") || ext.trim().equals("tif") || ext.trim().equals("tga") || ext.trim().equals("rle") || ext.trim().equals("dib") || ext.trim().equals("tiff") || ext.trim().equals("raw")){ %>
					<div align="center"><img src="../../UpLoadFiles/<%=filename%>" ></div>
				<%}else if(ext.trim().equals("mp4") || ext.trim().equals("avi") || ext.trim().equals("wms") || ext.trim().equals("mwa") || ext.trim().equals("asf") || ext.trim().equals("mpg") || ext.trim().equals("mpeg") || ext.trim().equals("ts") || ext.trim().equals("mkv") || ext.trim().equals("mov") || ext.trim().equals("3gp") || ext.trim().equals("3g2") || ext.trim().equals("webm")) { %>
					<div align="center"><iframe sandbox="allow-scripts" src="../../UpLoadFiles/<%=filename%>" width="600px" height="350px" seamless="seamless" name="iframe<%=i%>"></iframe></div>
				<%}else if(ext.trim().equals("mp3") || ext.trim().equals("wav")) { %>
					<div align="center">
						<jsp:include page="../playertest/player.jsp" >
							<jsp:param value="<%=filename%>" name="pFilename"/>
							<jsp:param value="<%=bBean.getId()%>" name="pUploader"/>
						</jsp:include>
					</div>
				<%}	%>
		<%} %>
		<br>
		<br>
		<%=bBean.getContent() %>
	</div>
	<div class="layout-upper-bottom w-container">
		<ul role="list" class="list-2 w-list-unstyled">
			<li>
				<form name="likeFrm" action="" method="get">
					<table>
						<tr>
						<%if(!lMgr.selectLikes(num, loginId)){	%>
							<td><a href="javascript:insertLike()"><img src="../icon/like_before.jpg"></a></td>
						<%}else{ %>
							<td><a href="javascript:deleteLike()"><img src="../icon/like_after.png"></a></td>
						<%} %>
						</tr>
						<tr>
							<% int totalLike = lMgr.countLike(num);	%>
							<td align="center"><%=totalLike %></td>
						</tr>
					</table>
					<input type="hidden" name="loginId" value="<%=loginId%>">
					<input type="hidden" name="num" value=<%=num %>>	
					<input type="hidden" name="bValue" value=<%=bValue %>>	
				</form>
			</li>
			<li>
				<form name="savePostFrm" action="" method="get">
					<table>
						<tr>
						<%if(!sMgr.selectSavePost(num, loginId)){	%>
								<td><a href="javascript:insertSavePost()"><img src="../icon/save_post_before.png"></a></td>
							<%}else{ %>
								<td><a href="javascript:deleteSavePost()"><img src="../icon/save_post_after.png"></a></td>
							<%} %>
						</tr>
						<tr>
							<%int sCount = sMgr.countSavePost(num); %>
							<td align="center"><%=sCount %></td>
						</tr>
					</table>
					<input type="hidden" name="loginId" value="<%=loginId%>">
					<input type="hidden" name="num" value=<%=num %>>
				</form>	
			</li>
			<li>
				<table>
					<div class="dropdown" align="right">
						<img src="../icon/share_post.png" class="btn btn-outline-secondary dropdown-toggle" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="true">
						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
							 <!-- 페이스북 공유 버튼 --> 
							<li><a href="" onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;"><img src="https://download-hub.com/wp-content/uploads/2021/01/Facebook_icon.png" title="페이스북" class="sharebtn_custom" style="width: 32px;"></a>
							  <!-- 트위터 공유 버튼 --> 
							 <a href="" onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;"><img src="https://play-lh.googleusercontent.com/8sc6LSo3dRf54GaLdQR8UZfzd_fgHgWMJlNxGLP1HWPEU7YY4UxkyHc8-qCNwtyiqO55=s180-rw" title="트위터" class="sharebtn_custom" style="width: 32px;"></a>
							  <!-- 카카오 스토리 공유 버튼 --> 
							  <a href="" onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;"><img src="https://download.beer/wp-content/uploads/2021/03/kakaostory-logo-0x0.png" title="카카오스토리" class="sharebtn_custom" style="width: 32px;"></a>
							  <!-- 밴드 공유 버튼 --> 
							  <a href="" onclick="window.open(url_combine_band, '', 'scrollbars=no, width=584, height=635'); return false;"><img src="https://play-lh.googleusercontent.com/hvpSrKnGiK0h-GnDofFmj6y5mLqqB7vDpsV9kWYebCEvMuZp3dsRNDqJANnk6eNHqlA=s180-rw" title="밴드" class="sharebtn_custom" style="width: 32px;"></a></li>
							  <!-- SNS버튼 끝 -->
						</ul>
					</div>
					<tr>
						<td></td>
					</tr>
				</table>	
			</li>
		</ul>
	</div>
	
	<div class="layout-lower-bottom w-container">
		<input id="replybtn" type="button" class="btn btn-dark" value="답글" onclick="javascript:location.href='boardReply.jsp?num=<%=num%>&category=<%=bBean.getType_cat()%>&bValue=<%=bBean.getType_board()%>'">
		<input id="listbtn" type="button" class="btn btn-white" value="목록" onclick="javascript:location.href='boardList.jsp?bValue=<%=bValue%>'">
	</div>
	
	<%
		Vector<CommentBean> cVlist = cMgr.commentList(num);
		int cCount = cVlist.size();
	%>
		<div class="comment-section-header w-container">
		<div>댓글 [<%=cCount %>]</div>
	</div>
	
	<%
		for(int i=0; i<cCount; i++){
			CommentBean cBean = cVlist.get(i);
	%>
	<form name="cmtFrm<%=i%>"action="" method="get">
		<script type="text/javascript">
			function insertCmtLike(cnum) {
				document.cmtFrm<%=i%>.action = "insertCmtLikes";
				document.cmtFrm<%=i%>.cnum.value = cnum ;
				document.cmtFrm<%=i%>.submit();
			}
			
			function deleteCmtLike(cnum) {
				document.cmtFrm<%=i%>.action = "deleteCmtLikes";
				document.cmtFrm<%=i%>.cnum.value = cnum ;
				document.cmtFrm<%=i%>.submit();
			}
			function deleteComment(cnum) {
				document.cmtFrm<%=i%>.action = "deleteComment";
				document.cmtFrm<%=i%>.cnum.value = cnum ;
				document.cmtFrm<%=i%>.submit();
			}
		</script>
			<div class="post-comment w-container">
				<ul role="list" class="post-comment-container" style="list-style: none;">
					<li class="list-item" style="list-style: none;"><ul role="list" class="comment-user-info w-list-unstyled">
					<li class="list-item-3" style="list-style: none;">
							<img src="../icon/info_large.jpg" width="20vw">
					</li>
					<li style="list-style: none;">
						<%=cBean.getId() %>
					</li>
				</ul>
						<ul role="list" class="comment-data w-list-unstyled">
							<%if(bBean.getId() == loginId ) { %>
								<li style="list-style: none;"><a href="javascript:deleteComment('<%=cBean.getCnum() %>')">[삭제]</a></li>
							<%} %>
							<%int totalCmtLikes = cLMgr.countCmtLikes(num, cBean.getCnum()); %>
							<%if(!cLMgr.selectCmtLikes(num, cBean.getCnum(), loginId)){	%>
								<li><a href="javascript:insertCmtLike('<%=cBean.getCnum() %>')"><img src="../icon/like_before.jpg"></a>&nbsp;<%=totalCmtLikes %>개</li>
							<%}else{ %>
								<li><a href="javascript:deleteCmtLike('<%=cBean.getCnum() %>')"><img src="../icon/like_after.png"></a>&nbsp;<%=totalCmtLikes %>개</li>
							<%} %>
							<li><%=cBean.getRegdate() %></li>
							
						</ul>
						<input type="hidden" name="loginId" value="<%=loginId%>">
						<input type="hidden" name="num" value=<%=num %>>
						<input type="hidden" name="cnum" value="">
				</li>
					
				<li class="comment-contents">
					
					<%=cBean.getComment() %>
				</li>
			</ul>
			
		</div>
	</form>
	<%} %>
	<form name="commentFrm" action="commentPost" method="get">
		<div class="comment-write-header w-container">
			<div>
				<b>댓글 작성</b> | <img src="../icon/info_large.jpg" width="20vw"> 
				<%if(loginId != null){%>
					<%=loginId %>
				<%}else{ %>
					<b>로그인을 해주세요.</b>
				<%} %>
			</div>
			
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="댓글을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2" name="cComment">
				<input class="btn btn-outline-secondary" type="button" id="button-addon2" value="등록" onclick="insertComment()">
				<input type="hidden" name="loginId" value="aaa">
				<input type="hidden" name="num" value=<%=num %>>
			</div>
		</div>
	</form>
	<form method="post" name="downFrm" action="../download.jsp">
		<input type="hidden" name="filename">
	</form>
	

</div>
	<!-- ==============페이지 내용 끝============== -->
		</div>
		
		<%@ include file="../jsplayout/right.jsp" %>
		
	</div>
<%@ include file="../jsplayout/bottom.jsp" %>
	
</body>
</html>

