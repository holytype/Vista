package shop.mall.model.dto;

public class ItemColorDto {
	private String colorId;
	private String itemBoardId;
	private String color;
	
	public ItemColorDto(String colorId, String itemBoardId, String color) {
		super();
		this.colorId = colorId;
		this.itemBoardId = itemBoardId;
		this.color = color;
	}

	public String getColorId() {
		return colorId;
	}

	public String getItemBoardId() {
		return itemBoardId;
	}

	public String getColor() {
		return color;
	}
	
	
}
