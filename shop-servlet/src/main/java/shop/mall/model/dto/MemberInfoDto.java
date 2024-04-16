package shop.mall.model.dto;

public class MemberInfoDto {
	
	private String mId;
	private String mName;
	private String mAuth;
	
	public MemberInfoDto(String mId, String mName, String mAuth) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.mAuth = mAuth;
	}
	
	@Override
	public String toString() {
		return "MemberInfoDto [mId=" + mId + ", mName=" + mName + ", mAuth=" + mAuth + "]";
	}

	public String getmId() {
		return mId;
	}
	public String getmName() {
		return mName;
	}
	
	public String getmAuth() {
		return mAuth;
	}
	
}
