package shop.mall.model.dto;

public class MemberInfoDto {
	
	private String memId;
	private String memName;
	private String memAuth;
	private String logTime;
	
	public MemberInfoDto(String memId, String memName, String memAuth) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memAuth = memAuth;
	}
	public MemberInfoDto(String memId, String memName, String memAuth, String logTime) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memAuth = memAuth;
		this.logTime = logTime;
	}
	@Override
	public String toString() {
		return "MemberInfoDto [memId=" + memId + ", memName=" + memName + ", memAuth=" + memAuth + ", logTime="
				+ logTime + "]";
	}
	public String getMemId() {
		return memId;
	}
	public String getMemName() {
		return memName;
	}
	public String getMemAuth() {
		return memAuth;
	}
	public String getLogTime() {
		return logTime;
	}

	
}
