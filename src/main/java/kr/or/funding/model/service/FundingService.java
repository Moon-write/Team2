package kr.or.funding.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.funding.model.dao.FundingDao;

@Service
public class FundingService {
	@Autowired
	private FundingDao dao;
}
