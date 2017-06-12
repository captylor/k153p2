package com.kosta.k153p2.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.dto.ItemInfo;

import iba.conf.MySqlMapClient;

public class ItemInfoDao {
	SqlMapClient smc;

	public ItemInfoDao() {
		smc = MySqlMapClient.getSqlMapInstance();
	}

	public List<ItemInfo> selectAll() {//��ü ������ �˻�
		List<ItemInfo> list = null;
		try {
			list = smc.queryForList("product.selectAll");
			//System.out.println("ã�ƿ� ������ : " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ItemInfo> selectMenu(int sideMenu) {//���̵� �޴��� ���� ��ü �˻�
		List<ItemInfo> list = null;
		try {
			list = smc.queryForList("product.selMenu",sideMenu);
			//System.out.println("ã�ƿ� ������ : " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ItemInfo selEachProduct(int id){//������ �������� ����
		ItemInfo info=null;
		try {
			info = (ItemInfo) smc.queryForObject("product.eachItem",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return info;
	}
	
	public int selectCount(int sideM){//���̵� �޴��� ���� ��ü �˻�
		int count=0;
		try {
			count= (Integer) smc.queryForObject("product.count",sideM);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public List<ItemInfo> selectPage(int page,int recordCount,int sideM) {// ����¡
		List<ItemInfo> list = null;
		int end = page * recordCount;
		int start = end - recordCount-1;
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("sideM", sideM);
			list = smc.queryForList("product.selectPage", map);
			//System.out.println("ã�ƿ�  ������ ������ : " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ItemInfo> selectNoNameType() {//id,name�� �˻�
		List<ItemInfo> list = null;
		try {
			list = smc.queryForList("product.selectNoNameType");
			//System.out.println("ã�ƿ� ������ : " + list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
