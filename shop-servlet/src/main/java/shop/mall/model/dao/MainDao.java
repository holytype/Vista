package shop.mall.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class MainDao {
	
	// 메인 페이지 접속시 사이드 메뉴 카테고리를 불러옵니다.
	public List<String> getCategory(SqlSession session){
		List<String> result = null;
		result=session.selectList("manage.getMenuCategory");
		return result;
	}
	
	// 서버 접속시 필터에서 ip기록을 확인 하여 로그를 기록합니다.
	// 현재 시간으로부터 1일이 되지 않을 경우 기록되지 않습니다.
	public void writeLog(SqlSession session, String ip){
		Integer result = null;
		result=session.selectOne("manage.checkLog",ip);
		
		if(result==null || result >= 1) {
			session.insert("manage.writeLog",ip);
			return;
		}
		return;
	}
}
