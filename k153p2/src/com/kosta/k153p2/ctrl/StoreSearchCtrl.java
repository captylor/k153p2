package com.kosta.k153p2.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.dao.AddrInfoDao;
import com.kosta.k153p2.dao.StoreInfoDao;
import com.kosta.k153p2.dto.AddrInfo;
import com.kosta.k153p2.dto.ProductInfo;
import com.kosta.k153p2.dto.StoreInfo;

@WebServlet("/find_store.do")
public class StoreSearchCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");//한글처리작업
		
		String action = req.getParameter("action");
		//storeSearch(매장검색), menuSearch(메뉴검색), result(검색결과)
		
		if(action == null ||action.equals("storeSearch")){
			List<StoreInfo> list = null;
			List<AddrInfo> addrList = null;
			String location = req.getParameter("location");
			String pageStr = req.getParameter("page");
			//System.out.println("지역: "+location);
			
			int page;
			int startPage = 1;
			int viewPage = 10;//페지징 되어지는 갯수 --> 밑에 출력되는 페이지수
			if(pageStr == null){
				page = 1;
			}else{
				page = Integer.parseInt(pageStr);
				if(!(page <= viewPage)){
					//100넘으면 안될거 같음 우선
					startPage = Integer.parseInt(pageStr.substring(0,1)+"1");
				}
			}
			
			AddrInfoDao addrDao = new AddrInfoDao();
			StoreInfoDao dao = new StoreInfoDao();
			
			
			int recordCount = 5;//한페이지에 보여질 레코드 수
			int totalRecord = dao.selectCount();//전체 레코드 수: 81
			int totalPage = totalRecord/recordCount;//전체 페이지수: 81/5 = 16
			if((totalRecord % recordCount) > 0){//81%5 = 2
				totalPage++;
			}
			
			//전체페이지 -
			
			if(location == null){//검색하지 않음, 전체 데이터 출력
				//list = dao.select_all();
				list = dao.select_pageAll(page, recordCount);
				//addrList = addrDao.select_all();
				addrList = addrDao.select_pageAll(page, recordCount);
			}else{//검색어 입력 했을시
				addrList = addrDao.addrSearch(location);
				list = dao.select_store(location);
			}
			
			int temp = startPage;
			/*System.out.println("totalPage: "+totalPage);
			System.out.println("page: "+page);
			System.out.println("location: "+location);*/
			req.setAttribute("temp", temp);//startPage 저장
			req.setAttribute("viewPage", viewPage);//지역
			req.setAttribute("startPage", startPage);//지역
			req.setAttribute("location", location);//지역
			req.setAttribute("list", list);//매장정보
			req.setAttribute("addrList", addrList);//주소정보
			req.setAttribute("page", page);//현재 페이지 정보
			req.setAttribute("totalPage", totalPage);//전체 페이지수
			
			
			req.getRequestDispatcher("/jsp/store/main.jsp").forward(req, resp);
			
		}else if(action.equals("result")){//사진 클릭시 그 지점의 정보 출력
			StoreInfo storeInfo = null;
			AddrInfo addrInfo = null;
			String storeNo = req.getParameter("storeNo");
			//System.out.println("storeNo="+storeNo);
			
			StoreInfoDao dao = new StoreInfoDao();
			AddrInfoDao addrDao = new AddrInfoDao();
			
			storeInfo = dao.select_result(Integer.parseInt(storeNo));
			addrInfo = addrDao.addrStoreNo(Integer.parseInt(storeNo));
			
			String product_hex = storeInfo.getStore_product();
			List<ProductInfo> product_list = dao.select_product(product_hex);
			
			req.setAttribute("store", storeInfo);
			req.setAttribute("addr", addrInfo);
			req.setAttribute("product_list", product_list);
			
			req.getRequestDispatcher("/jsp/store/main_result.jsp").forward(req, resp);
			
		}else if(action.equals("menuSearch")){//메뉴 검색창
			String itemType = req.getParameter("itemType");
			String item_name = req.getParameter("item_name");
			
			List<StoreInfo> sellStoreList = null;
			List<AddrInfo> addrList = new ArrayList<>();//판매매장에 대한 addr정보 list
			
			StoreInfoDao dao = new StoreInfoDao();
			AddrInfoDao addrDao = new AddrInfoDao();
			
			/*System.out.println("itemType: "+itemType);
			System.out.println("item_name: "+item_name);*/
			
			if(itemType == null && item_name == null){
				sellStoreList = dao.select_all();
				addrList = addrDao.select_all();
			}else{
				//판매매장에 대한 list
				sellStoreList = dao.select_itemName(itemType, item_name);
				for(int i=0; i<sellStoreList.size(); i++){
					//판매매장의 storeNo로 주소값 받기
					addrList.add(addrDao.addrStoreNo(sellStoreList.get(i).getStore_no()));
				}//for
			}//else
			
			req.setAttribute("sellStoreList", sellStoreList);
			req.setAttribute("addrList", addrList);
			
						
			//req.getRequestDispatcher("/happyCafe/store_MenuSearch.jsp").forward(req, resp);
			req.getRequestDispatcher("/jsp/store/main_menuSearch.jsp").forward(req, resp);
		
		}else if(action.equals("sido")){
			req.getRequestDispatcher("/jsp/store/sido.jsp").forward(req, resp);
			
		}else if(action.equals("itemtype")){
			req.getRequestDispatcher("/jsp/store/ItemType.jsp").forward(req, resp);
			
		}
		
		
		
	}//service()
}
