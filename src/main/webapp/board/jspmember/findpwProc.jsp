<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr1"/>
<%
		String emailaddr2=request.getParameter("emailaddr2");
		String id=request.getParameter("findid");
		//out.println(num);
		
		boolean result1=mgr.findId2(id, emailaddr2);
		boolean result=mgr.findId(emailaddr2);	
		//out.println(result);
		
		String msg="���̵� Ʋ���ų� �̸����ּҸ� �߸� �Է��߽��ϴ�";
		
	    if(result1){
		  if(result){
			int num = mgr.sendNum(emailaddr2);
			session.setAttribute("conNum2", Integer.toString(num));
			session.setAttribute("emailaddr2", emailaddr2);
			msg="�̸��� �ּҰ� �½��ϴ�. ������ȣ�� ���۵Ǿ����ϴ�.";
		}//if(result)	
		}
%>
<script type="text/javascript">
 	alert("<%=msg%>");
 	location.href = "../jspsearch/search.jsp";
</script>




