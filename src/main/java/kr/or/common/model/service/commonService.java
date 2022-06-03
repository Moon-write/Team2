package kr.or.common.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.common.model.dao.CommonDao;
import kr.or.common.model.vo.Project;

@Service
public class commonService {

	@Autowired
	private CommonDao dao;

	public ArrayList<Project> searchProject(String keyword) {
		
		return dao.searchProject(keyword);
	}

	public ArrayList<String> selectPopKeyList() {
		// TODO Auto-generated method stub
		return dao.selectPopKeyList();
	}
	
	public int insertPopKey(String keyword) {
		// TODO Auto-generated method stub
		return dao.insertPopKey(keyword);
	}

	public int deleteKeyword() {
		// TODO Auto-generated method stub
		return dao.deleteKeyword();
	}
}