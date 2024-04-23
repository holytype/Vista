package shop.mall.model.dto;

public class MemberInfoDto {
	
	private String memId;
	private String memName;
	private String memAuth;
	private String logTime;
	private String ip;

	public MemberInfoDto(String memId, String ip) {
		super();
		this.memId = memId;
		this.ip = ip;
	}

	public MemberInfoDto(String memId, String memName, String memAuth, String logTime) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memAuth = memAuth;
		this.logTime = logTime;
	}
	

	
	public MemberInfoDto(String memId, String memName, String memAuth, String logTime, String ip) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memAuth = memAuth;
		this.logTime = logTime;
		this.ip = ip;
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
	public String getIp() {
		return ip;
	}

}
