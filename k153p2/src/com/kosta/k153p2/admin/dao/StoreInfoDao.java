package com.kosta.k153p2.admin.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
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
			int t = sqlMap.update("store.update", store);// t: ������ ���� ����
			if (t == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// update

	public boolean delete(int store_no) {// Ư�� �� �� ����

		try {
			int t = sqlMap.delete("store.delete", store_no);
			if (t == 1)
				return true;
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return false;
	}

	public StoreInfo select(int store_no) {// �������� ����� ������
		StoreInfo store = null;
		try {
			store = (StoreInfo) sqlMap.queryForObject("store.select", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return store;
	}// select

	public int sel_count_owner(String ownerid) {// 지점장이 가지고 있는 지점의 갯수는 1개로 고정
		int countOwner = 0;
		try {
			countOwner = (int) sqlMap.queryForObject("store.sel_count_owner", ownerid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countOwner;
	}// select
}
