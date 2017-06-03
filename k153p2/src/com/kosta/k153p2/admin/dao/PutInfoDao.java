package com.kosta.k153p2.admin.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.admin.dto.PutInfo;

import iba.conf.MySqlMapClient;

public class PutInfoDao {
	 SqlMapClient sqlMap;	
	 
	 public PutInfoDao(){
		 sqlMap = MySqlMapClient.getSqlMapInstance();
	   }
	
	 public boolean insert(PutInfo put){//���� ����
		 try {
			sqlMap.insert("put.insert",put);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	   }//insert
	   
	   public boolean update(PutInfo put){//���� ����
		 try {
			int t = sqlMap.update("put.update",put);//t: ������ ���� ����
			 if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;  
	   }//update
	   
	   
	   public boolean delete(int put_no){//Ư�� �� �� ����
		   
		   try {
			int t=sqlMap.delete("put.delete",put_no);
			   if(t==1) return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		   
		 return false;  
	   }
	   public PutInfo select(int put_no){//�������� ����� ������
		 PutInfo put=null;
		try {
			put = (PutInfo) sqlMap.queryForObject("put.select",put_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return put;
	   }//select
	 
}
