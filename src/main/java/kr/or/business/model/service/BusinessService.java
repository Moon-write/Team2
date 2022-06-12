package kr.or.business.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;
import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.QnaPageData;
import kr.or.business.model.dao.BusinessDao;
import kr.or.business.model.vo.View;
import kr.or.common.model.vo.Order;
import kr.or.donation.model.vo.Donation;
import kr.or.funding.model.vo.Funding;
import kr.or.group.model.vo.Group;
import kr.or.shop.model.vo.Shop;
import kr.or.shop.model.vo.ShopPic;
import oracle.net.aso.a;

@Service
public class BusinessService {
	@Autowired
	private BusinessDao dao;
	@Autowired
	private BoardDao bDao;
	
	public Shop selectShopNo(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectShopNo(memberNo);
	}

	public ArrayList<Funding> selectFdList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFdList(memberNo);
	}

	public ArrayList<Funding> selectExpiredFdList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredFdList(memberNo);
	}

	public ArrayList<String> selectDList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectDList(memberNo);
	}

	public ArrayList<String> selectExpiredDList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredDList(memberNo);
	}

	public ArrayList<Group> selectGrList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectGrList(memberNo);
	}

	/*
	 * public ArrayList<Auction> selectAucList(int memberNo) { // TODO
	 * Auto-generated method stub ArrayList<Auction> au =
	 * dao.selectAucList(memberNo); for (Auction bp : au) { HashMap<String, Object>
	 * map = new HashMap<String, Object>(); map.put("projectNo", bp.getProjectNo());
	 * map.put("memberNo", memberNo); Auction bestPrice = dao.selectBestPrice(map);
	 * bp.setBestPrice(bestPrice.getBestPrice()); } return au; }
	 */

	/*
	 * public ArrayList<Auction> selectExpiredAucList(int memberNo) { // TODO
	 * Auto-generated method stub ArrayList<Auction> au =
	 * dao.selectExpiredAucList(memberNo); for (Auction bp : au) { HashMap<String,
	 * Object> map = new HashMap<String, Object>(); map.put("projectNo",
	 * bp.getProjectNo()); map.put("memberNo", memberNo); Auction bestPrice =
	 * dao.selectBestPrice(map); bp.setBestPrice(bestPrice.getBestPrice()); } return
	 * au; }
	 */

	public int deleteAuction(int projectNo) {
		// TODO Auto-generated method stub
		return dao.deleteAuction(projectNo);
	}

	public int checkDnOrder(int projectNo) {
		// TODO Auto-generated method stub
		return dao.checkDnOrder(projectNo);
	}

	public int deleteDonation(int projectNo) {
		// TODO Auto-generated method stub
		return dao.deleteDonation(projectNo);
	}

	public ArrayList<String> selectAcList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectAcList(memberNo);
	}

	public ArrayList<String> selectDcList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectDcList(memberNo);
	}

	public ArrayList<String> selectFcList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFcList(memberNo);
	}

	public ArrayList<String> selectAList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectAList(memberNo);
	}

	public ArrayList<String> selectExpiredAList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredAList(memberNo);
	}

	public String selectBestPrice(int memberNo, int projectNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		return dao.selectBestPrice(map);
	}

	public int deleteFunding(int fundingNo) {
		// TODO Auto-generated method stub
		return dao.deleteFunding(fundingNo);
	}

	public ArrayList<String> selectFList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFList(memberNo);
	}

	public ArrayList<String> selectExpiredFList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredFList(memberNo);
	}


	public int deleteGroup(int projectNo) {
		// TODO Auto-generated method stub
		return dao.deleteGroup(projectNo);
	}


	public ArrayList<String> selectBidList(int projectNo) {
		// TODO Auto-generated method stub
		return dao.selectBidList(projectNo);
	}

	public List<Integer> auctionGender(int[] gens) {
		// TODO Auto-generated method stubs2.add(memberNo);
		return dao.auctionGender(gens);
	}

	public ArrayList<String> selectMemberNo(int memberNo, int projectNo, int divNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		map.put("divNo", divNo);
		return dao.selectMemberNo(map);
	}

	public List<Integer> selectMaleGroup(int[] mns) {
		// TODO Auto-generated method stub
		return dao.selectMaleGroup(mns);
	}

	public List<Integer> selectFemaleGroup(int[] mns) {
		// TODO Auto-generated method stub
		return dao.selectFemaleGroup(mns);
	}

	public List<Integer> genderGraph(int[] mns) {
		// TODO Auto-generated method stub
		return dao.genderGraph(mns);
	}

	public ArrayList<String> selectOrderList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectOrderList(memberNo);
	}

	public int orderCancel(String orderNos) {
		// TODO Auto-generated method stub
		StringTokenizer sT = new StringTokenizer(orderNos, "/");
		int result=1;
		while (sT.hasMoreTokens()) {
			int orderNo = Integer.parseInt(sT.nextToken());
			int updateResult = dao.orderCancel(orderNo);
		}
		return result;
	}

	public ArrayList<String> searchDelivery(String projectName, int memberNo, String startDate, String endDate, int divNo,
			int orderStatus) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("projectName",projectName);
		map.put("orderStatus", orderStatus);
		map.put("memberNo", memberNo);
		map.put("divNo", divNo);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return dao.searchDelivery(map);
	}

	public ArrayList<String> selectOrderProduct(int orderNo) {
		// TODO Auto-generated method stub
		return dao.selectOrderProduct(orderNo);
	}

	public int deliveryComplete(String orderNos) {
		// TODO Auto-generated method stub
		StringTokenizer sT = new StringTokenizer(orderNos, "/");
		int result=1;
		while (sT.hasMoreTokens()) {
			int orderNo = Integer.parseInt(sT.nextToken());
			int updateResult = dao.deliveryComplete(orderNo);
		}
		return result;
	}

	public int insertDelivery(int orderNo, String carrier, long invoiceNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderNo",orderNo);
		map.put("carrier", carrier);
		map.put("invoiceNo", invoiceNo);
		return dao.insertDelivery(map);
	}

	public int deleteDelivery(long invoiceNo) {
		// TODO Auto-generated method stub
		return dao.deleteDelivery(invoiceNo);
	}

	public ArrayList<String> getDates(String startDate, String endDate) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startDate",startDate);
		map.put("endDate", endDate);
		return dao.getDates(map);
	}

	public ArrayList<String> getAmounts(String startDate, String endDate, int memberNo, int divNo, int projectNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		map.put("memberNo", memberNo);
		map.put("divNo", divNo);
		map.put("projectNo", projectNo);
		return dao.getAmounts(map);
	}

	public String selectStartDate(int memberNo, int divNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("divNo", divNo);
		return dao.selectStartDate(map);
	}

	public String selectFundingSum(int memberNo, int projectNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		return dao.selectFundingSum(map);
	}

	public String selectDonationTarget(int memberNo, int projectNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		return dao.selectDonationTarget(map);
	}

	public ArrayList<String> selectStartEndDate(int memberNo, int projectNo, int divNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		map.put("divNo", divNo);
		return dao.selectStartEndDate(map);
	}

	public QnaPageData selectQnaList(int reqPage, int sellerNo, int qnaStatus) {
		String boardName = "qna_tbl";
		//numPerPage = 한 페이지당 게시물 수 / end = 해당 페이지 마지막 게시물 번호 / start = 해당 페이지 첫번째 게시물 번호
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//start,end로 게시물 목록조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("sellerNo",sellerNo);
		map.put("qnaStatus",qnaStatus);
		ArrayList<Board> qnaList = bDao.selectQnaList(map);
		System.out.println(qnaList);
		//pageNavi작성
		//totalCount = 전체 게시물 수 
		HashMap<String, Object> qnaMap = new HashMap<String, Object>();
		qnaMap.put("boardName",boardName);		
		qnaMap.put("sellerNo",sellerNo);
		qnaMap.put("qnaStatus",qnaStatus);
		int totalCount = bDao.selectQnaCount(qnaMap);
		//totalPage = 전체 페이지 수
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		//pageNaviSize = 페이지 네비 길이 / pageNo = 페이지 번호
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//pageNavi 생성시작
		String pageNavi = "<ul class='pagination circle-style'>";
		//첫페이지 버튼
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='/manageQna.kh?sellerNo="+sellerNo+"&qnaStatus="+qnaStatus+"&reqPage=1'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_left</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/manageQna.kh?sellerNo="+sellerNo+"&qnaStatus="+qnaStatus+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_left</span></a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page' href='/manageQna.kh?sellerNo="+sellerNo+"&qnaStatus="+qnaStatus+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}else {
				pageNavi += "<li><a class='page-item' href='/manageQna.kh?sellerNo="+sellerNo+"&qnaStatus="+qnaStatus+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		//마지막페이지 버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li><a class='page-item' href='/manageQna.kh?sellerNo="+sellerNo+"&qnaStatus="+qnaStatus+"&reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_right</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/manageQna.kh?sellerNo="+sellerNo+"&qnaStatus="+qnaStatus+"&reqPage="+totalPage+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_right</span></a></li>";
		}
		pageNavi += "</ul>";
		System.out.println("qna의 totalPage : "+totalPage);
		System.out.println("qna의 totalCount : "+totalCount);
		System.out.println("qna의 pageNo : "+pageNo);
		QnaPageData qpd = new QnaPageData(qnaList, pageNavi);
		return qpd;
	}

	public int insertQnaRe(int qnaNo, int sellerNo, String qnaReContent) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qnaNo",qnaNo);
		map.put("qnaReContent",qnaReContent);
		return bDao.insertQnaRe(map);
	}

}
