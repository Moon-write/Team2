package kr.or.donation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.donation.dao.DonationDao;

@Service
public class DonationService {
	@Autowired
	private DonationDao dao;
}
