<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="member.MemberMgr1"/>
<%
	System.out.println(request.getParameter("id"));
	// <jsp:setProperty property="id" name="bean"/>
	
	// 나머지 모두 id, name, 11개가 모두 밑 하나로 됨.
	//<jsp:setProperty property="*" name="bean"/>
	
	boolean result=mgr.updateMember(request);
	String msg="정보를 처리하는 중 오류가 발생했습니다. 관리자에게 문의하세요.";
	String url="myPageIndex.jsp";
	
	if(result)
		msg="회원정보가 수정되었습니다.";
		else
		response.sendRedirect(url);
%>

<script>
 alert("<%=msg%>");
 location.href="<%=url%>";
</script>














