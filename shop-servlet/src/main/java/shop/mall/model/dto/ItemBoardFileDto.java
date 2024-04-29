package shop.mall.model.dto;

public class ItemBoardFileDto {
	private String imageId;
	private String itemBoardId;
	private String filePath;
	private String fileName;
	public ItemBoardFileDto(String imageId, String itemBoardId, String filePath, String fileName) {
		super();
		this.imageId = imageId;
		this.itemBoardId = itemBoardId;
		this.filePath = filePath;
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "ItemBoardFileDto [imageId=" + imageId + ", itemBoardId=" + itemBoardId + ", filePath=" + filePath
				+ ", fileName=" + fileName + "]";
	}
	public String getImageId() {
		return imageId;
	}
	public String getItemBoardId() {
		return itemBoardId;
	}
	public String getFilePath() {
		return filePath;
	}
	public String getFileName() {
		return fileName;
	}
	
	
}
