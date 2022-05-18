package kr.or.shop.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.shop.model.dao.ShopDao;
import kr.or.shop.model.vo.Shop;
import kr.or.shop.model.vo.ShopCategory;

@Service
public class ShopService {
	@Autowired
	private ShopDao dao;

	public Shop selectShopInfo() {
		// TODO Auto-generated method stub
		return dao.selectShopInfo();
	}

	public ArrayList<ShopCategory> selectCategory() {
		// TODO Auto-generated method stub
		return dao.selectCategory();
	}
}
