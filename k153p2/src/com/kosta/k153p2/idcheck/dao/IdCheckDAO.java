package com.kosta.k153p2.idcheck.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.MySqlMapClient;

public class IdCheckDAO {

	SqlMapClient smc;

	public IdCheckDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}
	
	public String idCheck(String id){//회원가입시 사용자가 입력한 아이디
		try {
			String result=(String) smc.queryForObject("idCheck",id);
			if(result!=null){//중복된 아이디가 있음
				return "duple";
			}else{//중복된 아이디가 없을때
				return "success";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "sqlerror";
		}
	}

}
