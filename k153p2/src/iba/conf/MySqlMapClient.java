package iba.conf;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class MySqlMapClient {
	private static final SqlMapClient sqlmap;
	static{
		try {
			String resource = "./iba/conf/sqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlmap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("MySqlMapConfig 초기화 중 에러" + e);
		}
	}
	
	public static SqlMapClient getSqlMapInstance(){
		return sqlmap;
	}
}
