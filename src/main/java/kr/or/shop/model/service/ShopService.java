package kr.or.shop.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

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
		s.setFileList(fileList);
		return s;
	}
	
	public ArrayList<ShopCategory> selectCategory(int shopNo) {
		// TODO Auto-generated method stub
		return dao.selectCategory(shopNo);
	}
	
	public int insertShopPic(Shop shop, ArrayList<ShopPic> fileList) {
		int result = 0;
		for (ShopPic file : fileList) {
			file.setShopNo(shop.getShopNo());
			result += dao.insertFile(file);
		}
		return result;
	}

	public ArrayList<ShopPic> selectShopPicList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectShopPicList(memberNo);
	}

	public ArrayList<ShopPic> selectDelPicList(String shopPicNos) {
		StringTokenizer sT = new StringTokenizer(shopPicNos, "/");
		ArrayList<ShopPic> spList=new ArrayList<ShopPic>();
		while (sT.hasMoreTokens()) {
			int shopPicNo = Integer.parseInt(sT.nextToken());
			ShopPic sp = dao.selectDelPic(shopPicNo);
			spList.add(sp);
		}
		return spList;
	}

	public int deleteShopPic(String shopPicNos) {
		StringTokenizer sT = new StringTokenizer(shopPicNos, "/");
		int result=1;
		while (sT.hasMoreTokens()) {
			int shopPicNo = Integer.parseInt(sT.nextToken());
			int deleteResult = dao.deleteShopPic(shopPicNo);
		}
		return result;
	}

	public int insertShopIntro(int shopNo, String shopIntro) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shopNo", shopNo);
		map.put("shopIntro", shopIntro);
		return dao.insertShopIntro(map);
	}

	public int deleteCategory(String categories) {
		// TODO Auto-generated method stub
		StringTokenizer sT = new StringTokenizer(categories, "/");
		int result=1;
		while (sT.hasMoreTokens()) {
			int shopCategoryNo = Integer.parseInt(sT.nextToken());
			int deleteResult = dao.deleteCategory(shopCategoryNo);
		}
		return result;
	}

	public int insertCategory(int shopNo, String categories) {
		// TODO Auto-generated method stub
		StringTokenizer sT = new StringTokenizer(categories, "/");
		int result=1;
		while (sT.hasMoreTokens()) {
			String category =sT.nextToken();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("shopNo", shopNo);
			map.put("category", category);
			int insertResult = dao.insertCategory(map);
		}
		return result;
	}	
}
