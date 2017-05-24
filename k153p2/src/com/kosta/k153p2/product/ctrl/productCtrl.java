package com.kosta.k153p2.product.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.product.dao.ItemInfoDao;
import com.kosta.k153p2.product.dto.ItemInfo;

@WebServlet("/product")
public class productCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ItemInfoDao idao = new ItemInfoDao();
		List<ItemInfo> itemlist = idao.selectAll();
		for (int i = 0; i < itemlist.size(); i++) {
			System.out.println(itemlist.get(i).getItem_name());
		}
	}

}
