package com.kosta.k153p2.init2.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.init2.dao.MemberInfoDAO;
import com.kosta.k153p2.init2.dao.OrderDAO;
import com.kosta.k153p2.init2.dto.MemberInfo;
import com.kosta.k153p2.init2.dto.Order;

@WebServlet("/member.do")
public class MemberController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String action= req.getParameter("action");
		//insert,update,delete,select
		if(action==null){
			req.getRequestDispatcher("/init2/login.jsp").forward(req, resp);		
		}else if(action.equals("login")){
			req.getRequestDispatcher("/init2/login.jsp").forward(req, resp);		
		}else if(action.equals("join")){
			req.getRequestDispatcher("/init2/memberInput.jsp").forward(req, resp);
		}else if(action.equals("start")){
			String id = req.getParameter("id");
			String pass = req.getParameter("pass");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			
			MemberInfo member = new MemberInfo();
				member.setMember_id(id);
				member.setMember_pass(pass);
				member.setMember_name(name);
				member.setMember_email(email);
				
			MemberInfoDAO dao = new MemberInfoDAO();
			if(dao.insert(member)){
				req.getRequestDispatcher("/init2/start.jsp").forward(req, resp);
			}
		}else if(action.equals("beginning")){
			req.getSession().setAttribute("login",req.getParameter("id"));	//로그인성공후 세션부여 
			req.getRequestDispatcher("/init2/beginning.jsp").forward(req, resp);
			
		}else if(action.equals("memberinfo")){
			String id = (String) req.getSession().getAttribute("login");    //세션값이 두번 들어가도 될까?
			MemberInfoDAO dao = new MemberInfoDAO();
			MemberInfo member = dao.selectinfo(id);
			req.setAttribute("member", member);
			req.getRequestDispatcher("/init2/memberInfoview.jsp").forward(req, resp);
		}else if(action.equals("memberupdate")){
			String id = (String) req.getSession().getAttribute("login");    //세션값이 두번 들어가도 될까?
			MemberInfoDAO dao = new MemberInfoDAO();
			MemberInfo member = dao.selectinfo(id);
			req.setAttribute("member", member);
			req.getRequestDispatcher("/init2/memberUpdate.jsp").forward(req, resp);
		}else if(action.equals("updateEnd")){
			MemberInfo member = new MemberInfo();
			member.setMember_id(req.getParameter("id"));
			member.setMember_pass(req.getParameter("pass"));
			member.setMember_name(req.getParameter("name"));
			member.setMember_email(req.getParameter("email"));
			
			MemberInfoDAO dao = new MemberInfoDAO();					
			dao.update(member);
			if(dao.update(member)){//수정성공이라면
				req.getSession().invalidate();
				resp.sendRedirect("member.do?action=login");//마지막에 스크립트에서 로케이선href로 보내고 여기서는 세션 해제
			}
		}else if(action.equals("duplicate")){
			req.getRequestDispatcher("/init2/memberDuplicate.jsp").forward(req, resp);		
		}else if(action.equals("leave")){						
			String id = (String) req.getSession().getAttribute("login");
				MemberInfoDAO dao = new MemberInfoDAO();
			   if(dao.delete(id)){//삭제성공
				   req.getSession().invalidate();
				   resp.sendRedirect("member.do?action=login");
			   }
		//=========================================================order ---> 게시판 부분
		}else if(action.equals("order")){
			req.getSession().removeAttribute("selectStore");
			req.getSession().removeAttribute("store_name");
			req.getSession().removeAttribute("selectStore");
			req.getRequestDispatcher("/init2/admin_Manager_Order.jsp").forward(req, resp);	
		}else if(action.equals("showstore")){
			if(req.getSession().getAttribute("selectStore")==null && req.getSession().getAttribute("store_name")==null){
				req.getSession().setAttribute("selectStore", req.getParameter("store_name"));
				req.getSession().setAttribute("store_name", req.getParameter("store_name"));  
			}
				
			
			
			OrderDAO dao = new OrderDAO();
			String hex = dao.getHex((String) req.getSession().getAttribute("store_name"));			//16진수 
			List<String> list = dao.select_product(hex);
			req.setAttribute("product", list);
			
			req.getRequestDispatcher("/init2/admin_Manager_Order.jsp").forward(req, resp);	
		}else if(action.equals("inputguest")){
			int count = 0;  //총0~132 ---> 133개
			List<String> list_itemNo = new ArrayList<>();
			List<String> list_amount = new ArrayList<>();
			List<Order> orderList = new ArrayList<>(); 
			
			OrderDAO dao = new OrderDAO();
			String store_name = (String) req.getSession().getAttribute("store_name");
			String store_no = dao.toStore(store_name);
			
			while(req.getParameter(count+"") != null){
				count++;		
			}
			for(int i=0; i<count; i++){ 
				list_itemNo.add(i+"");
				list_amount.add(req.getParameter(i+""));
				
			}
			for(int j=0; j<list_amount.size(); j++){
				//System.out.println(list_amount);  item_no이  재고테이블 말고 다른 곳에서 필요한지..? 알아보기  
				//	    							과연 포린키가 필요한가..? 
				if(!(list_amount.get(j)=="") && !(list_amount.get(j).equals("null"))){
					Order order = new Order();
						order.setStore_name(store_name);
						order.setStore_no(Integer.parseInt(store_no));
						order.setItem_no(Integer.parseInt(list_itemNo.get(j)));
						order.setOrder_amount(Integer.parseInt(list_amount.get(j)));
						if(dao.insertGuest(order)){
							System.out.println("성공!");
						}
				}//if
			}//for
			
			
				req.getSession().removeAttribute("selectStore");
				req.getSession().removeAttribute("store_name");
				req.getSession().removeAttribute("selectStore");
				req.getRequestDispatcher("/init2/admin_Manager_Order.jsp").forward(req, resp);
			
				
			
			
		}
		
		
		
		
		
		
		
		//로그아웃 버튼(세션 없애기)
		//수정 성공시 메세지나오게하기 
		//삭제 비번입력할때 (**로 하고) 성공시 alert로 메세지 뜨게하기!
		//아이디찾기 비번찾기
		
		
		//물품신청페이지
		
	}
}
