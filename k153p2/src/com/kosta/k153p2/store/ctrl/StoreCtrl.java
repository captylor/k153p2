package com.kosta.k153p2.store.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.dao.AddrInfoDao;
import com.kosta.k153p2.dao.StoreInfoDao;
import com.kosta.k153p2.dto.AddrInfo;
import com.kosta.k153p2.dto.ProductInfo;
import com.kosta.k153p2.dto.StoreInfo;

public class StoreCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");// 한글처리작업

		String action = req.getParameter("action");
		// storeSearch(매장검색), menuSearch(메뉴검색), result(검색결과)

		if (action == null || action.equals("storeSearch")) {
			List<StoreInfo> list = null;
			List<AddrInfo> addrList = null;
			String location = req.getParameter("location");
			System.out.println("지역: " + location);

			AddrInfoDao addrDao = new AddrInfoDao();
			StoreInfoDao dao = new StoreInfoDao();

			if (location == null) {// 검색하지 않음, 전체 데이터 출력
				addrList = addrDao.select_all();
				list = dao.select_all();
			} else {// 검색어 입력 했을시
				addrList = addrDao.addrSearch(location);
				list = dao.select_store(location);
			}

			req.setAttribute("list", list);
			req.setAttribute("addrList", addrList);

			req.getRequestDispatcher("/happyCafe/store_StoreSearch.jsp").forward(req, resp);

		} else if (action.equals("result")) {// 사진 클릭시 그 지점의 정보 출력
			StoreInfo storeInfo = null;
			AddrInfo addrInfo = null;
			String storeNo = req.getParameter("storeNo");
			System.out.println("storeNo=" + storeNo);

			StoreInfoDao dao = new StoreInfoDao();
			AddrInfoDao addrDao = new AddrInfoDao();

			storeInfo = dao.select_result(Integer.parseInt(storeNo));
			addrInfo = addrDao.addrStoreNo(Integer.parseInt(storeNo));

			String product_hex = storeInfo.getStore_product();
			List<ProductInfo> product_list = dao.select_product(product_hex);

			req.setAttribute("store", storeInfo);
			req.setAttribute("addr", addrInfo);
			req.setAttribute("product_list", product_list);

			req.getRequestDispatcher("/happyCafe/store_Result.jsp").forward(req, resp);
		} else if (action.equals("menuSearch")) {// 메뉴 검색창
			String itemType = req.getParameter("itemType");
			String item_name = req.getParameter("item_name");

			List<StoreInfo> sellStoreList = null;
			List<AddrInfo> addrList = new ArrayList<>();// 판매매장에 대한 addr정보 list

			StoreInfoDao dao = new StoreInfoDao();
			AddrInfoDao addrDao = new AddrInfoDao();

			System.out.println("itemType: " + itemType);
			System.out.println("item_name: " + item_name);

			if (itemType == null && item_name == null) {
				sellStoreList = dao.select_all();
				addrList = addrDao.select_all();
			} else {
				// 판매매장에 대한 list
				sellStoreList = dao.select_itemName(itemType, item_name);
				for (int i = 0; i < sellStoreList.size(); i++) {
					// 판매매장의 storeNo로 주소값 받기
					addrList.add(addrDao.addrStoreNo(sellStoreList.get(i).getStore_no()));
				} // for
			} // else

			req.setAttribute("sellStoreList", sellStoreList);
			req.setAttribute("addrList", addrList);

			req.getRequestDispatcher("/happyCafe/store_MenuSearch.jsp").forward(req, resp);
		}
	}// service()
}
