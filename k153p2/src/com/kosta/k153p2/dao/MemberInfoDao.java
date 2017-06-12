package com.kosta.k153p2.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.kosta.k153p2.dto.MemberInfo;
import iba.conf.MySqlMapClient;

public class MemberInfoDao {
	SqlMapClient sqlMap;
	
	public MemberInfoDao() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}
	
	public boolean insert(MemberInfo member){
		try {
			sqlMap.insert("member.insert", member);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//insert
	
	public boolean update(MemberInfo member){
		try {
			int t = sqlMap.update("member.update",member);
			if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//update
	
	public boolean delete(String id){
		try {
			int t = sqlMap.delete("member.delete",id);
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
			int t = (int) sqlMap.queryForObject("member.selectlogin",map);
			if(t==1) return true;  //1--> id,pass 일치! 로그인성공!
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//selectlogin
	
	public MemberInfo selectinfo(String id){
		MemberInfo member = new MemberInfo();
		try {
			member = (MemberInfo) sqlMap.queryForObject("member.selectinfo",id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}//select
	
	public boolean checkId(String id){
		try {
			int t = (int) sqlMap.queryForObject("member.checkid", id);
			if(t==1) return true; //true이면 같은 id  있음!!
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		//같은 id가 없음!!
	}

	public String selectGrade(String id){
		try {
			return (String)sqlMap.queryForObject("member.selectGrade", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}//class
