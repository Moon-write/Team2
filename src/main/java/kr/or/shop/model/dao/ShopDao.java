package kr.or.shop.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.AuctionList;
import kr.or.donation.model.vo.Donation;
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
	
	public Shop selectShop(int shopNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.selectShop", shopNo);
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


	public ArrayList<Donation> selectDonationList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("shop.selectDonationList", memberNo);
		return (ArrayList<Donation>)list;
	}


	public ArrayList<Auction> selectAuctionList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("shop.selectAuctionList", memberNo);
		return (ArrayList<Auction>)list;
	}


	public int selectShopNo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.selectShopNo",memberNo);
	}

	public ArrayList<Auction> selectFundingList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("shop.selectFundingList", memberNo);
		return (ArrayList<Auction>)list;
	}

	public String selectFundingFile(int fundingNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.selectFundingFile", fundingNo);
	}

	public int updateBizMember(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("shop.updateBizMember", m);
	}

	public int updateShopInfo(Shop s) {
		// TODO Auto-generated method stub
		return sqlSession.update("shop.updateShopInfo",s);
	}

}
