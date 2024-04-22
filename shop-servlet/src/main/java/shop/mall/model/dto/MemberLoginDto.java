package shop.mall.model.dto;

public class MemberLoginDto {

	private String memId;
	private String memPw;
	public MemberLoginDto(String memId, String memPw) {
		super();
		this.memId = memId;
		this.memPw = memPw;
	}
	@Override
	public String toString() {
		return "MemberLoginDto [memId=" + memId + ", memPw=" + memPw + "]";
	}
	public String getMemId() {
		return memId;
	}
	public String getMemPw() {
		return memPw;
	}
	

	
}
