package kr.or.shop.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.shop.model.vo.Shop;
import kr.or.shop.model.vo.ShopCategory;
import kr.or.shop.model.vo.ShopPic;

@Repository
public class ShopDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Shop selectShopInfo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.selectShopInfo", memberNo);
	}

	public ArrayList<ShopCategory> selectCategory(int i) {
		// TODO Auto-generated method stub
		List list=sqlSession.selectList("shop.selectCategory", i);
		return (ArrayList<ShopCategory>)list;
	}

	public ArrayList<ShopPic> selectShopPic(int shopNo) {
		// TODO Auto-generated method stub
		System.out.println(shopNo);
		List list=sqlSession.selectList("shop.selectShopPic", shopNo);
		return (ArrayList<ShopPic>)list;
	}
	
	public int insertFile(ShopPic file) {
		int result = sqlSession.insert("shop.insertFile", file);
		return result;
	}

}
