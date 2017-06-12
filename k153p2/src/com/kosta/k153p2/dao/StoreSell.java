package com.kosta.k153p2.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.dto.ItemInfo;
import com.kosta.k153p2.dto.ItemTypeInfo;
import com.kosta.k153p2.dto.OrderInfo;
import com.kosta.k153p2.dto.StockInfo;

import iba.conf.MySqlMapClient;

public class StoreSell {
	SqlMapClient sqlMap;	
	
	   public StoreSell() {
		   sqlMap = MySqlMapClient.getSqlMapInstance();
	   }
	   
	   public List<ItemInfo> selectItem(String memberid){
		   
		   List sellItem = new ArrayList<Integer>();
		   List list = new ArrayList<ItemInfo>();
		   List allList = new ArrayList<ItemInfo>();
		   try {
			   sellItem = itemHex2Int((String)sqlMap.queryForObject("storesell.selectItem", memberid));
			   allList = sqlMap.queryForList("storesell.selectAll");
			   for(int i=0; i<sellItem.size(); i++){
				   list.add(allList.get((int)sellItem.get(i)-1));
			   }
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		   return list;
	   }
	   
	   public List<Integer> itemHex2Int(String itemHex){
		   List sellItem = new ArrayList<Integer>();
		   String bin="";
		   String[] hex2bin = {"0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"};
		   int hex2int;
		   String hex;
		   for (int i = 0; i < itemHex.length(); i++) {
			   hex = itemHex.substring(i, i+1);
			   hex2int = Integer.parseInt(hex, 16);
			   bin = hex2bin[hex2int];
			   for(int j=0; j<4; j++){
				   if(bin.substring(j, j+1).equals("1")){
					   sellItem.add(4*i+j+1);
				   }
			   }
		}
		return sellItem;
	   }
	   
	   public List<ItemTypeInfo> selectAll2(){
		   try {
			return sqlMap.queryForList("storesell.selectAll2");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		   return null;
	   }
	   
	   public List<StockInfo> selectAll3(String member_id){
		   try {
			return sqlMap.queryForList("storesell.selectAll3", member_id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		   return null;
	   }
	   
	   public void minusStock(String item_no, String member_id){
	   	try {
	   		Map<String, String> map = new HashMap<>();
	   		map.put("member_id", member_id);
	   		map.put("item_no", item_no);
	   		sqlMap.update("storesell.minusStock", map);
	   		} catch (SQLException e) {
				e.printStackTrace();
			}
	   }
	   
	   public List<OrderInfo> buyBoardPazing(int page, int recordCount, String member_id){
		   int end = page*recordCount;//page*10;
		   int start = end-(recordCount-1);//end-9;
		   
		   List<OrderInfo> list = new ArrayList<>();
		   Map<String, String> map = new HashMap<>();
		   map.put("member_id", member_id);
		   map.put("start", start+"");
		   map.put("end", end+"");
		   try {
			   return list = sqlMap.queryForList("storesell.buyBoardPazing", map);
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }	  
		   return null;
	   }
	   
	   public int orderinfoCount(String member_id){
			try {
				return (int)sqlMap.queryForObject("storesell.orderinfoCount", member_id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
	   }
	   
	   public List<OrderInfo> order_notHandled(String member_id){
		   List<OrderInfo> list = new ArrayList<>();
		   Map map = new HashMap<>();
		   map.put("order_handle", "πÃ√≥∏Æ");
		   map.put("member_id", member_id);
		   try {
			   list = sqlMap.queryForList("storesell.order_notHandled", map);
			   return list;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		   return null;
	   }
}//class
