package com.kosta.k153p2.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.kosta.k153p2.dto.StoreInfo;

import iba.conf.MySqlMapClient;

public class StoreInfoDao {
	SqlMapClient sqlMap;
	
	public StoreInfoDao() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	public List<StoreInfo> select_store(String location, String selStore){
		List<StoreInfo> list = null;
		Map<String, String> selMap = new HashMap<>(); 
		selMap.put("location", location);
		selMap.put("selStore", selStore);
		try {
			list = sqlMap.queryForList("store.selectStore", selMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
