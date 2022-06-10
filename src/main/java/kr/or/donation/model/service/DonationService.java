package kr.or.donation.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.donation.model.dao.DonationDao;
import kr.or.donation.model.vo.Donation;
import kr.or.donation.model.vo.DonationComment;
import kr.or.member.model.vo.Member;


@Service
public class DonationService {
	@Autowired
	private DonationDao dao;
	
	//insert
	public int insertDonation(Donation d) {
		// TODO Auto-generated method stub
		return dao.insertDonation(d);
	}

	//update
	public int updateDonation(Donation d) {
		// TODO Auto-generated method stub
		return dao.updateDonation(d);
	}

	//select
	public ArrayList<Donation> selectDonationList() {
		// TODO Auto-generated method stub
		return dao.selectDonationList();
	}

	public Donation selectOneDonation(int projectNo) {
		// TODO Auto-generated method stub
		return dao.selectOneDonation(projectNo);
	}

	public ArrayList<Donation> selectHashtag(String donationCategory) {
		// TODO Auto-generated method stub
		return dao.selectHashtag(donationCategory);
	}

	public int selectsumDonationCategory(String donationCategory) {
		// TODO Auto-generated method stub
		return dao.selectsumDonationCategory(donationCategory);
	}

	public Member selectOneMember(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(memberNo);
	}

	public int insertDonationComment(DonationComment dc) {
		// TODO Auto-generated method stub
		return dao.insertDonationComment(dc);
	}

	public ArrayList<DonationComment> selectOneDonationComment(int selectProjectNo) {
		// TODO Auto-generated method stub
		return dao.selectDonationComment(selectProjectNo);
	}

	public int donationCommentDelete(DonationComment dc) {
		// TODO Auto-generated method stub
		return dao.donationCommentDelete(dc);
	}
}
