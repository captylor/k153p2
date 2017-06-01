package com.kosta.k153p2.init2.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.init2.dao.MemberInfoDAO;
import com.kosta.k153p2.init2.dto.MemberInfo;

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
			String id = (String) req.getSession().getAttribute("login");
			MemberInfoDAO dao = new MemberInfoDAO();
			MemberInfo member = dao.selectinfo(id);
			req.setAttribute("member", member);
			req.getRequestDispatcher("/init2/memberInfoview.jsp").forward(req, resp);
		}else if(action.equals("memberupdate")){
			req.getRequestDispatcher("/init2/memberUpdate.jsp").forward(req, resp);
		}else if(action.equals("duplicate")){
			req.getRequestDispatcher("/init2/memberDuplicate.jsp").forward(req, resp);
		
		}else if(action.equals("leave")){
			String id = (String) req.getSession().getAttribute("login");
				MemberInfoDAO dao = new MemberInfoDAO();
			   if(dao.delete(id)){//삭제성공
				   resp.sendRedirect("member.do");
			   }else{//탈퇴가 안되었다면
				  
			   }
		}else if(action.equals("updateinfo")){
			MemberInfo member = new MemberInfo();
			member.setMember_id(req.getParameter("id"));
			member.setMember_pass(req.getParameter("pass"));
			member.setMember_name(req.getParameter("name"));
			member.setMember_email(req.getParameter("email"));
			member.setMember_grade(req.getParameter("grade"));
			
			
			MemberInfoDAO dao = new MemberInfoDAO();
			if(dao.update(member)){//수정성공이라면   이거도 미구현
				req.getSession().invalidate();
				req.setAttribute("msg", "정보가 수정되었습니다. <br> 다시 로그인 해주세요");
				resp.sendRedirect("member.do");
			}else{//수정 안되었다면
				req.setAttribute("msg", "정보수정이 실패하였습니다.");
			}
		}
		
		
		// 세션 로그아웃으로옮기기
	}
}
