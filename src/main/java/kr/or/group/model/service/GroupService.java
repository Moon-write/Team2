package kr.or.group.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.group.model.dao.GroupDao;

@Service
public class GroupService {
	@Autowired
	private GroupDao dao;
}
