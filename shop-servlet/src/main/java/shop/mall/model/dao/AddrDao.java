package shop.mall.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dto.MemberAddressDto;

public class AddrDao {
	public List<MemberAddressDto> getAddr(SqlSession session, String id) {
		return session.selectList("addr.getAddr",id);
	}
	public Integer insertAddr(SqlSession session, List<MemberAddressDto> dto) {
		return session.insert("addr.insertAddr", dto);
	}
	public Integer deleteAddr(SqlSession session, List<String> dto) {
		return session.delete("addr.deleteAddr", dto);
	}
	public Integer updateAddrPin(SqlSession session, String id) {
		return session.update("addr.deleteAddr", id);
	}
	public Integer deleteAddrPin(SqlSession session, String id) {
		return session.update("addr.deleteAddr", id);
	}
}
