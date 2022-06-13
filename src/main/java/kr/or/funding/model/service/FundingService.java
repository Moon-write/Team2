package kr.or.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.common.model.vo.Comment;
import kr.or.common.model.vo.Order;
import kr.or.common.model.vo.OrderProduct;
import kr.or.funding.model.dao.FundingDao;
import kr.or.funding.model.vo.Funding;
import kr.or.funding.model.vo.FundingBoard;
import kr.or.funding.model.vo.FundingFile;
import kr.or.funding.model.vo.FundingJoinFile;
import kr.or.funding.model.vo.FundingOptionPrice;
import kr.or.member.model.vo.Member;

@Service
public class FundingService {
	@Autowired
	private FundingDao dao;

	public int insertFunding(Funding f, FundingOptionPrice fop, ArrayList<FundingFile> fundingList) {
		int result1 = dao.insertFunding(f);
		int result2 = 0 ;
		int result3 = 0;
		if(result1>0) {
			//방금 등록한 fundingNo > fundingMaxNo
			int fundingMaxNo = dao.selectFundingMaxNo();
			
			//옵션리스트 넣기	
			for(int i = 0 ; i <fop.getFundingOptionList().length;i++) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("fundingOptionList", fop.getFundingOptionList()[i]);
				map.put("fundingOptionPrice", fop.getFundingOptionPrice()[i]);
				map.put("fundingNo", fundingMaxNo);
				result2 += dao.insertFundingOptionPrice(map);
			}
			//멀티 파일넣기 
			for(FundingFile file : fundingList) {
				file.setFundingNo(fundingMaxNo);
				 result3 += dao.insertFundingFile(file);//파일 개수만큼 result3가 나옴
			}
			
		}else {
			return -1;//-1이 리턴되면 result1이 insert 안된것.
		}
		return result2+result3;
	}
	
	//리스트 불러오기

	public ArrayList<FundingJoinFile> fundingAllList(int selectedInquire) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("selectedInquire", selectedInquire);
		//if(selectedInquire==1||selectedInquire==2) {
			ArrayList<FundingJoinFile> list  = dao.selectAllList(map);		

		//}
		return (ArrayList<FundingJoinFile>)list;
	}

	public ArrayList<FundingJoinFile> selectFundingListCategory(int selectedInquire,Funding f) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("selectedInquire", selectedInquire);
		map.put("fundingCategory",f.getFundingCategory());
		ArrayList<FundingJoinFile> list  = dao.selectFundingListCategory(map);		

		return (ArrayList<FundingJoinFile>)list;
	}

	
	
	public Funding selectOneFunding(int fundingNo) {
		dao.checkViewCount(fundingNo);
		return dao.selectOneFunding(fundingNo);
	}

	public ArrayList<FundingFile> selectOneFundingFile(int fundingNo) {
		ArrayList<FundingFile> list = dao.selectOneFundingFile(fundingNo);
		return (ArrayList<FundingFile>)list ;
	}

	public ArrayList<FundingOptionPrice> selectFundingOptionPrice(int fundingNo) {
		ArrayList<FundingOptionPrice> list = dao.selectFundingOptionPrice(fundingNo);
		return (ArrayList<FundingOptionPrice>) list;
	}

	public Funding selectOneFunding2(int fundingNo) {
		
		return dao.selectOneFunding2(fundingNo);
	}

	public Funding selectOneFundingMemberNo(Funding funding) {

		return dao.selecOneFundingMemberNo(funding);
	}

	public int updateFunding(Funding f, FundingOptionPrice fop, ArrayList<FundingFile> fundingList,int[] deleteFundingFileNo) {
		int result1 = dao.updateFunding(f);
		int result2 = 0 ;
		int result3 = 0;
		int resultDelete = 0;
		if(result1>0) {
			ArrayList<Integer> fundingOptionPriceNo = dao.selectFundingOptionPriceNo(f);
			/*
			System.out.println("=====---===");
			System.out.println(fop.getFundingOptionList()[0]);
			System.out.println(fop.getFundingOptionList()[1]);
			System.out.println(fop.getFundingOptionPrice()[0]);
			System.out.println(fop.getFundingOptionPrice()[1]);
			System.out.println(fundingOptionPriceNo.get(0));
			System.out.println(fundingOptionPriceNo.get(1));
			*/
			
			for(int i = 0 ; i <fop.getFundingOptionList().length;i++) {
				System.out.println("펀딩옵션가격넘버: "+fundingOptionPriceNo.get(i));
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("fundingOptionList", fop.getFundingOptionList()[i]);
				map.put("fundingOptionPrice", fop.getFundingOptionPrice()[i]);
				map.put("fundingOptionPriceNo",fundingOptionPriceNo.get(i));
				map.put("fundingNo", f.getFundingNo());
				result2 += dao.updateFundingOptionPrice(map);
			}
			System.out.println("result2 : "+result2);
			/*for(FundingFile file : fundingList) {
				file.setFundingNo(f.getFundingNo());
				 result3 += dao.updateFundingFile(file);//파일 개수만큼 result3가 나옴
			}*/
			
			if(result2 == fop.getFundingOptionList().length) {
				if(deleteFundingFileNo != null) {//삭제한거가0아닐때 즉 1개 이상일때
				for(int i = 0 ; i<deleteFundingFileNo.length;i++) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("fundingNo", f.getFundingNo());
					map.put("deleteFundingFileNo", deleteFundingFileNo[i]);
					resultDelete += dao.deleteFundingFile(map);					
					}
				}
				
				System.out.println("추가안했을 때 fundingList : "+fundingList.size());
				if(fundingList.size() !=0) {//추가한거가0아닐때 즉 1개이상일떄
					ArrayList<Integer> fundingFileNo = dao.selectFundingFileNo(f);
					for(FundingFile file : fundingList) {
						file.setFundingNo(f.getFundingNo());
						result3 += dao.insertFundingFile(file);//파일 개수만큼 result3가 나옴
					}
				}else {
					result3 = 1;
				}
				
			}else {
				return -1;
			}
			
		}else {
			return -1;
		}
		return resultDelete+result3;
	}

	public int addLike(int memberNo, int fundingNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("fundingNo", fundingNo);
		int result = dao.addLike(map);
		
		if(result>0) {
			result = dao.getTotalLike(fundingNo);
		}else {
			return -1;
		}
		return result;
	}

	public int removeLike(int memberNo, int fundingNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("fundingNo", fundingNo);
		int result = dao.removeLike(map);
		
		if(result>0) {
			result = dao.getTotalLike(fundingNo);
		}else {
			return -1;
		}
		return result;
	}

	public Funding selectOneFundingRight(int fundingNo) {
		return dao.selectOneFundingRight(fundingNo);
	}

	public Comment addComment(Comment c) {
		int result = dao.addComment(c);
		if(result>0) {
			Comment comment = dao.selectLastComment(c);
			return comment;
		}else {
			return null;
		}
	}
	


	public int insertOrder(Order o,OrderProduct op) {
		int result = dao.insertOrder(o);
		int result2 = 0 ;
		int result3 = 0;
		int totalPrice = 0;
		if(result>0) {
			int OrderMaxNo = dao.selectOrederMaxNo();
			OrderProduct op2 = new OrderProduct();
			for(int i = 0 ; i < op.getOptionNo2().length;i++) {

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("OrderMaxNo", OrderMaxNo);
				map.put("optionNo", op.getOptionNo2()[i]);
				map.put("ProductPrice", op.getProductPrice2()[i]);
				map.put("productAmount", op.getProductAmount2()[i]);
				result2 +=dao.insertOrderProduct(map);
				totalPrice += op.getProductPrice2()[i]*op.getProductAmount2()[i];
				System.out.println("토탈가격!!! : "+totalPrice);
			}
			if(result2 == op.getOptionNo2().length) {
				Funding funding = dao.selectFundingCurrentSum(o);
				funding.setFundingCurrentSum(totalPrice+funding.getFundingCurrentSum());
				funding.setFundingSumRate(funding.getFundingCurrentSum()*100/funding.getFundingSum());//소숫점 버려 정수퍼센트만
				funding.setFundingNo(o.getProjectNo());
				result3 = dao.updateFundingCurrentSum(funding);
				return result3;
			}else {
				return -1;
			}
		}else {
			return -1;
		}
		
	}




	 /*
	 * public ArrayList<Funding> selectFundingListMember(int memberNo) { return
	 * (ArrayList<Funding>)dao.selectFundingListMember(memberNo); }
	 */
	
}
