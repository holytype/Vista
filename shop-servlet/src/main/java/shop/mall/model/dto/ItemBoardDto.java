package shop.mall.model.dto;

import java.util.List;

public class ItemBoardDto {
	
	private String itemBoardId;
	private String memId;
	private String title;
	private String content;
	private String price;
	private String writeTime;
	private String category;
	private List<String> sizeList;
	private List<String> colorList;
	private List<ItemBoardFileDto> fileList;
	
	public ItemBoardDto(String itemBoardId, String title, String content, String price, String writeTime) {
		super();
		this.itemBoardId = itemBoardId;
		this.title = title;
		this.content = content;
		this.price = price;
		this.writeTime = writeTime;
	}

	public ItemBoardDto(String itemBoardId, String memId, String title, String content, String price, String writeTime,
			String category) {
		super();
		this.itemBoardId = itemBoardId;
		this.memId = memId;
		this.title = title;
		this.content = content;
		this.price = price;
		this.writeTime = writeTime;
		this.category = category;
	}

	@Override
	public String toString() {
		return "ItemBoardDto [itemBoardId=" + itemBoardId + ", memId=" + memId + ", title=" + title + ", content="
				+ content + ", price=" + price + ", writeTime=" + writeTime + ", category=" + category + ", sizeList="
				+ sizeList + ", colorList=" + colorList + ", fileList=" + fileList + "]";
	}

	public String getItemBoardId() {
		return itemBoardId;
	}

	public String getMemId() {
		return memId;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getPrice() {
		return price;
	}

	public String getWriteTime() {
		return writeTime;
	}

	public String getCategory() {
		return category;
	}

	public List<ItemBoardFileDto> getFileList() {
		return fileList;
	}

	public void setFileList(List<ItemBoardFileDto> fileList) {
		this.fileList = fileList;
	}

	public List<String> getSizeList() {
		return sizeList;
	}

	public void setSizeList(List<String> sizeList) {
		this.sizeList = sizeList;
	}

	public List<String> getColorList() {
		return colorList;
	}

	public void setColorList(List<String> colorList) {
		this.colorList = colorList;
	}
	
	
}
