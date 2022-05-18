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
	private int memberNo;
	private String shopIntro;
	private String shopPic;
	private String shopBirth;
	private String category;
	private int grossIncome;
}
