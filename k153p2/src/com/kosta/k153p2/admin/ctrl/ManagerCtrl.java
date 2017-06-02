package com.kosta.k153p2.admin.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/manage_store.do")
public class ManagerCtrl extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String param = req.getParameter("param");
		if(param == null){
			req.getRequestDispatcher("/admin/admin_index.jsp").forward(req, res);
		}
	}
}
