<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr1"/>
<%
		String emailaddr=request.getParameter("emailaddr");
		boolean result=mgr.findId(emailaddr);	
		//out.println(result);
		
		String msg="�̸����ּҸ� �߸� �Է��߽��ϴ�";
		if(result){
			mgr.sendNum(emailaddr);
			msg="�̸��� �ּҰ� �½��ϴ�. ������ȣ�� ���۵Ǿ����ϴ�.";
		}		
		

		
		
%>
<script type="text/javascript">
 	alert("<%=msg%>");
</script>




