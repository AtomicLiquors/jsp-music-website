<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr1"/>
<%
		boolean flag=false;
		String numfield2 = request.getParameter("numfield2");
		String emailaddr2 = (String)session.getAttribute("emailaddr2");
		String num = (String)session.getAttribute("conNum2");
		String pwd = "";
		String msg ="������ȣ�� �߸� �Է��߽��ϴ�";
		
		if(numfield2.equals(num)){ 
			msg = " : ȸ������ �н������Դϴ�.";
			pwd=mgr.showPwd(emailaddr2);
		}
%>

<script type="text/javascript">
 	//alert("<%=pwd + " : "+ msg%>");
 	alert("<%=pwd%> <%=msg%>");
 	location.href = "../jspmember/login.jsp";
</script>

