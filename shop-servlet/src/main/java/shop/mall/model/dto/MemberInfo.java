package shop.mall.model.dto;

public class MemberInfo {
//	이름      널?       유형           
//	------- -------- ------------ 
//	M_ID    NOT NULL VARCHAR2(16) 
//	M_PW    NOT NULL VARCHAR2(16) 
//	M_AUTH  NOT NULL CHAR(1)      
//	M_NAME  NOT NULL VARCHAR2(10) 
//	M_ADDR  NOT NULL VARCHAR2(50) 
//	M_PHONE NOT NULL VARCHAR2(11) 
//	M_EMAIL NOT NULL VARCHAR2(30) 
//	M_SEX            CHAR(3)      
//	M_ACCT           VARCHAR2(15) 
	
	private String mId;
	private String mName;
	
	public MemberInfo(String mId, String mName) {
		super();
		this.mId = mId;
		this.mName = mName;
	}
	
	@Override
	public String toString() {
		return "MemberInfo [mId=" + mId + ", mName=" + mName + "]";
	}
	
	public String getmId() {
		return mId;
	}
	public String getmName() {
		return mName;
	}
	
}
