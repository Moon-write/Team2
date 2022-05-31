package kr.or.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.funding.model.dao.FundingDao;
import kr.or.funding.model.vo.Funding;
import kr.or.funding.model.vo.FundingFile;
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

	public ArrayList<Funding> fundingAllList() {
		ArrayList<Funding> list  = dao.selectAllList();
		return (ArrayList<Funding>)list;
	}
}
