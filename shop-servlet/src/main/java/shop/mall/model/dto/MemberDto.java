package shop.mall.model.dto;

public class MemberDto {

	private String memberId;
	private String memberPw;
	private String memberAuth;
	private String memberName;
	private String memberAddr;
	private String memberPhone;
	private String memberEmail;
	private String memberGender;
	private String memberAcct;
	
	public MemberDto(String memberId, String memberPw, String memberAuth, String memberName, String memberAddr,
			String memberPhone, String memberEmail, String memberGender, String memberAcct) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberAuth = memberAuth;
		this.memberName = memberName;
		this.memberAddr = memberAddr;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberGender = memberGender;
		this.memberAcct = memberAcct;
	}

	@Override
	public String toString() {
		return "MemberDto [memberId=" + memberId + ", memberPw=" + memberPw + ", memberAuth=" + memberAuth
				+ ", memberName=" + memberName + ", memberAddr=" + memberAddr + ", memberPhone=" + memberPhone
				+ ", memberEmail=" + memberEmail + ", memberGender=" + memberGender + ", memberAcct=" + memberAcct
				+ "]";
	}

	public String getMemberId() {
		return memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public String getMemberAuth() {
		return memberAuth;
	}

	public String getMemberName() {
		return memberName;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public String getMemberAcct() {
		return memberAcct;
	}
	
}
