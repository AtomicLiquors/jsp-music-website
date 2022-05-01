package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/board/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//���� ����
		HttpSession session = request.getSession();
		//read.jsp���� bean�̸����� BoardBean ��ü�� ����
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		MultipartRequest mulit = new MultipartRequest(request,
				BoardMgr.SAVEFOLDER, BoardMgr.MAXSIZE, 
				BoardMgr.ENCODING, new DefaultFileRenamePolicy());
		String inPass = mulit.getParameter("pass");//update.jsp�� �Է��� ���
		if(inPass.equals(dbPass)) {
			BoardMgr mgr = new BoardMgr();
			mgr.updateBoard(mulit);
			//�����Ŀ� ������������ read.jsp
			String nowPage = mulit.getParameter("nowPage");
			String numPerPage = mulit.getParameter("numPerPage");
			response.sendRedirect("read.jsp?nowPage="+nowPage
					+"&numPerPage="+numPerPage
					+"&num="+bean.getNum());
		}else {
			response.setContentType("text/html; charset=EUC-KR");
			PrintWriter out =response.getWriter();
			out.println("<script>");
			out.println("alert('�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}














