package kr.or.donation.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.donation.model.dao.DonationDao;
import kr.or.donation.model.vo.Donation;


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
}
