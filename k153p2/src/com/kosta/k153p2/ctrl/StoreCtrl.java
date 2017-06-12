package com.kosta.k153p2.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.dao.MainDao;
import com.kosta.k153p2.dao.OrderInfoDao;
import com.kosta.k153p2.dao.StoreSell;
import com.kosta.k153p2.dto.ItemInfo;
import com.kosta.k153p2.dto.OrderInfo;

@WebServlet("/manage_store.do")
public class StoreCtrl extends HttpServlet{
	
	String masterCertify = "111111222222333333444444";
	String adminCertify  = "555555666666777777888888";
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//request.getSession().setAttribute("login", null);
		String action = request.getParameter("action");
		if(action==null){
			
			request.getRequestDispatcher("/jsp/manage/main.jsp").forward(request, response);
			
		}else if(action.equals("sell")){
			String memberid = (String)request.getSession().getAttribute("login");
			request.setAttribute("list", new StoreSell().selectItem(memberid));
			request.setAttribute("typelist", new StoreSell().selectAll2());
			request.setAttribute("stocklist", new StoreSell().selectAll3((String)request.getSession().getAttribute("login")));
			request.getRequestDispatcher("/jsp/manage/sell.jsp").forward(request, response);
			
		}else if(action.equals("submit")){
			int jsonSize = Integer.parseInt(request.getParameter("0"))+1;
			for(int i=1; i<jsonSize; i++){
				new StoreSell().minusStock(request.getParameter(i+""), (String)request.getSession().getAttribute("login"));
			}
			//request.getRequestDispatcher("/manage_store.do").forward(request, response);
			//response.sendRedirect("/manage_store.do?action=sell");
			
		}else if(action.equals("buy")){
			request.getRequestDispatcher("/jsp/manage/buy.jsp").forward(request, response);
			
		}else if(action.equals("certifyForm")){
			request.getRequestDispatcher("/jsp/manage/certifyForm.jsp").forward(request, response);
			
		}else if(action.equals("certify")){
			String cerpass = request.getParameter("cerpass");
			if (cerpass.equals(masterCertify)) {
				new MainDao().updateGrade((String)request.getSession().getAttribute("login"), "M");
				response.getWriter().write("1");
				
			}else if(cerpass.equals(adminCertify)){
				new MainDao().updateGrade((String)request.getSession().getAttribute("login"), "A");
				response.getWriter().write("2");
				
			}else{
				response.getWriter().write("0");
			}
			
		}else if(action.equals("buyBoard")){
			String pageStr = request.getParameter("page"); 
			int page;
			if(pageStr==null){
				page=1;
			}else{
				page= Integer.parseInt(pageStr);
			}
			  /*
			      한페이지(한 화면)에 보여질 레코드 수 : recordCount
			      전체 레코드 수: totalRecord
			      전체 페이지 수: totalPage
			  */
			StoreSell dao = new StoreSell();
			String member_id = (String)request.getSession().getAttribute("login");
			  
			int recordCount=20;
			int totalRecord = dao.orderinfoCount(member_id);
			int totalPage = totalRecord/recordCount;
			if(totalRecord%recordCount>0){
				totalPage++;
			}
			  
			request.setAttribute("list", new StoreSell().buyBoardPazing(page, recordCount, member_id));
			  
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.getRequestDispatcher("/jsp/manage/buyBoard.jsp").forward(request, response);
		
		}else if(action.equals("orderForm")){
			List<ItemInfo> list = new OrderInfoDao().select_product((String)request.getSession().getAttribute("login"));
			request.setAttribute("list", list);
			System.out.println();
			request.getRequestDispatcher("/jsp/manage/orderForm.jsp").forward(request, response);
			
		}else if(action.equals("order")){
			int jsonSize = Integer.parseInt(request.getParameter("0")); 
			for(int i=1; i<=jsonSize; i++){
				String data = request.getParameter(i+"");
				String[] data_arr = data.split(",");
				String item_no = data_arr[0];
				String order_amount = data_arr[1];
				String member_id = (String)request.getSession().getAttribute("login");
				new OrderInfoDao().insertOrder(item_no, order_amount, member_id);
			}
			
		}else if(action.equals("orderCheckForm")){
			List<OrderInfo> list = new ArrayList<>();
			list = new StoreSell().order_notHandled((String)request.getSession().getAttribute("login"));
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("/jsp/manage/board_Order_View.jsp").forward(request, response);
		
		}else if(action.equals("stock")){
			request.getRequestDispatcher("/jsp/manage/stock.jsp").forward(request, response);
		}
	}//service
}//class
