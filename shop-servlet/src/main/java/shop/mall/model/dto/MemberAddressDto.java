package shop.mall.model.dto;

public class MemberAddressDto {

	private String daId;
	private String memId;
	private String address;
	private String name;
	private String post;
	private String phone;
	private String addrName;
	private String addrPin;
	public MemberAddressDto(String daId, String memId, String address, String name, String post, String phone,
			String addrName, String addrPin) {
		super();
		this.daId = daId;
		this.memId = memId;
		this.address = address;
		this.name = name;
		this.post = post;
		this.phone = phone;
		this.addrName = addrName;
		this.addrPin = addrPin;
	}
	@Override
	public String toString() {
		return "MemberAddressDto [daId=" + daId + ", memId=" + memId + ", address=" + address + ", name=" + name
				+ ", post=" + post + ", phone=" + phone + ", addrName=" + addrName + ", addrPin=" + addrPin + "]";
	}
	public String getDaId() {
		return daId;
	}
	public String getMemId() {
		return memId;
	}
	public String getAddress() {
		return address;
	}
	public String getName() {
		return name;
	}
	public String getPost() {
		return post;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddrName() {
		return addrName;
	}
	public String getAddrPin() {
		return addrPin;
	}

}
