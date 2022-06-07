package kr.or.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.funding.model.dao.FundingDao;
import kr.or.funding.model.vo.Funding;
import kr.or.funding.model.vo.FundingFile;
import kr.or.funding.model.vo.FundingJoinFile;
import kr.or.funding.model.vo.FundingOptionPrice;

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

	public ArrayList<FundingJoinFile> fundingAllList() {
		ArrayList<FundingJoinFile> list  = dao.selectAllList();
		return (ArrayList<FundingJoinFile>)list;
	}
	
	public Funding selectOneFunding(int fundingNo) {
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

	public int updateFunding(Funding f, FundingOptionPrice fop, ArrayList<FundingFile> fundingList) {
		int result1 = dao.updateFunding(f);
		int result2 = 0 ;
		int result3 = 0;
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
			/*for(FundingFile file : fundingList) {
				file.setFundingNo(f.getFundingNo());
				 result3 += dao.updateFundingFile(file);//파일 개수만큼 result3가 나옴
			}*/
			
			ArrayList<Integer> fundingFileNo = dao.selectFundingFileNo(f);
			for(int i = 0 ; i < fundingList.size(); i++) {
				FundingFile file = new FundingFile();
				file.setFundingNo(f.getFundingNo());
			}
			
		}
		return 0;
	}


	/*
	 * public int updateFunding(int memberNo, int fundingNo) { HashMap<String,
	 * Integer> map = new HashMap<String, Integer>(); map.put("memberNo",memberNo);
	 * map.put("fundingNo",fundingNo); return dao.updateFunding(map); }
	 */

	/*
	 * public ArrayList<Funding> selectFundingListMember(int memberNo) { return
	 * (ArrayList<Funding>)dao.selectFundingListMember(memberNo); }
	 */
	
}
