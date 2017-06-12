package com.kosta.k153p2.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kosta.k153p2.dao.BoardInfoDao;
import com.kosta.k153p2.dto.BoardInfo;
import com.kosta.k153p2.dto.ReplyInfo;

@WebServlet("/board.do")
public class BoardCtrl extends HttpServlet{

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   req.setCharacterEncoding("UTF-8");//�ѱ��Ķ���� ó��		
	   //req.getSession().setAttribute("login", "member411");
		
	   String action = req.getParameter("action");
	   //"list","insert","edit","update","delete","form"
		if(action==null || action.equals("list")){//1.���� ��Ϻ���
		  String pageStr = req.getParameter("page"); 
		  int page;
		  if(pageStr==null){
			  page=1;
		  }else{
		      page= Integer.parseInt(pageStr);
		  }
		  /*
		      ��������(�� ȭ��)�� ������ ���ڵ� �� : recordCount
		      ��ü ���ڵ� ��: totalRecord
		      ��ü ������ ��: totalPage
		  */
		  BoardInfoDao dao = new BoardInfoDao();
		  
		  int recordCount=20;
		  int totalRecord = dao.selectCount();
		  int totalPage = totalRecord/recordCount;
		  if(totalRecord%recordCount>0){
			  totalPage++;
		  }
		  
		  List<BoardInfo> list = dao.selectPage(page,recordCount);
		  List<ReplyInfo> replyList = dao.selectReply(page,recordCount);
		  
		  req.setAttribute("list", list);	
		  req.setAttribute("replyList", replyList);	
		  req.setAttribute("page", page);
		  req.setAttribute("totalPage", totalPage);
		  
		  req.getRequestDispatcher("/jsp/board/board_main.jsp").forward(req, resp);//4.
		  
	   }else if(action.equals("inputForm")){//1.�Է��� ��û
		  req.getRequestDispatcher("/jsp/board/inputForm.jsp").forward(req, resp);//4.
		
		  
	   }else if(action.equals("edit")){//1.������ ��û
		  String board_no_str = req.getParameter("board_no");
		  int board_no = Integer.parseInt(board_no_str);
		   
		  BoardInfoDao dao = new BoardInfoDao();//3. 
		   BoardInfo board = dao.select(board_no);
		   		board.setBoard_no(board_no);
		   /*HttpSession session = req.getSession(); 
		     session.setAttribute("guest", guest);*/
		     req.getSession().setAttribute("board", board);
		     
		  req.getRequestDispatcher("/jsp/board/editForm.jsp").forward(req, resp);//4.		   
	   }else if(action.equals("insert")){//1. �Է°��� ���� DB���� ��û
	  
		   BoardInfo board = new BoardInfo();
		   board.setMember_id((String)req.getSession().getAttribute("login"));//2.
		   board.setBoard_title(req.getParameter("title"));
		   board.setBoard_text(req.getParameter("text"));
		   
		   BoardInfoDao dao = new BoardInfoDao();//3.
		  
		   if(dao.insert(board)){ 
			   resp.sendRedirect("/k153p2/board.do");
		   }
		   
	   }else if(action.equals("update")){//������û
		   BoardInfo board = new BoardInfo();
		      String board_no = req.getParameter("boardno");
		      
		      board.setBoard_no(Integer.parseInt(board_no));//2.
		      board.setBoard_title(req.getParameter("title"));
		      board.setBoard_text(req.getParameter("text"));
		      board.setMember_id((String)req.getSession().getAttribute("login"));
		   
		      BoardInfoDao dao = new BoardInfoDao();
		   if(dao.update(board)){
			   resp.getWriter().write("1");
		   }else{
			   resp.getWriter().write("0");
		   }
		   
	   }else if(action.equals("delete")){//�ۻ��� ��û
		   String board_no =   req.getParameter("board_no");
		   String member_id = (String)req.getSession().getAttribute("login");
		   
		   BoardInfoDao dao = new BoardInfoDao();
		   if (dao.delete(board_no, member_id)) {//��������
			   resp.getWriter().write("1");
		 
		   }else{
			   resp.getWriter().write("0");
			   
		   }
	   }
	}//service
	
	
	
	
}




