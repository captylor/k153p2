package com.kosta.k153p2.store.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.store.dto.AddrInfo;

import iba.conf.MySqlMapClient;

public class AddrInfoDao {
	SqlMapClient sqlMap;

	public AddrInfoDao() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}

	public List<String> selectSido() {
		List<String> list = null;
		try {
			list = sqlMap.queryForList("zip.selectSido");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<AddrInfo> select_all() {
		List<AddrInfo> addrList = null;
		try {
			addrList = sqlMap.queryForList("zip.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addrList;
	}

	public List<AddrInfo> addrSearch(String location) {// 매장검색 출력 주소(지역명 받아서)
		List<AddrInfo> addrList = null;
		try {
			addrList = sqlMap.queryForList("zip.selectAddr", location);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return addrList;
	}

	public AddrInfo addrStoreNo(int store_no) {// store_no 값을 받아서 주소 출력
		AddrInfo addrInfo = null;

		try {
			addrInfo = (AddrInfo) sqlMap.queryForObject("zip.selectStoreNo", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addrInfo;
	}
}
