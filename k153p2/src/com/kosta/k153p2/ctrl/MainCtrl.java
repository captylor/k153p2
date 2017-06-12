package com.kosta.k153p2.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.dao.MainDao;

@WebServlet("/main.do")
public class MainCtrl extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//request.getSession().setAttribute("login", "member996");
		//request.getSession().setAttribute("grade", "M");
		String action = request.getParameter("action");
		if(action==null){
			request.setAttribute("list", new MainDao().selectTOP());
			request.getRequestDispatcher("/jsp/main.jsp").forward(request, response);
			
		}else if(action.equals("loginForm")){
			request.getRequestDispatcher("/jsp/member/loginForm.jsp").forward(request, response);
			
		}else if(action.equals("login")){
			request.getRequestDispatcher("/jsp/loginForm.jsp").forward(request, response);
			
		}
	}
}
