package com.kosta.k153p2.idcheck.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.conf.MySqlMapClient;

public class IdCheckDAO {

	SqlMapClient smc;

	public IdCheckDAO() {
		smc = MySqlMapClient.getSqlMapInstance();
	}
	
	public String idCheck(String id){//ȸ�����Խ� ����ڰ� �Է��� ���̵�
		try {
			String result=(String) smc.queryForObject("idCheck",id);
			if(result!=null){//�ߺ��� ���̵� ����
				return "duple";
			}else{//�ߺ��� ���̵� ������
				return "success";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "sqlerror";
		}
	}

}
