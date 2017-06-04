package com.kosta.k153p2.board.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.kosta.k153p2.board.dto.BoardInfo;

import iba.conf.MySqlMapClient;

public class BoardInfoDao {// DB���� ����Ŭ����
	SqlMapClient sqlMap;

	public BoardInfoDao() {
		sqlMap = MySqlMapClient.getSqlMapInstance();
	}

	public boolean insert(BoardInfo board) {// ���� ����
		try {
			sqlMap.insert("boardinfo.insert", board);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// insert

	public boolean update(BoardInfo board) {// ���� ����
		try {
			int t = sqlMap.update("boardinfo.update", board);// t: ������ ����
																// ����
			if (t == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// update

	public boolean delete(int board_no) {// Ư�� �� �� ����
		try {
			sqlMap.delete("boardinfo.delete_child", board_no);// t: ������ ��
																// ����
			int t = sqlMap.delete("boardinfo.delete", board_no);// t: ������ ��
																// ����
			if (t == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}// delete

	public BoardInfo select(int board_no) {// �������� ����� ������
		BoardInfo guest = null;
		try {
			guest = (BoardInfo) sqlMap.queryForObject("boardinfo.select", board_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return guest;
	}// select

	public List<BoardInfo> selectAll() {// list�� ����� ������
		List<BoardInfo> list = null;
		try {
			list = sqlMap.queryForList("boardinfo.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// selectAll

	public List<BoardInfo> selectPage(int page, int recordCount) {// list��
																	// �����
																	// ������
		int end = page * recordCount;// page*10;
		int start = end - (recordCount - 1);// end-9;
		/*
		 * page start end 1������ : 1 10 2������ : 11 20 3������ : 21 30 4������
		 * : 31 40 end-9 page*10
		 */
		List<BoardInfo> list = null;
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);

			list = sqlMap.queryForList("boardinfo.selectPage", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}// selectPage

	public int selectCount() {
		int count = 0;
		try {
			count = (Integer) sqlMap.queryForObject("boardinfo.count");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}// selectCount

	public String selPass(int board_no){
		String pw= "";
		try {
			pw = (String) sqlMap.queryForObject("boardinfo.selPass", board_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pw;
	}
}// selectCount
