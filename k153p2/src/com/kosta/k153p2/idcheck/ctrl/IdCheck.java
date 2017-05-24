package com.kosta.k153p2.idcheck.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.k153p2.idcheck.dao.IdCheckDAO;
@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.DAO����
		IdCheckDAO dao = new IdCheckDAO();
		//2.ȣ���� DAO�� �Լ��� ȣ��
		String id = req.getParameter("id");
		System.out.println("id : "+id);
		String result = dao.idCheck(id);
		System.out.println("result() : "+result);
		//3. ���ϰ� �ް� view�� �Ѱ��ش�
		if(result.equals("duple")){
			req.setAttribute("duple", "�ߺ��Դϴ�.");
		}else{
			req.setAttribute("duple", "�̰ɷ� �����?");
		}
		//4. ȭ���̵� �ٽ��ߺ�üũȭ������
		//forward = request, session, application
		//reDirect = session, application
		req.getRequestDispatcher("./checkId/test.jsp").forward(req, resp);
		System.out.println("�������̵� ��");
		
	}
}
