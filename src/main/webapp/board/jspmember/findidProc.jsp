<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr1"/>
<%
		String emailaddr=request.getParameter("emailaddr");
		//out.println(num);
		boolean result=mgr.findId(emailaddr);	 //mgr.findId
		//out.println(result);
		
		String msg="�̸����ּҸ� �߸� �Է��߽��ϴ�";
		if(result){
	//mgr.sendNum(emailaddr);�� ������ int���̹Ƿ�, ���⼭�� int������ ���� �޾ƾ�
		
			int num = mgr.sendNum(emailaddr);  //mgr.sendNum
			session.setAttribute("conNum", Integer.toString(num));
			session.setAttribute("emailaddr", emailaddr);
			msg="�̸��� �ּҰ� �½��ϴ�. ������ȣ�� ���۵Ǿ����ϴ�.";
		}		
%>
<script type="text/javascript">
 	alert("<%=msg%>");
 	location.href = "search.jsp";
</script>




