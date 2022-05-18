package kr.or.shop.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.shop.model.dao.ShopDao;
import kr.or.shop.model.vo.Shop;
import kr.or.shop.model.vo.ShopCategory;
import kr.or.shop.model.vo.ShopPic;

@Service
public class ShopService {
	@Autowired
	private ShopDao dao;

	public Shop selectShopInfo(int memberNo) {
		// TODO Auto-generated method stub
		Shop s=dao.selectShopInfo(memberNo);
		ArrayList<ShopPic> fileList=dao.selectShopPic(s.getShopNo());
		System.out.println(s.getShopNo());
		System.out.println(fileList);
		s.setFileList(fileList);
		return s;
	}

	public ArrayList<ShopCategory> selectCategory(int i) {
		// TODO Auto-generated method stub
		return dao.selectCategory(i);
	}
	
	public int insertShopPic(Shop shop, ArrayList<ShopPic> fileList) {
		int result = 0;
		for (ShopPic file : fileList) {
			file.setShopNo(shop.getShopNo());
			result += dao.insertFile(file);
		}
		return result;
	}
}
