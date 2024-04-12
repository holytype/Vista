package shop.mall.model.dto;

public class MemberLoginDto {

	private String mId;
	private String mPw;
	
	
	public MemberLoginDto(String mId, String mPw) {
		super();
		this.mId = mId;
		this.mPw = mPw;
	}

	@Override
	public String toString() {
		return "MemberLoginDto [mId=" + mId + ", mPw=" + mPw + "]";
	}

	public String getmId() {
		return mId;
	}

	public String getmPw() {
		return mPw;
	}
	
}
