<%@page contentType="text/html; charset=EUC-KR"%>
<%

%>


<!DOCTYPE html>
<head>

<!-- ��Ʈ��Ʈ�� ��� -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<!-- webflow ��� -->
<style>

.layout-top {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-top: 5vw;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-pack: start;
  -webkit-justify-content: flex-start;
  -ms-flex-pack: start;
  justify-content: flex-start;
  -webkit-box-align: start;
  -webkit-align-items: flex-start;
  -ms-flex-align: start;
  align-items: flex-start;
  grid-auto-columns: 1fr;
  grid-column-gap: 16px;
  grid-row-gap: 16px;
  -ms-grid-columns: 1fr 1fr;
  grid-template-columns: 1fr 1fr;
  -ms-grid-rows: auto auto;
  grid-template-rows: auto auto;
}

.layout-lower-bottom {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: end;
  -webkit-justify-content: flex-end;
  -ms-flex-pack: end;
  justify-content: flex-end;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  grid-column-gap: 1vw;
}

.post-main {
  min-height: 4vw;
  margin-top: 1vw;
  margin-bottom: 2vw;
  padding-top: 0%;
}

.columns {
  margin-top: 5vw;
  margin-right: 5vw;
  margin-left: 5vw;
}

.column {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
}

.column-2 {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: end;
  -webkit-justify-content: flex-end;
  -ms-flex-pack: end;
  justify-content: flex-end;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
}

.columns-2 {
  width: 100%;
  margin-right: 0px;
  margin-left: 0px;
}

.post-subject {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
  -ms-flex: 1;
  flex: 1;
}

.post-type {
  background-color: #361c1c;
}

.div-block {
  background-color: #1f1010;
}

.div-block-2 {
  background-color: #251414;
}

.layout-upper-bottom {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
  -ms-flex-pack: center;
  justify-content: center;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
  grid-column-gap: 0vw;
}

.list {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
}

.list-2 {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  grid-column-gap: 3vw;
}



.post-comment-container {
	padding-right: 2vw;
	padding-left: 2vw;
	list-style-type: none;
}

.list-item {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	margin-bottom: 1vw;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
}

.list-3 {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}

.list-4 {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	padding-left: 0px;
	list-style-type: none;
}

.list-item-2 {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}

.comment-user-info {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	margin-bottom: 0px;
}

.list-item-3 {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}

.list-4 {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	padding-left: 0px;
	list-style-type: none;
}

.comment-data {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	margin-bottom: 0px;
	padding-left: 0px;
	list-style-type: none;
}

.post-comment {
	margin-top: 1vw;
}

.comment-section-header {
	margin-top: 5vw;
}

.comment-write-container {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	margin-bottom: 5vw;
}


@media screen and (max-width: 991px) {
  .page {
    padding-right: 2vw;
    padding-left: 2vw;
  }
}
</style>

</head>
<body class="page">
	<div class="layout-top w-container">
		<div><b>[�Խ��� �̸�]</b> <font color="#E83038">�Խñ� ����</font></div>
		<div><h2>�Խñ� �����Դϴ�.<h2></h2></div>
		<div><img src="icon/profile_def.png" width="20vw"> Username | �ۼ� �ð� | ��ȸ�� 00 | ��� 0</div>
	</div>
	<div class="post-main w-container">
		�� ���� �ۼ��մϴ�.<br>
		�� ���� �ۼ��մϴ�.<br>
		�� ���� �ۼ��մϴ�.<br>
		�� ���� �ۼ��մϴ�.<br>
		�� ���� �ۼ��մϴ�.<br>
		�� ���� �ۼ��մϴ�.<br>
		�� ���� �ۼ��մϴ�.<br>
		�� ���� �ۼ��մϴ�.<br>
		�� ���� �ۼ��մϴ�.<br>
	</div>
	<div class="layout-upper-bottom w-container">
		<ul role="list" class="list-2 w-list-unstyled">
			<li>
				<table>
					<tr>
						<td><img src="icon/like_post.png"></td>
					</tr>
					<tr>
						<td align="center">0</td>
					</tr>
				</table>	
			</li>
			<li>
				<table>
					<tr>
						<td><img src="icon/save_post.png"></td>
					</tr>
					<tr>
						<td align="center">0</td>
					</tr>
				</table>	
			</li>
			<li>
				<table>
					<tr>
						<td><img src="icon/share_post.png"></td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>	
			</li>
		</ul>
	</div>
	
	<div class="layout-lower-bottom w-container">
		<button id="replybtn" type="button" class="btn btn-dark">���</button>
		<button id="listbtn" type="button" class="btn btn-dark">���</button>
	</div>
	
		<div class="comment-section-header w-container">
		<div>��� [0]</div>
	</div>
	<div class="post-comment w-container">
		<ul role="list" class="post-comment-container">
			<li class="list-item"><ul role="list"
					class="comment-user-info w-list-unstyled">
					<li class="list-item-3">
						<img src="icon/profile_def.png" width="20vw">
					</li>
					<li>
						Username00000
					</li>
					<li></li>
				</ul>
				<ul role="list" class="comment-data w-list-unstyled">
					<li class="list-item-2"><img src="icon/like_gray.png"></li>
					<li>�ۼ� �ð�</li>
				</ul></li>
			<li class="comment-contents">��� �����Դϴ�.</li>
		</ul>
	</div>
	<div class="comment-write-header w-container">
		<div><b>��� �ޱ�</b></div>
	</div>
	<div class="comment-write-container w-container">
		<div class="input-group mb-3">
			<input type="text" class="form-control"
				placeholder="Recipient's username" aria-label="Recipient's username"
				aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="button"
				id="button-addon2">���</button>
		</div>
	</div>

</body>
</html>
