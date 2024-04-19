package shop.mall.model.dto;

public class MainGridDto {
	private String boardId;	
	private String imagePath;
	private String title;
	private String price;
	private String desc;
	
	public MainGridDto(String boardId, String imagePath, String title, String price, String desc) {
		super();
		this.boardId = boardId;
		this.imagePath = imagePath;
		this.title = title;
		this.price = price;
		this.desc = desc;
	}
	
	@Override
	public String toString() {
		return "MainGridDto [boardId=" + boardId + ", imagePath=" + imagePath + ", title=" + title + ", price=" + price
				+ ", desc=" + desc + "]";
	}
	
	public String getBoardId() {
		return boardId;
	}
	public String getImagePath() {
		return imagePath;
	}
	public String getTitle() {
		return title;
	}
	public String getPrice() {
		return price;
	}
	public String getDesc() {
		return desc;
	}
	
}
