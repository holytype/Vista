package shop.mall.model.dto;

public class ItemBoardFileDto {
	private Integer imageId;
	private Integer itemBoardId;
	private String filePath;
	private String fileName;
	private String originalName;
	
	
	public ItemBoardFileDto(Integer itemBoardId, String filePath, String fileName, String originalName) {
		super();
		this.itemBoardId = itemBoardId;
		this.filePath = filePath;
		this.fileName = fileName;
		this.originalName = originalName;
	}
	public ItemBoardFileDto(Integer imageId, Integer itemBoardId, String filePath, String fileName, String originalName) {
		super();
		this.imageId = imageId;
		this.itemBoardId = itemBoardId;
		this.filePath = filePath;
		this.fileName = fileName;
		this.originalName = originalName;
	}
	@Override
	public String toString() {
		return "ItemBoardFileDto [imageId=" + imageId + ", itemBoardId=" + itemBoardId + ", filePath=" + filePath
				+ ", fileName=" + fileName + ", originalName=" + originalName + "]";
	}
	public Integer getImageId() {
		return imageId;
	}
	public Integer getItemBoardId() {
		return itemBoardId;
	}
	public String getFilePath() {
		return filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public String getOriginalName() {
		return originalName;
	}
}
