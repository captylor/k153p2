package com.kosta.k153p2.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.dto.AddrInfo;

import iba.conf.MySqlMapClient;

public class AddrInfoDao {
	SqlMapClient sqlMap;
	
	public AddrInfoDao() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	//����¡ ��ü addr���� ��������
	public List<AddrInfo> select_pageAll(int page, int recordCount){
		int end = page*recordCount;//page*5;
		int start = end-(recordCount-1);//end-4;
		
		List<AddrInfo> list = null;
		
		try {
			Map<String, Integer> map = new HashMap<>();
			  map.put("start", start);
			  map.put("end", end);
			  
			list = sqlMap.queryForList("zip.selectPageAll", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public List<AddrInfo> select_all(){
		List<AddrInfo> addrList = null;
		try {
			addrList = sqlMap.queryForList("zip.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addrList;
	}
	public List<AddrInfo> addrSearch(String location){//����˻� ��� �ּ�(������ �޾Ƽ�)
		List<AddrInfo> addrList = null;
		try {
			addrList = sqlMap.queryForList("zip.selectAddr", location);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return addrList;
	}
	public AddrInfo addrStoreNo(int store_no){//store_no ���� �޾Ƽ� �ּ� ���
		AddrInfo addrInfo = null;
		
		try {
			addrInfo = (AddrInfo) sqlMap.queryForObject("zip.selectStoreNo", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addrInfo;
	}
}
