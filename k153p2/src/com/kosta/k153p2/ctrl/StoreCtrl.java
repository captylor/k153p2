package com.kosta.k153p2.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.dao.StoreInfoDao;
import com.kosta.k153p2.dto.StoreInfo;
@WebServlet("/kkkk.do")
public class StoreCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");//�ѱ�ó���۾�
		
		String action = req.getParameter("action");
		//storeSearch(����˻�), menuSearch(�޴��˻�), result(�˻����)
		
		if(action == null ||action.equals("storeSearch")){
			
			String selStore = req.getParameter("selStore");
			String location = req.getParameter("location");
			//System.out.println("�˻���: "+selStore);
			//System.out.println("����: "+location);
			if(selStore != null && location != null){
				StoreInfoDao dao = new StoreInfoDao();
				List<StoreInfo> list = dao.select_store(location, selStore);
				req.setAttribute("list", list);
			}
			
			req.getRequestDispatcher("/happyCafe/store_StoreSearch.jsp").forward(req, resp);
			
		}
		
	}//service()
}
