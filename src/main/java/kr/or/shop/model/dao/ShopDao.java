package kr.or.shop.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.shop.model.vo.Shop;
import kr.or.shop.model.vo.ShopCategory;

@Repository
public class ShopDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Shop selectShopInfo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.selectShopInfo");
	}

	public ArrayList<ShopCategory> selectCategory() {
		// TODO Auto-generated method stub
		List list=sqlSession.selectList("shop.selectCategory");
		return (ArrayList<ShopCategory>)list;
	}
}
