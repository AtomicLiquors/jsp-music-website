<%@page contentType="text/html; charset=EUC-KR"%>
<%
	String sampleid = "userId"; 
%>





	<div class="sidebar w-col w-col-2">
		<div class="side_profile_img"
			style="background-image: url(icon/profile_def.png); background-size: cover; background-repeat: no-repeat"></div>
		<div class="side_profile_text" style="text-align: center"><%=sampleid%>��,
			ȯ���մϴ�.
		</div>
		<div class="side_profile_iconbar w-row">
			<div class="side_profile_editicon w-col w-col-4"
				style="background-image: url(icon/edit_gray.png); background-repeat: no-repeat"></div>
			<div class="side_profile_likeicon w-col w-col-4"
				style="background-image: url(icon/like_gray.png); background-repeat: no-repeat"></div>
			<div class="side_profile_saveicon w-col w-col-4"
				style="background-image: url(icon/save_gray.png); background-repeat: no-repeat"></div>
		</div>
		<div class="side_chart" style="background-color: ivory"></div>
	</div>


