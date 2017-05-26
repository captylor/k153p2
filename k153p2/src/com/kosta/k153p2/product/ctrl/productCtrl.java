package com.kosta.k153p2.product.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.product.dao.ItemInfoDao;
import com.kosta.k153p2.product.dto.ItemInfo;

import sun.rmi.server.Dispatcher;

@WebServlet("/item.do")
public class productCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ItemInfoDao idao = new ItemInfoDao();
		List<ItemInfo> itemlist = idao.selectAll();
		for (int i = 0; i < itemlist.size(); i++) {
			System.out.println(itemlist.get(i).getItem_name());
		}
		req.getSession().removeAttribute("side");// 기존의 세션을 지우고
		req.getSession().removeAttribute("menu");//

		// String menu = req.getParameter("itemMenu");
		// System.out.println("aaaa : " + menu);
		String str = "";
		// if (menu != null) {
		req.getSession().setAttribute("menu", "true");// session으로 바꾸고
		str = "?menu=true";
		// }

		String subMenu = req.getParameter("sideMenu");
		if (subMenu != null) {
			if (subMenu.equals("drink")) {// 음료 사이드 바 메뉴 클릭시
				System.out.println("음료 클릭");
				req.getSession().setAttribute("side", "drink");
				str = "?menu=true&side=drink";
			}
			if (subMenu.equals("bread")) {// 빵 사이드 바 메뉴 클릭시
				System.out.println("빵 클릭");
				req.getSession().setAttribute("side", "bread");
				str = "?menu=true&side=bread";
			}
		}
		System.out.println("menu : " + req.getSession().getAttribute("menu"));
		System.out.println("sideMenu : " + req.getSession().getAttribute("side"));
		System.out.println("=========================");
		res.sendRedirect("/k153p2/product/product_index.jsp" + str);
	}
}
