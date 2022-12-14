package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/board/jspboard/boardReply")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMgr mgr = new BoardMgr();
		mgr.replyBoard(request);
		
		HttpSession session = request.getSession();
		String bValue = (String)session.getAttribute("bValue");
		response.sendRedirect("boardList.jsp?bValue=" + bValue);
	}

}
