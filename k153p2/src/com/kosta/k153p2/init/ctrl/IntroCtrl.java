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
			req.getRequestDispatcher("/init/init_index.jsp").forward(req, resp);	
		}
	}

}
