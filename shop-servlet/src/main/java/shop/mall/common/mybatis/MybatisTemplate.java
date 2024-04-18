package shop.mall.common.mybatis;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisTemplate {
	public static SqlSession getSqlSession(boolean autoCommit) {
		SqlSession sqlSession = null;
		try {
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis/mybatis-config.xml"));
			sqlSession = sqlSessionFactory.openSession(autoCommit);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSession;
	}
}
