<%@page contentType="text/html; charset=UTF-8"%>

<!--member 폴더에  -->

<!-- 여기 loginProc.jsp은 login을 처리하는 페이지  -->

<!--MemberMgr mgr=new MemberMgr(); 밑과 동일  -->
<jsp:useBean id="mgr" class="member.MemberMgr1"/>
<%		
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	boolean result=mgr.loginMember(id, pwd);
	//out.println(result);
	
	String msg="로그인에 실패하였습니다!!";
	
	if(result){
		session.setAttribute("idKey", id);
		msg="로그인이 되었습니다.";
		response.sendRedirect("../jsphome/home.jsp");
		return;
		}
		%>
	

<script>
 alert("<%=msg%>");
 location.href="login.jsp"; 
 
</script>













