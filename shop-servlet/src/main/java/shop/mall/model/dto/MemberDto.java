package shop.mall.model.dto;

public class MemberDto {

	private String mId;
	private String mPw;
	private String mAuth;
	private String mName;
	private String mAddr;
	private String mPhone;
	private String mEmail;
	private String mSex;
	private String mAcct;
	
	public MemberDto(String mId, String mPw, String mAuth, String mName, String mAddr, String mPhone, String mEmail,
			String mSex, String mAcct) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mAuth = mAuth;
		this.mName = mName;
		this.mAddr = mAddr;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.mSex = mSex;
		this.mAcct = mAcct;
	}
	
	@Override
	public String toString() {
		return "MemberDto [mId=" + mId + ", mPw=" + mPw + ", mAuth=" + mAuth + ", mName=" + mName + ", mAddr=" + mAddr
				+ ", mPhone=" + mPhone + ", mEmail=" + mEmail + ", mSex=" + mSex + ", mAcct=" + mAcct + "]";
	}
	
	public String getmId() {
		return mId;
	}
	public String getmPw() {
		return mPw;
	}
	public String getmAuth() {
		return mAuth;
	}
	public String getmName() {
		return mName;
	}
	public String getmAddr() {
		return mAddr;
	}
	public String getmPhone() {
		return mPhone;
	}
	public String getmEmail() {
		return mEmail;
	}
	public String getmSex() {
		return mSex;
	}
	public String getmAcct() {
		return mAcct;
	}
	
}
