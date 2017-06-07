package com.kosta.k153p2.login.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kosta.k153p2.login.dao.MemberInfoDAO;
import com.kosta.k153p2.login.dto.MemberInfo;

@WebServlet("/member.do")
public class MemberCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
		res.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = res.getWriter();
		
		if (action == null) {
			req.getRequestDispatcher("/login/login_index.jsp").forward(req, res);
		} else if (action.equals("updateEnd")) {// 수정폼에서 수정을 클릭
			MemberInfoDAO dao = new MemberInfoDAO();
			MemberInfo sessionM = (MemberInfo) req.getSession().getAttribute("loginInfo");
			MemberInfo member = new MemberInfo(sessionM.getMember_id(), req.getParameter("pass"),
					req.getParameter("name"), req.getParameter("pass"));
			boolean result = dao.update(member);
			if (result) {
				out.print("<script>window.opener.location.reload(); window.self.close();</script>");
			} else {
				out.print("<h1>삭제 실패하였습니다</h1>");
			}
		}
	}
}
