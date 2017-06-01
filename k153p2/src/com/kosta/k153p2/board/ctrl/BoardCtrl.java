package com.kosta.k153p2.board.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.board.dao.BoardInfoDao;
import com.kosta.k153p2.board.dto.BoardInfo;

@WebServlet("/boardinfo.do")
public class BoardCtrl extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().setAttribute("login", "member411");
		req.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();

		String board = req.getParameter("board");
		if (board == null) {
			resp.sendRedirect("/k153p2/board/board_index.jsp");
		}
		String freeinfo = req.getParameter("freeInfo");
		if (freeinfo != null) {// 글쓰기
			BoardInfoDao dao = new BoardInfoDao();
			String title = req.getParameter("board_title");
			String context = req.getParameter("board_text");

			BoardInfo info = new BoardInfo();
			info.setMember_id("수정요망");
			info.setBoard_title(title);
			info.setBoard_text(context);
			dao.insert(info);
			out.print("<script>window.self.close();</script>");
		}
		String update = req.getParameter("update");
		if (update != null) {// 글 수정
			BoardInfoDao dao = new BoardInfoDao();
			BoardInfo info = new BoardInfo();
			info.setBoard_no(Integer.parseInt(req.getParameter("board_no")));
			info.setBoard_title(req.getParameter("board_title"));
			info.setBoard_text(req.getParameter("board_text"));
			boolean result = dao.update(info);
			if(result){
				out.print("<script>window.opener.location.reload(); window.self.close();</script>");				
			}else{
				out.print("<h1>수정이 실패하였습니다</h1>");
			}
		}
		String delete = req.getParameter("delete");
		if(delete != null){
			BoardInfoDao dao = new BoardInfoDao();
			boolean result = dao.delete(Integer.parseInt(req.getParameter("board_no")));
			if(result){
				out.print("<script>window.opener.location.reload(); window.self.close();</script>");				
			}else{
				out.print("<h1>삭제 실패하였습니다</h1>");
			}
		}

	}// service

}
