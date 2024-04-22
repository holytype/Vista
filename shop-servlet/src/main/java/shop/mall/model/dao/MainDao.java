package shop.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class MainDao {
	public List<String> getCategory(SqlSession session){
		List<String> result = null;
		result=session.selectList("manage.getMenuCategory");
		return result;
	}
	
	public void writeLog(SqlSession session, String ip){
		Integer result = null;
		result= session.insert("manage.writeLog",ip);
		System.out.println(result);
	}
}
