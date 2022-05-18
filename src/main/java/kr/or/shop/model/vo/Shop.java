package kr.or.shop.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Shop {
	private int shopNo;
	private String shopName;
	private int bizNo;
	private int memberNo;
	private String shopIntro;
	private String shopBirth;
	private String category;
	private int grossIncome;
	private ArrayList<ShopPic> fileList;
}
