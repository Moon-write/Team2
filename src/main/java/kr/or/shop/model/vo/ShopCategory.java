package kr.or.shop.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ShopCategory {
	private int shopCategoryNo;
	private int shopNo;
	private String category;
}
