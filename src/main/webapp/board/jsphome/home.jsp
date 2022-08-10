<%@page contentType="text/html; charset=UTF-8"%>

<%@page import="org.apache.catalina.ssi.SSICommand"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="board.BoardMgr"%>
<%@page import="board.HomeBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<jsp:useBean id="cMgr" class="board.CommentMgr" />

<%
Vector<HomeBean> vlist = new Vector<HomeBean>();

String option = request.getParameter("option");
if (option==null) 
	option = "count";
else if(option.equals("count"))
	option = "count";
else if(option.equals("b.num"))
	option = "b.num";
else if(option.equals("likesSum"))
	option = "likesSum";

/* if(option=="count" || option=="num" || option=="likesSum")
	System.out.println("option confirmed as " + option); */

int max = 9;
%>

<head>
<link href="../jsplayout/css/layout.css" rel="stylesheet">
<link href="../jsplayout/css/home.css" rel="stylesheet">

<script type="text/javascript">
function openBoardRead(num, bValue) {
	url = "../jspboard/boardRead.jsp?num=" + num +"&bValue=" + bValue;
	window.open(url, "../jspboard/boardRead.jsp?num="+num,"width=1000,height=1000,scrollbars=yes");
}

function optFrm(option) {
	document.optFrm.option.value = option;
	document.optFrm.action = "home.jsp";
	document.optFrm.submit();
}
</script>

</head>

<body class="body">
	<%@ include file="../jsplayout/top.jsp"%>
	<div class="ateam_columns">
		<%@ include file="../jsplayout/left.jsp"%>

		<div class="ateam_contents w-col w-col-8"
			style="padding: 0px; overflow: auto;">
			<!-- ==============페이지 내용 시작============= -->

			<div class="panel">
				<div class="frame_block">
					<div class="banner_block"></div>
					<div class="board_block">
						<div class="title_block">
							<form name="optFrm" method="post">
								<div>
									<a href="javascript:optFrm('count')">
										<span <%if(option=="count"){%>style="font-weight:bold;"<%}%>>조회순</span></a> | 
									<a href="javascript:optFrm('b.num')">
										<span <%if(option=="b.num"){%>style="font-weight:bold;"<%}%>>최신순</span></a> | 
									<a href="javascript:optFrm('likesSum')">
										<span <%if(option=="likesSum"){%>style="font-weight:bold;"<%}%>>BEST</span></a> 
										<input type="hidden" name="option" value=""></input>
								</div>
							</form>
						</div>
						
						<div class="w-layout-grid board_grid">
							<%
							vlist = bMgr.getBoardListHome(option, max);
							
							for(int i=0; i<vlist.size(); i++){
								HomeBean bean = vlist.get(i);
								String filename = bean.getFilename();
								int point = 0;
								String ext = "";
								String url = "../icon/noimg_square.jpg";
								
								//1) 파일이름이 있다. + 파일 확장자가 그림이다. 3) 실제로 경로에 파일이 있다.
								//단 하나라도 해당되지 않는다면 url은 기본 이미지 url.
								
								
								if(filename!=null){
									point = filename.lastIndexOf(".");
									ext = filename.substring(point + 1 ).toLowerCase();
									if(ext.trim().equals("jpg") || ext.trim().equals("gif") || ext.trim().equals("jpeg") || ext.trim().equals("bmp") || ext.trim().equals("png") || ext.trim().equals("tif") || ext.trim().equals("tga") || ext.trim().equals("rle") || ext.trim().equals("dib") || ext.trim().equals("tiff") || ext.trim().equals("raw")){ 
										url = "../../UpLoadFiles/" + filename;							
									}
								}else{
									url = "../icon/noimg_square.jpg";	
								} 

							%>
							<div class="grid-item">
								<a href="#" class="link-block w-inline-block"
									style="background-image: url('<%=url%>');">
									
									
									<div class="trans_block">
										<div>
											<div class="text-label">
												<div onclick="openBoardRead('<%=bean.getNum()%>', '<%=bean.getType_board()%>')"><%=bean.getSubject()%></div><%=bean.getId()%>/<%=bean.getType_board()%>/<%=bean.getType_cat()%><br>♡ <%=bean.getLikesSum()%> | 조회수 <%=bean.getCount()%> 
											</div>
										</div>
									</div>
								</a>
							</div>
							<%}%>
						</div>
					</div>
				</div>

			</div>

			<!-- ==============페이지 내용 끝============== -->
		</div>

		<%@ include file="../jsplayout/right.jsp"%>

	</div>
	<%@ include file="../jsplayout/bottom.jsp"%>

</body>
</html>
