package com.kosta.k153p2.init2.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.kosta.k153p2.init2.dto.MemberInfo;
import iba.conf.MySqlMapClient;

public class MemberInfoDAO {
	SqlMapClient sqlMap;
	
	
	public MemberInfoDAO() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}

	
	
	public boolean insert(MemberInfo member){
		try {
			sqlMap.insert("happyCafe.insert", member);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//insert
	
	public boolean update(MemberInfo member){
		try {
			int t = sqlMap.update("happyCafe.update",member);
			if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//update
	
	public boolean delete(String id){
		try {
			int t = sqlMap.delete("happyCafe.delete",id);
			if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//delete
	
	public MemberInfo selectLogin(String id){
		MemberInfo member = null;
		try {
			member = (MemberInfo) sqlMap.queryForObject("happyCafe.selectlogin",id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}//select
	
	public boolean checkId(String id){
		try {
			int t = (int) sqlMap.queryForObject("happyCafe.checkid", id);
			if(t==1) return true; //true이면 같은 id  있음!!
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		//같은 id가 없음!!
	}


	
	
}
