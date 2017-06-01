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
public class ProductCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ItemInfoDao idao = new ItemInfoDao();
		List<ItemInfo> itemlist = idao.selectAll();
		for (int i = 0; i < itemlist.size(); i++) {
			System.out.println(itemlist.get(i).getItem_name());
		}
		req.getSession().removeAttribute("menu");//
		String str = "";
		req.getSession().setAttribute("menu", "true");// session으로 바꾸고
		str = "?menu=true";

		System.out.println("menu : " + req.getSession().getAttribute("menu"));
		System.out.println("=========================");
		res.sendRedirect("/k153p2/product/product_index.jsp" + str);
	}
}
