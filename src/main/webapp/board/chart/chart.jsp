<%@page import="chart.ChartBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="chartMgr" class="chart.ChartMgr"/>

<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function goDetile(title) {
		document.chartFrm.title.value = title;
		document.chartFrm.action = "boardRead.jsp";
		document.chartFrm.submit();
	}
	function openchartDetaile(title) {
		url = "chartDetaile.jsp?title=" + title;
		window.open(url, "chartDetaile.jsp?title="+title,"width=750,height=750,scrollbars=yes");
	}
	function openchartLyric(title) {
		url = "chartLyric.jsp?title=" + title;
		window.open(url, "chartLyric.jsp?title="+title,"width=750,height=750,scrollbars=yes");
	}
</script>
</head>
<body>
<form action="" name="chartFrm" method="get">
	<div align="center">
		<table border="1" style="width: 80%" >
			<caption>�α���Ʈ 100</caption>
			<colgroup>
				<!-- ���� -->
				<col style="width: 20px">
				<!-- �ٹ����� -->
				<col style="width: 80px">
				<!-- Ÿ��Ʋ -->
				<col>
				<!-- ��Ƽ��Ʈ -->
				<col style="width: 250px">
				<!-- �ٹ��� -->
				<col style="width: 300px">
				<!-- ���� -->
				<col style="width: 100px">
				<!-- ������ -->
				<col style="width: 100px">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">
						<div>
							<span>����</span>
						</div>
					</th>
					<th scope="col">
						<div>
							<span></span>
						</div>
					</th>
					<th scope="col">
						<div>
							<span>Ÿ��Ʋ</span>
						</div>
					</th>
					<th scope="col">
						<div>
							<span>��Ƽ��Ʈ</span>
						</div>
					</th>
					<th scope="col" >
						<div>
							<span>�ٹ���</span>
						</div>
					</th>
					<th scope="col">
						<div>
							<span>���纸��</span>
						</div>
					</th>
					<th scope="col">
						<div>
							<span>������</span>
						</div>
					</th>
				</tr>
			</thead>
			<tbody>
				<%Vector<ChartBean> chartVlist = chartMgr.getAllChart(); %>
				<%int chartSize = chartVlist.size();%>
				<%for(int i=0; i<chartSize; i++){ %>
				<%ChartBean chBean = chartVlist.get(i);%>
					<tr>
						<!-- ���� -->
						<td>
							<div align="center"><%=chBean.getRanking() %></div>
						</td>
						<td>
							<!-- �ٹ����� -->
							<div align="center"><img src="<%=chBean.getAlbumImg() %>"></div>
						</td>
						<td>
							<!-- Ÿ��Ʋ -->
							<div align="center"><%=chBean.getTitle() %></div>
						</td>
						<td>
							<!-- ��Ƽ��Ʈ -->
							<div align="center"><%=chBean.getArtist() %></div>
						</td>
						<td>
							<!-- �ٹ��� -->
							<div align="center"><%=chBean.getAlbumName()%></div>
						</td>
						<td>
							<!-- ���� -->
							<div align="center"><a href="javascript:openchartLyric('<%=chBean.getTitle() %>')"><img src="../icon/detail.png"></a></div>
						</td>
						<td>
							<!-- ������ -->
							<div align="center"><a href="javascript:openchartDetaile('<%=chBean.getTitle() %>')"><img src="../icon/detail.png"></a></div>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<input type="hidden" name="title" value="">
</form>
</body>
</html>