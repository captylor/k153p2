package com.kosta.k153p2.login.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.login.dto.MemberInfo;

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
	
	public boolean selectLogin(String id,String pass){
		Map<String, String> map = new HashMap<>();
		map.put("member_id", id);
		map.put("member_pass", pass);
		try {
			int t = (int) sqlMap.queryForObject("happyCafe.selectlogin",map);
			if(t==1) return true;  //1--> id,pass ��ġ! �α��μ���!
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//selectlogin
	
	public MemberInfo selectinfo(String id){
		MemberInfo member = new MemberInfo();
		try {
			member = (MemberInfo) sqlMap.queryForObject("happyCafe.selectinfo",id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}//select
	
	public boolean checkId(String id){
		try {
			int t = (int) sqlMap.queryForObject("happyCafe.checkid", id);
			if(t==1) return true; //true�̸� ���� id  ����!!
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		//���� id�� ����!!
	}


	
	
}
