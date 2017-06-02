package com.kosta.k153p2.product.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.product.dto.ItemInfo;

import iba.conf.MySqlMapClient;

public class ItemInfoDao {
	SqlMapClient smc;

	public ItemInfoDao() {
		smc = MySqlMapClient.getSqlMapInstance();
	}

	public List<ItemInfo> selectAll() {//전체 아이템 검색
		List<ItemInfo> list = null;
		try {
			list = smc.queryForList("product.selectAll");
			System.out.println("찾아온 사이즈 : " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ItemInfo> selectMenu(int sideMenu) {//사이드 메뉴에 따른 전체 검색
		List<ItemInfo> list = null;
		try {
			list = smc.queryForList("product.selMenu",sideMenu);
			System.out.println("찾아온 사이즈 : " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ItemInfo selEachProduct(int id){//각각의 아이템의 정보
		ItemInfo info=null;
		try {
			info = (ItemInfo) smc.queryForObject("product.eachItem",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return info;
	}
	
	public int selectCount(int sideM){//사이드 메뉴에 따른 전체 검색
		int count=0;
		try {
			count= (Integer) smc.queryForObject("product.count",sideM);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public List<ItemInfo> selectPage(int page,int recordCount,int sideM) {// 페이징
		List<ItemInfo> list = null;
		int end = page * recordCount;
		int start = end - recordCount-1;
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("sideM", sideM);
			list = smc.queryForList("product.selectPage", map);
			System.out.println("찾아온  페이지 사이즈 : " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ItemInfo> selectNoNameType() {//id,name만 검색
		List<ItemInfo> list = null;
		try {
			list = smc.queryForList("product.selectNoNameType");
			System.out.println("찾아온 사이즈 : " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
