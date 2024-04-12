package shop.mall.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import shop.mall.model.dto.MemberDto;
import shop.mall.model.dto.MemberInfo;
import shop.mall.model.dto.MemberLoginDto;

import static shop.mall.common.jdbc.JdbcTemplate.*;

public class MemberDao {
	
	// 로그인
	public MemberInfo memberLogin(Connection conn , MemberLoginDto dto) {
		MemberInfo result = null;
		String sql = "select M_ID,M_NAME from member where m_id=? and m_pw=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getmPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new MemberInfo(rs.getString("M_ID"), rs.getString("M_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}
	
	//회원가입
	public Integer registMember(Connection conn, MemberDto dto) {
		Integer result = null;
//		이름      널?       유형           
//				------- -------- ------------ 
//				M_ID    NOT NULL VARCHAR2(16) 
//				M_PW    NOT NULL VARCHAR2(16) 
//				M_AUTH  NOT NULL CHAR(1)      
//				M_NAME  NOT NULL VARCHAR2(10) 
//				M_ADDR  NOT NULL VARCHAR2(50) 
//				M_PHONE NOT NULL VARCHAR2(11) 
//				M_EMAIL NOT NULL VARCHAR2(30) 
//				M_SEX            CHAR(3)      
//				M_ACCT           VARCHAR2(15) 
		//String sql = "insert into member(M_ID,M_PW,M_AUTH,M_NAME,M_ADDR,M_PHONE,M_EMAIL,M_SEX,M_ACCT) values()";
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt=null;
		ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sql);
				pstmt.setString(2, sql);
				pstmt.setString(3, sql);
				pstmt.setString(4, sql);
				pstmt.setString(5, sql);
				pstmt.setString(6, sql);
				pstmt.setString(7, sql);
				pstmt.setString(8, sql);
				pstmt.setString(9, sql);
				
				rs=pstmt.executeQuery();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		close(rs);
		close(pstmt);
		return result;
	}
}
