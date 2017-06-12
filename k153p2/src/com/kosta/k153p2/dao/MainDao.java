package com.kosta.k153p2.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.dto.BoardInfo;
import com.kosta.k153p2.dto.ItemInfo;

import iba.conf.MySqlMapClient;

public class MainDao {
	SqlMapClient sqlMap;	
	
	   public MainDao() {
		   sqlMap = MySqlMapClient.getSqlMapInstance();
	   }
	   
	   public List<ItemInfo> selectTOP(){
		   List list = new ArrayList<ItemInfo>();
		   
		   try {
			   list = sqlMap.queryForList("main.selectTOP");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		   return list;
	   }
	   
	   public void updateGrade(String member_id, String member_grade){
		   Map<String, String> map = new HashMap<>();
		   map.put("member_grade", member_grade);
		   map.put("member_id", member_id);
		   try {
			   sqlMap.update("main.updateGrade", map);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	   }
}
