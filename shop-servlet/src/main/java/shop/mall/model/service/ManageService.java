package shop.mall.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dao.ManageDao;
import shop.mall.model.dto.ItemBoardFileDto;

import static shop.mall.common.mybatis.MybatisTemplate.*;

public class ManageService {
	private ManageDao dao = new ManageDao();
	
	public Integer setBannerImage(List<ItemBoardFileDto> dto){
		Integer result = null;
		Integer r=null;
		SqlSession session = getSqlSession(false);
		r=dao.deleteBannerImage(session);
		result = dao.setBannerImage(session, dto);
		if(result==dto.size()) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
	public List<ItemBoardFileDto> getBannerImage(){
		List<ItemBoardFileDto> result = null;
		SqlSession session = getSqlSession(false);
		result = dao.getBannerImage(session);
		session.close();
		return result;
	}
	
	public Integer setUnderBannerImage(List<ItemBoardFileDto> dto){
		Integer result = null;
		Integer r=null;
		SqlSession session = getSqlSession(false);
		r=dao.deleteUnderBannerImage(session);
		result = dao.setUnderBannerImage(session, dto);
		if(result==dto.size()) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
	public List<ItemBoardFileDto> getUnderBannerImage(){
		List<ItemBoardFileDto> result = null;
		SqlSession session = getSqlSession(false);
		result = dao.getUnderBannerImage(session);
		session.close();
		return result;
	}
	
	public Integer setCategory(List<String> dto) {
		Integer result = null;
		SqlSession session = getSqlSession(true);
		dao.deleteCategory(session);
		result=dao.setCategory(session, dto);
		session.close();
		return result;
	}
}
