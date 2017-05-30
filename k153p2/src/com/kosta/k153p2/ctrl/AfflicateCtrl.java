package com.kosta.k153p2.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/afflicate.do")
public class AfflicateCtrl extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	req.getRequestDispatcher("/checkId/afflicate.jsp").forward(req, resp);
	String year = req.getParameter("year");
	if(year!=null&&year.equals("2017")){
		req.getRequestDispatcher("/checkId/year.jsp").forward(req, resp);
	}
	String manage = req.getParameter("manage"); 
	if(manage!=null&&manage.equals("manage")){
		req.getRequestDispatcher("/checkId/manage.jsp").forward(req, resp);
	}
	String buy = req.getParameter("buy");
	if(buy!=null&&buy.equals("buy")){
		req.getRequestDispatcher("/checkId/buy.jsp").forward(req, resp);
	}
	String sold=req.getParameter("sold");
	if(sold!=null&&sold.equals("sold")){
		req.getRequestDispatcher("/checkId/buy.jsp").forward(req, resp);
	}
	String send=req.getParameter("send");
	if(send!=null&&send.equals("send")){
		req.getRequestDispatcher("/checkId/send.jsp").forward(req, resp);
	}
}
}
