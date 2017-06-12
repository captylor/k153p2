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
		
		req.setCharacterEncoding("UTF-8");//�ѱ�ó���۾�
		
		String action = req.getParameter("action");
		//storeSearch(����˻�), menuSearch(�޴��˻�), result(�˻����)
		
		if(action == null ||action.equals("storeSearch")){
			List<StoreInfo> list = null;
			List<AddrInfo> addrList = null;
			String location = req.getParameter("location");
			String pageStr = req.getParameter("page");
			//System.out.println("����: "+location);
			
			int page;
			int startPage = 1;
			int viewPage = 10;//����¡ �Ǿ����� ���� --> �ؿ� ��µǴ� ��������
			if(pageStr == null){
				page = 1;
			}else{
				page = Integer.parseInt(pageStr);
				if(!(page <= viewPage)){
					//100������ �ȵɰ� ���� �켱
					startPage = Integer.parseInt(pageStr.substring(0,1)+"1");
				}
			}
			
			AddrInfoDao addrDao = new AddrInfoDao();
			StoreInfoDao dao = new StoreInfoDao();
			
			
			int recordCount = 5;//���������� ������ ���ڵ� ��
			int totalRecord = dao.selectCount();//��ü ���ڵ� ��: 81
			int totalPage = totalRecord/recordCount;//��ü ��������: 81/5 = 16
			if((totalRecord % recordCount) > 0){//81%5 = 2
				totalPage++;
			}
			
			//��ü������ -
			
			if(location == null){//�˻����� ����, ��ü ������ ���
				//list = dao.select_all();
				list = dao.select_pageAll(page, recordCount);
				//addrList = addrDao.select_all();
				addrList = addrDao.select_pageAll(page, recordCount);
			}else{//�˻��� �Է� ������
				addrList = addrDao.addrSearch(location);
				list = dao.select_store(location);
			}
			
			int temp = startPage;
			/*System.out.println("totalPage: "+totalPage);
			System.out.println("page: "+page);
			System.out.println("location: "+location);*/
			req.setAttribute("temp", temp);//startPage ����
			req.setAttribute("viewPage", viewPage);//����
			req.setAttribute("startPage", startPage);//����
			req.setAttribute("location", location);//����
			req.setAttribute("list", list);//��������
			req.setAttribute("addrList", addrList);//�ּ�����
			req.setAttribute("page", page);//���� ������ ����
			req.setAttribute("totalPage", totalPage);//��ü ��������
			
			
			req.getRequestDispatcher("/jsp/store/main.jsp").forward(req, resp);
			
		}else if(action.equals("result")){//���� Ŭ���� �� ������ ���� ���
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
			
		}else if(action.equals("menuSearch")){//�޴� �˻�â
			String itemType = req.getParameter("itemType");
			String item_name = req.getParameter("item_name");
			
			List<StoreInfo> sellStoreList = null;
			List<AddrInfo> addrList = new ArrayList<>();//�ǸŸ��忡 ���� addr���� list
			
			StoreInfoDao dao = new StoreInfoDao();
			AddrInfoDao addrDao = new AddrInfoDao();
			
			/*System.out.println("itemType: "+itemType);
			System.out.println("item_name: "+item_name);*/
			
			if(itemType == null && item_name == null){
				sellStoreList = dao.select_all();
				addrList = addrDao.select_all();
			}else{
				//�ǸŸ��忡 ���� list
				sellStoreList = dao.select_itemName(itemType, item_name);
				for(int i=0; i<sellStoreList.size(); i++){
					//�ǸŸ����� storeNo�� �ּҰ� �ޱ�
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
