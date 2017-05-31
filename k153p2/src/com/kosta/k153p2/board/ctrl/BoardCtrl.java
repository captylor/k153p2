package com.kosta.k153p2.board.ctrl;

import java.io.IOException;
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
		// URL��û: http://192.168.0.147/TomTest/guest/control2?action=form ��û
		req.getSession().setAttribute("login", "member411");
		req.setCharacterEncoding("UTF-8");// �ѱ��Ķ���� ó��

		String action = req.getParameter("action");
		// "list","insert","edit","update","delete","form"
		if (action == null || action.equals("list2")) {// 1.���� ��Ϻ���
			String pageStr = req.getParameter("page");
			int page;
			if (pageStr == null) {
				page = 1;
			} else {
				page = Integer.parseInt(pageStr);
			}
			/*
			 * ��������(�� ȭ��)�� ������ ���ڵ� �� : recordCount ��ü ���ڵ� ��:
			 * totalRecord ��ü ������ ��: totalPage
			 */
			BoardInfoDao dao = new BoardInfoDao();

			int recordCount = 10;
			int totalRecord = dao.selectCount();
			int totalPage = totalRecord / recordCount;
			if (totalRecord % recordCount > 0) {
				totalPage++;
			}

			// DB���� ��ü �˻�(��ȸ)
			List<BoardInfo> list = dao.selectPage(page, recordCount);

			// ���� ȣ���� ��������͸� ����(request,session)�� ����
			// ---> ����: ��� �����ϱ� ����
			req.setAttribute("list", list);
			req.setAttribute("page", page);
			req.setAttribute("totalPage", totalPage);

			req.getRequestDispatcher("/board/list2.jsp").forward(req, resp);// 4.

		} else if (action.equals("form")) {// 1.�Է��� ��û
			req.getRequestDispatcher("/board/inputForm.jsp").forward(req, resp);// 4.

		} else if (action.equals("edit")) {// 1.������ ��û
			// URL��û: TomTest/guest/control?action=edit&board_no=3
			String no = req.getParameter("board_no");
			int board_no = Integer.parseInt(no);

			BoardInfoDao dao = new BoardInfoDao();// 3.
			BoardInfo board = dao.select(board_no);
			board.setBoard_no(board_no);
			/*
			 * HttpSession session = req.getSession();
			 * session.setAttribute("guest", guest);
			 */
			req.getSession().setAttribute("board", board);

			req.getRequestDispatcher("/board/editForm.jsp").forward(req, resp);// 4.
		} else if (action.equals("insert")) {// 1. �Է°��� ���� DB���� ��û

			BoardInfo guest = new BoardInfo();
			guest.setMember_id((String) req.getSession().getAttribute("login"));// 2.
			guest.setBoard_title(req.getParameter("board_title"));
			guest.setBoard_text(req.getParameter("board_text"));

			BoardInfoDao dao = new BoardInfoDao();// 3.

			if (dao.insert(guest)) {
				// �Է¼����� ����Ʈȭ�� �������� �̵�
				// req.getRequestDispatcher("/guest2/list2.jsp").forward(req,
				// resp);
				resp.sendRedirect("boardinfo.do");
			}

		} else if (action.equals("update")) {// ������û
			BoardInfo guest = new BoardInfo();
			String board_no = req.getParameter("board_no");
			guest.setBoard_no(Integer.parseInt(board_no));// 2.
			guest.setBoard_title(req.getParameter("board_title"));
			guest.setBoard_text(req.getParameter("board_text"));

			BoardInfoDao dao = new BoardInfoDao();
			if (dao.update(guest)) {// ���� ����
				resp.sendRedirect("/k153p2/boardinfo.do");// 4.
				// req.getRequestDispatcher("/guest2/list2.jsp").forward(req,
				// resp);

			} else {
				// resp.getWriter().print("Update Fail~ T.T");
			}
		} else if (action.equals("delete")) {// �ۻ��� ��û
			int board_no = Integer.parseInt(req.getParameter("id"));
			String loginid = (String) req.getSession().getAttribute("login");
			String board_userid = req.getParameter("userid");

			System.out.println("loginid: " + loginid);
			System.out.println("board_userid: " + board_userid);

			if (board_userid.equals(loginid)) {
				BoardInfoDao dao = new BoardInfoDao();
				if (dao.delete(board_no)) {// ��������
					resp.sendRedirect("boardinfo.do?action=list2");// 4.
				} else {
					resp.getWriter().print("Delete Fail~ T.T");
				}
			} else {
				resp.sendRedirect("boardinfo.do?action=list2");
			}
		}
	}// service

}
