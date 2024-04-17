package shop.mall.model.dto;

public class MemberInfoDto {
	
	private String memberId;
	private String memberName;
	private String memberAuth;
	
	public MemberInfoDto(String memberId, String memberName, String memberAuth) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberAuth = memberAuth;
	}
	
	@Override
	public String toString() {
		return "MemberInfoDto [memberId=" + memberId + ", memberName=" + memberName + ", memberAuth=" + memberAuth
				+ "]";
	}
	
	public String getMemberId() {
		return memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public String getMemberAuth() {
		return memberAuth;
	}
	
}
