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
			MemberInfoDAO dao = new MemberInfoDAO();
			MemberInfo member = new MemberInfo();
			
			member = dao.selectLogin(req.getParameter("id"));
			
			if(member.getMember_id().equals(req.getParameter("id")) && member.getMember_pass().equals(req.getParameter("pass"))){ //�α��μ���!
				req.getSession().setAttribute("member",member);	//�α��μ����� ���Ǻο�
				req.getRequestDispatcher("/init2/beginning.jsp").forward(req, resp);
			}
		}else if(action.equals("memberinfo")){
			req.getRequestDispatcher("/init2/memberInfoview.jsp").forward(req, resp);
		}else if(action.equals("memberupdate")){
			req.getRequestDispatcher("/init2/memberUpdate.jsp").forward(req, resp);
		}else if(action.equals("duplicate")){
			String id = req.getParameter("id");
			System.out.println(id);
			if(id==null){// �Էµ� ���̵�  null�̸� �ٽ� �ߺ�Ȯ��â���� -- > ���߿� �̰� ��ȿ�� �˻�� ������ alert�ϱ�!
				req.getRequestDispatcher("/init2/memberDuplicate.jsp").forward(req, resp);
			}else{
				MemberInfoDAO dao = new MemberInfoDAO();
				boolean flag = dao.checkId(id);
					if(flag){//���Ұ��ϸ�!
						req.setAttribute("msg", "�̹� �����ϴ� ���̵��Դϴ�!");
					}else{// �˻��Ѱ�� null(?)�̸�(��ġ�°� ���) ��밡���ϸ�!!
						req.setAttribute("msg", "��밡���� ���̵��Դϴ�!");
						resp.getWriter().print("<script>confirm('��밡���� ���̵��Դϴ�!����Ͻðڽ��ϱ�?');</script>");
					}						
					req.getRequestDispatcher("/init2/checkId.jsp").forward(req, resp);
			}
			
			
			
			
		}else if(action.equals("leave")){
			MemberInfo memberinfo =(MemberInfo) req.getSession().getAttribute("member");
			String id =memberinfo.getMember_id();
				MemberInfoDAO dao = new MemberInfoDAO();
			   if(dao.delete(id)){//��������
				   resp.sendRedirect("member.do");
			   }else{//Ż�� �ȵǾ��ٸ�
				  
			   }
		}else if(action.equals("updateinfo")){
			MemberInfo member = new MemberInfo();
			member.setMember_id(req.getParameter("id"));
			member.setMember_pass(req.getParameter("pass"));
			member.setMember_name(req.getParameter("name"));
			member.setMember_email(req.getParameter("email"));
			member.setMember_grade(req.getParameter("grade"));
			
			
			MemberInfoDAO dao = new MemberInfoDAO();
			if(dao.update(member)){//���������̶��   �̰ŵ� �̱���
				req.getSession().invalidate();
				req.setAttribute("msg", "������ �����Ǿ����ϴ�. <br> �ٽ� �α��� ���ּ���");
				resp.sendRedirect("member.do");
			}else{//���� �ȵǾ��ٸ�
				req.setAttribute("msg", "���������� �����Ͽ����ϴ�.");
			}
		}
		
		
		// ���� �α׾ƿ����οű��
	}
}