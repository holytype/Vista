package shop.mall.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dao.AddrDao;
import shop.mall.model.dto.MemberAddressDto;

import static shop.mall.common.mybatis.MybatisTemplate.*;

public class AddrService {
	AddrDao dao = new AddrDao();
	
	// memId로 배송지 불러오기
	public List<MemberAddressDto> getAddr(String id) {
		List<MemberAddressDto> result = null;
		SqlSession session=getSqlSession(true);
		result = dao.getAddr(session, id);
		session.close();
		return result;
	}
	// dto로 배송지 입력하기
	public Integer insertAddr(List<MemberAddressDto> dto, String id) {
		Integer result = null;
		Integer result2 = null;
		SqlSession session=getSqlSession(false);
		result=dao.deleteAddr(session, id);
		result2 = dao.insertAddr(session, dto);
		
		if(dto.size()==result2) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result2;
	}
	// daId로 배송지 삭제하기
//	public Integer deleteAddr(String id) {
//		Integer result = null;
//		result = dao.deleteAddr(getSqlSession(true), id);
//		return result;
//	}
	
	// 고정 배송지 수정하기
	public Integer updateAddrPin(MemberAddressDto dto) {
		Integer result = null;
		Integer result2 = null;
		SqlSession session = getSqlSession(false);
		result2=dao.deleteAddrPin(session, dto.getMemId());
		result = dao.updateAddrPin(session, dto);

		if(result==1) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}
}
