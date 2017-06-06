package com.kosta.k153p2.order.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.MySqlMapClient;

public class OrderDAO {
	SqlMapClient sqlMap;
	
	
	public OrderDAO() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	
}
