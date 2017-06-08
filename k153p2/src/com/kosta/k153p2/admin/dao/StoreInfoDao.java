package com.kosta.k153p2.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.admin.dto.Item_Stock;
import com.kosta.k153p2.admin.dto.StoreInfo;

import iba.conf.MySqlMapClient;

public class StoreInfoDao {
	SqlMapClient sqlMap;

	public StoreInfoDao() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}

	public boolean insert(StoreInfo store) {
		try {
			sqlMap.insert("store.insert", store);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// insert

	public boolean update(StoreInfo store) {
		try {
			int t = sqlMap.update("store.update", store);
			if (t == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// update

	public boolean delete(int store_no) {

		try {
			int t = sqlMap.delete("store.delete", store_no);
			if (t == 1)
				return true;
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return false;
	}

	public StoreInfo select(int store_no) {
		StoreInfo store = null;
		try {
			store = (StoreInfo) sqlMap.queryForObject("store.select", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return store;
	}// select

	public int sel_count_owner(String ownerid) {// 지점장이 가지고 있는 지점의 갯수는 1개로 고정
		int countOwner = 0;// 해당 아이디가 가지고 있는 지점의 갯수
		try {
			countOwner = (int) sqlMap.queryForObject("store.sel_count_owner", ownerid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countOwner;
	}// select

	public StoreInfo sel_myStore(String ownerid) {// 소유자를 통한 지점 검색
		StoreInfo store = null;
		try {
			store = (StoreInfo) sqlMap.queryForObject("store.sel_myStore", ownerid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return store;
	}// select

	public boolean insert_init_stock(int store_no, int item_no) {
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("store_no", store_no);
			map.put("item_no", item_no);
			sqlMap.insert("store.insert_init_stock", map);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// insert_init_stock

	public int sel_STOREINFO_SEQ() {
		int seq = 0;
		try {
			seq = (int) sqlMap.queryForObject("store.sel_STOREINFO_SEQ");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seq;
	}// sel_STOREINFO_SEQ

	
	public List<Item_Stock> sel_crr_stock(String id) {
		List<Item_Stock> list = null;
		try {
			list = sqlMap.queryForList("store.sel_crr_stock",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//sel_crr_stock
	
	public List<String> sel_All_Type(){
		List<String> list = null;
		try {
			list = sqlMap.queryForList("store.sel_All_Type");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//sel_All_Type
}
