package com.kosta.k153p2.init.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/intro.do")
public class IntroCtrl extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sideM = req.getParameter("sideM");
		if(sideM ==null){
			req.getRequestDispatcher("/init/introduce.jsp").forward(req, resp);			
		}
		String year = req.getParameter("year");
		if (year != null && year.equals("2017")) {
			req.getRequestDispatcher("/init/year.jsp").forward(req, resp);
		}
	}

}
