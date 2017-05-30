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
		//1.DAO생성	
		IdCheckDAO dao = new IdCheckDAO();
		//2.호출한 DAO의 함수를 호출
		String id = req.getParameter("id");
		System.out.println("id : "+id);
		String result = dao.idCheck(id);
		System.out.println("result() : "+result);
		//3. 리턴값 받고 view에 넘겨준다
		if(result.equals("duple")){
			str = "중복된 아이디 입니다";
			req.setAttribute("duple", str);
		}else{
			str = "사용가능한 아이디 입니다<br><input type='button' value='사용' id='close' "
					+ "onclick='pageClose()'>";
			req.setAttribute("duple", str);
			
		}
		//4. 화면이동 다시중복체크화면으로
		//forward = request, session, application
		//reDirect = session, application
		req.getRequestDispatcher("/checkId/test.jsp").forward(req, resp);
		System.out.println("페이지이동 끝");
		
	}
}
