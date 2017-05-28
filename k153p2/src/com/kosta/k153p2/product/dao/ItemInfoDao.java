package com.kosta.k153p2.product.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.product.dto.ItemInfo;

import iba.conf.MySqlMapClient;

public class ItemInfoDao {
	SqlMapClient smc;

	public ItemInfoDao() {
		smc = MySqlMapClient.getSqlMapInstance();
	}

	public List<ItemInfo> selectAll() {
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
	
	public List<ItemInfo> selectMenu(int sideMenu) {
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
	
	public ItemInfo selEachProduct(int id){
		ItemInfo info=null;
		try {
			info = (ItemInfo) smc.queryForObject("product.eachItem",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return info;
	}
}
