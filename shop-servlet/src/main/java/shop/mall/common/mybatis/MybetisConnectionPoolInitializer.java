package shop.mall.common.mybatis;

import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybetisConnectionPoolInitializer implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContextListener.super.contextInitialized(sce);
		try {
//			sce.getServletContext().setAttribute("sqlSessionFactory",
//			new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis/mybatis-config.xml")));
			SqlSession session =new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis/mybatis-config.xml")).openSession(true);
			session.selectOne("member.idDuplicateCheck","12");
			session.close();
			System.out.println("contextInitialized");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
