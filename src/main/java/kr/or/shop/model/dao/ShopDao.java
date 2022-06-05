package kr.or.shop.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
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
	

	public ArrayList<ShopCategory> selectCategory(int shopNo) {
		// TODO Auto-generated method stub
		List list=sqlSession.selectList("shop.selectCategory", shopNo);
		return (ArrayList<ShopCategory>)list;
	}

	public ArrayList<ShopPic> selectShopPic(int shopNo) {
		// TODO Auto-generated method stub
		List list=sqlSession.selectList("shop.selectShopPic", shopNo);
		return (ArrayList<ShopPic>)list;
	}
	
	public int insertFile(ShopPic file) {
		int result = sqlSession.insert("shop.insertFile", file);
		return result;
	}

	public ArrayList<ShopPic> selectShopPicList(int memberNo) {
		// TODO Auto-generated method stub
		List list=sqlSession.selectList("shop.selectShopPicList", memberNo);
		return (ArrayList<ShopPic>)list;
	}

	public ShopPic selectDelPic(int shopPicNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.selectDelPic", shopPicNo);
	}

	public int deleteShopPic(int shopPicNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("shop.deleteShopPic",shopPicNo);
	}


	public int insertShopIntro(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shop.insertShopIntro", map);
	}


	public int deleteCategory(int shopCategoryNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("shop.deleteCategory",shopCategoryNo);		
	}


	public int insertCategory(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("shop.insertCategory",map);		
	}


	public Member selectOneMember(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.selectOneMember",memberNo);
	}
}
