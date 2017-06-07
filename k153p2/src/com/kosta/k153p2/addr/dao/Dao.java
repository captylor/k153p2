package com.kosta.k153p2.addr.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.MySqlMapClient;

public class Dao {
	SqlMapClient smc;

	public Dao() {
		smc = MySqlMapClient.getSqlMapInstance();
	}

	public List<String> selectSido() {
		List<String> list = null;
		try {
			list = smc.queryForList("addr.selectSido");
			System.out.println("찾아온 시도 갯수 : " + list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<String> selectGugun(String sido) {
		List<String> list = null;
		try {
			list = smc.queryForList("addr.selectGugun",sido);
			System.out.println("찾아온 시도 갯수 : " + list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<String> selectDong(String sido) {
		List<String> list = null;
		try {
			list = smc.queryForList("addr.selectGugun",sido);
			System.out.println("찾아온 시도 갯수 : " + list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
