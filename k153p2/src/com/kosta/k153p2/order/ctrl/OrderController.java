package com.kosta.k153p2.order.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/order.do")
public class OrderController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String action = req.getParameter("action");
		//기능  나열
		
		if(action== null){
			req.getRequestDispatcher("/init2/admin_Manager_Order.jsp").forward(req, resp);
			
		}
		
		
		
		
	}
	
}
