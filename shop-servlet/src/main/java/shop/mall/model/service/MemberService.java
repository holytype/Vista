package shop.mall.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import shop.mall.common.mybatis.MybatisTemplate;
import shop.mall.model.dao.MemberDao;
import shop.mall.model.dto.MemberDto;
import shop.mall.model.dto.MemberInfoDto;
import shop.mall.model.dto.MemberLoginDto;


public class MemberService {
	MemberDao dao = new MemberDao();

	// 로그인
	public MemberInfoDto memberLogin(MemberLoginDto dto, String ip) {
		SqlSession session = MybatisTemplate.getSqlSession(true);
		MemberInfoDto result = null;
		
		// 멤버테이블에 해당 아이디와 비밀버호와 일치하는 행이 있는지 확인
		// 이름 권환 반환
		Map<String,String> data = dao.memberLogin(session, dto);
		if(data==null)return result;
		
		// 로그에 기록
		// 기록 시간 반환
		String time = dao.memberLoginLog(session, new MemberInfoDto(dto.getMemId(), ip));
		
		session.close();
		
		// memberinfoDto 생성 후 반환
		return new MemberInfoDto(dto.getMemId(), data.get("name"), data.get("auth"), time, ip);
		
	}

	// 아이디 중복 체크
	public Integer idDuplicateCheck(String mId) {
		Integer result = null;
		
		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = dao.idDuplicateCheckMybatis(session, mId);
		session.close();
		return result;
	}

	// 회원가입
	public Integer registMember(MemberDto dto) {
		Integer result = null;

		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = dao.registMember(session, dto);
		session.close();
		
		return result;
	}

}
