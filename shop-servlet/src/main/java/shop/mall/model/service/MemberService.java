package shop.mall.model.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import shop.mall.common.mybatis.MybatisTemplate;
import shop.mall.model.dao.MemberDao;
import shop.mall.model.dto.MemberDto;
import shop.mall.model.dto.MemberInfoDto;
import shop.mall.model.dto.MemberLoginDto;

import static shop.mall.common.jdbc.JdbcTemplate.*;

public class MemberService {
	MemberDao dao = new MemberDao();

	// 로그인
	public MemberInfoDto memberLogin(MemberLoginDto dto, String ip) {
		/*
		 * MemberInfoDto result = null; Connection conn = getConnection(true);
		 * Map<String, Object> data = dao.memberLogin(conn, dto); if (data != null) {
		 * dao.WriteLog(conn, data, ip); } close(conn);
		 */
		MemberInfoDto result = null;
		SqlSession session = MybatisTemplate.getSqlSession(true);
		List<MemberInfoDto> data = dao.memberLogin(session, dto);
		
		
		session.close();
		return result;
	}

	// 아이디 중복 체크
	public Integer idDuplicateCheck(String mId) {
		Integer result = null;
//		Connection conn = getConnection(true);
//		result = dao.idDuplicateCheck(conn, mId);
//		close(conn);

		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = dao.idDuplicateCheckMybatis(session, mId);
		session.close();
		return result;
	}

	// 회원가입
	public Integer registMember(MemberDto dto) {
		Integer result = null;
		Connection conn = getConnection(true);
		result = dao.registMember(conn, dto);
		close(conn);
		return result;
	}

}
