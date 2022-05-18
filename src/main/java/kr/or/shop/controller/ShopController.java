package kr.or.shop.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.shop.model.service.ShopService;
import kr.or.shop.model.vo.Shop;
import kr.or.shop.model.vo.ShopCategory;

@Controller
public class ShopController {
	@Autowired
	private ShopService service;
	
	@RequestMapping(value="/shopInfo.kh")
	public String shopInfo(Model model) {
		Shop shop = service.selectShopInfo();
		ArrayList<ShopCategory> category=service.selectCategory();
		model.addAttribute("shop", shop);
		model.addAttribute("category", category);
		return "shop/shopInfo";
	}
}
