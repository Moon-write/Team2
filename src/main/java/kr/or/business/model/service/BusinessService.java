package kr.or.business.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.business.model.dao.BusinessDao;

@Service
public class BusinessService {
	@Autowired
	private BusinessDao dao;
}
