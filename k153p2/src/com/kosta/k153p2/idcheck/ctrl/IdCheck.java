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
	String str;
	
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
			str = "�ߺ��� ���̵� �Դϴ�";
			req.setAttribute("duple", str);
		}else{
			str = "��밡���� ���̵� �Դϴ�<br><input type='button' value='���' id='close' "
					+ "onclick='pageClose()'>";
			req.setAttribute("duple", str);
			
		}
		//4. ȭ���̵� �ٽ��ߺ�üũȭ������
		//forward = request, session, application
		//reDirect = session, application
		req.getRequestDispatcher("/checkId/test.jsp").forward(req, resp);
		System.out.println("�������̵� ��");
		
	}
}
