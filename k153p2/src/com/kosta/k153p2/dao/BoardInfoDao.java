package com.kosta.k153p2.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.dto.BoardInfo;
import com.kosta.k153p2.dto.ReplyInfo;

import iba.conf.MySqlMapClient;

public class BoardInfoDao {//DB접근 전담클래스
   SqlMapClient sqlMap;	
	
   public BoardInfoDao() {
	   sqlMap = MySqlMapClient.getSqlMapInstance();
   }
   
   public boolean insert(BoardInfo board){//방명록 쓰기
	 try {
		sqlMap.insert("boardinfo.insert",board);
		return true;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	 return false;
   }//insert
   
   public boolean update(BoardInfo board){//방명록 수정
	   try {
		   int t = sqlMap.update("boardinfo.update", board);//t: 수정된 행의 갯수
		   if(t==1) return true;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	 return false;  
   }//update
   
   
   public boolean delete(String board_no, String member_id){//특정 한 행 삭제
	   Map<String, String> map = new HashMap<>();
	   map.put("board_no", board_no);
	   map.put("member_id", member_id);
	   try {
		 sqlMap.delete("boardinfo.delete_child", map);
		 int t = sqlMap.delete("boardinfo.delete", map);
		 if(t==1) return true;
	 } catch (SQLException e) {
		e.printStackTrace();
	 }
	 	return false;  
   }//delete
   
   public BoardInfo select(int board_no){//수정폼에 출력할 데이터
	   BoardInfo guest=null;
	try {
		guest = (BoardInfo) sqlMap.queryForObject("boardinfo.select",board_no);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	 return guest;
   }//select
   
   public List<BoardInfo> selectAll(){//list에 출력할 데이터
		  List<BoardInfo> list=null;
		try {
			list = sqlMap.queryForList("boardinfo.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}	  
		  return list;
	   }//selectAll
	   
	   public List<BoardInfo> selectPage(int page, int recordCount){//list에 출력할 데이터
		    int end = page*recordCount;//page*10;
		    int start = end-(recordCount-1);//end-9;
		   /*
		       page    start     end
		      1페이지 :    1       10
		      2페이지 :   11       20
		      3페이지 :   21       30
		      4페이지 :   31       40
		               end-9    page*10	      
		    */
		   List<BoardInfo> list=null;
		   try {
			   Map<String, Integer> map = new HashMap<>();
			      map.put("start", start);
			      map.put("end", end);
			      
			   list = sqlMap.queryForList("boardinfo.selectPage", map);
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }	  
		   return list;
	   }//selectPage
	   
	   public int selectCount(){
		  int count=0; 
		   try {
			count = (Integer)sqlMap.queryForObject("boardinfo.count");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  return count;
	   }//selectCount
	   
	   public List<ReplyInfo> selectReply(int page, int recordCount){
		   int end = page*recordCount;
		   int start = end-(recordCount-1);
		   Map<String, Integer> map = new HashMap<>();
		   map.put("start", start);
		   map.put("end", end);
		   try {
			   return sqlMap.queryForList("boardinfo.selectReply", map);
		   } catch (SQLException e) {
				e.printStackTrace();
		   }
		   
		   return null;
	   }

   }//selectCount



