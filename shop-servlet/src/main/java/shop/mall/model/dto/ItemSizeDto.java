package shop.mall.model.dto;

public class ItemSizeDto {
	private String sizeId;
	private String itemBoardId;
	private String size;
	public ItemSizeDto(String sizeId, String itemBoardId, String size) {
		super();
		this.sizeId = sizeId;
		this.itemBoardId = itemBoardId;
		this.size = size;
	}
	@Override
	public String toString() {
		return "ItemSizeDto [sizeId=" + sizeId + ", itemBoardId=" + itemBoardId + ", size=" + size + "]";
	}
	public String getSizeId() {
		return sizeId;
	}
	public String getItemBoardId() {
		return itemBoardId;
	}
	public String getSize() {
		return size;
	}
	
	
}
