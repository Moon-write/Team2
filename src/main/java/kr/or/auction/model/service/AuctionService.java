package kr.or.auction.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.auction.model.dao.AuctionDao;

@Service
public class AuctionService {

	@Autowired
	private AuctionDao dao;
}
