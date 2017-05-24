package iba.conf;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

/**
 * @author kosta
 * @서문: SqlMapConfig.xml(sql문응ㄹ 포함한 xml등록)문서를 객체화 시켜주는 클래스
 * @ㅁ ★ SqlMapClient클래스 : XML에 작성된 SQL문을 호출.
 */
public class MySqlMapClient {
	private static final SqlMapClient sqlMap;
	static {
		try {
			String resource = "./iba/conf/sqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("MySqlMapConfig 초기화중 에러" + e);
		}
	}

	public static SqlMapClient getSqlMapInstance() {
		return sqlMap;
	}
}
