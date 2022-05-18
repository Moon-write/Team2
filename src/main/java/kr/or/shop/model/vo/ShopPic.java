package kr.or.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ShopPic {
	private int shopPicNo;
	private int shopNo;
	private String shopFilename;
	private String shopFilepath;
}
