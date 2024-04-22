package shop.mall.model.dto;

public class MemberDto {

	private String memId;
	private String memPw;
	private String memAuth;
	private String memName;
	private String memPost;
	private String memAddr;
	private String memPhone;
	private String memEmail;
	private String memGender;
	private String memBank;
	private String memAcct;
	public MemberDto(String memId, String memPw, String memAuth, String memName, String memPost, String memAddr,
			String memPhone, String memEmail, String memGender, String memBank, String memAcct) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memAuth = memAuth;
		this.memName = memName;
		this.memPost = memPost;
		this.memAddr = memAddr;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.memGender = memGender;
		this.memBank = memBank;
		this.memAcct = memAcct;
	}
	@Override
	public String toString() {
		return "MemberDto [memId=" + memId + ", memPw=" + memPw + ", memAuth=" + memAuth + ", memName=" + memName
				+ ", memPost=" + memPost + ", memAddr=" + memAddr + ", memPhone=" + memPhone + ", memEmail=" + memEmail
				+ ", memGender=" + memGender + ", memBank=" + memBank + ", memAcct=" + memAcct + "]";
	}
	public String getMemId() {
		return memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public String getMemAuth() {
		return memAuth;
	}
	public String getMemName() {
		return memName;
	}
	public String getMemPost() {
		return memPost;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public String getMemGender() {
		return memGender;
	}
	public String getMemBank() {
		return memBank;
	}
	public String getMemAcct() {
		return memAcct;
	}
	
		
}
