package com.kosta.k153p2.admin.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.admin.dto.OrderInfo;

import iba.conf.MySqlMapClient;

public class OrderInfoDao {
	SqlMapClient sqlMap;
	
	public OrderInfoDao(){
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	public boolean insert(OrderInfo order){
		 try {
			sqlMap.insert("order.insert",order);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	   }//insert
	   
	   public boolean update(OrderInfo order){
		 try {
			int t = sqlMap.update("order.update",order);//t: ������ ���� ����
			 if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;  
	   }//update
	   
	   
	   public boolean delete(int order_no){//Ư�� �� �� ����
		   
		   try {
			int t=sqlMap.delete("order.delete",order_no);
			   if(t==1) return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		   
		 return false;  
	   }
	   public OrderInfo select(int order_no){//�������� ����� ������
		 OrderInfo order=null;
		try {
			order = (OrderInfo) sqlMap.queryForObject("order.select",order_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return order;
	   }//select
	   
	   /*public List<Guest> selectAll(){//list�� ����� ������
		  List<Guest> list=null;
		try {
			list = sqlMap.queryForList("guest.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}	  
		  return list;
	   }//selectAll
*/}
