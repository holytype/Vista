package shop.mall.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.mall.common.mybatis.MybatisTemplate;
import shop.mall.model.dao.MainDao;


public class MainService {
	MainDao dao = new MainDao();
	public List<String> getCategory(){
		SqlSession session = MybatisTemplate.getSqlSession(true);
		List<String> result = dao.getCategory(session);
		session.close();
		return result;
	}
	
	public void writeLog(String ip){
		SqlSession session = MybatisTemplate.getSqlSession(true);
		dao.writeLog(session, ip);
		session.close();
		return;
	}
}
