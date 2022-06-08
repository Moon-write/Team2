package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.CommentPageData;
import kr.or.member.common.SHA256Enc;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	@Autowired
	private SHA256Enc enc;
	
	//암호화 AOP 넣을 메소드들 *Member로 끝나고 매개변수 Member타입이여야함
	public Member selectOneMember(Member m) {
		return dao.selectOneMember(m);
	}
	@Transactional
	public int insertMember(Member m) {
		if(m.getMemberLevel() == 2) {
			int MemberResult = dao.insertMember(m);
				if(MemberResult > 0) {
					return 0;
				}else {
					return 1;
				}
		}else {
			int MemberResult = dao.insertMember(m);
			int ShopResult = dao.insertShop(m);
				if(MemberResult + ShopResult > 1) {
					return 0;
				}else {
					return 1;
				}
		}
	}
	public int changePw(Member m, String memberPwNew) {
		try {
			String oldPwEnc = enc.endData(m.getMemberPw());
			m.setMemberPw(oldPwEnc);//기존 비밀번호 암호화
			memberPwNew = enc.endData(memberPwNew);//새 비밀번호 암호화
		} catch (Exception e) {
			e.printStackTrace();
		}
		Member member = dao.selectOneMember(m);
		if(member == null) {
			return -1;
		}
		m.setMemberPw(memberPwNew);
		int result = dao.newPwMember(m);
		return result;
	}

	public int deleteMember(String memberId) {
		return dao.deleteMember(memberId);
	}

	public int memberUpdate(Member m) {
		return dao.memberUpdate(m);
	}
	public MemberPageData selectMemberList(int reqPage, int memberLevel, String keyword) {
		//numPerPage = 한 페이지당 게시물 수 / end = 해당 페이지 마지막 게시물 번호 / start = 해당 페이지 첫번째 게시물 번호
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//start,end로 게시물 목록조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("memberLevel",memberLevel);
		map.put("keyword",keyword);
		ArrayList<Member> memberList = dao.selectMemberList(map);
		
		//pageNavi작성
		//totalCount = 전체 게시물 수 
		HashMap<String, Object> memberMap = new HashMap<String, Object>();
		memberMap.put("memberLevel",memberLevel);
		map.put("keyword",keyword);
		int totalCount = dao.selectMemberCount(memberMap);
		//totalPage = 전체 페이지 수
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		//pageNaviSize = 페이지 네비 길이 / pageNo = 페이지 번호
		int pageNaviSize = 10;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//pageNavi 생성시작
		String pageNavi = "<ul class='pagination circle-style'>";
		//첫페이지 버튼
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='/memberList.kh?memberLevel="+memberLevel+"&reqPage=1'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_left</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/memberList.kh?memberLevel="+memberLevel+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_left</span></a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page' href='/memberList.kh?memberLevel="+memberLevel+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}else {
				pageNavi += "<li><a class='page-item' href='/memberList.kh?memberLevel="+memberLevel+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		//마지막페이지 버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li><a class='page-item' href='/memberList.kh?memberLevel="+memberLevel+"&reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_right</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/memberList.kh?memberNo="+memberLevel+"&reqPage="+totalPage+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_right</span></a></li>";
		}
		pageNavi += "</ul>";
		MemberPageData mpd = new MemberPageData(memberList, pageNavi);
		return mpd;
	}
	
	public boolean deleteMemberList(String memberIdArr) {
		StringTokenizer sT = new StringTokenizer(memberIdArr,"/");
		boolean result = true;
		while(sT.hasMoreTokens()) {
			String memberId = sT.nextToken();
			int checkResult = dao.deleteMember(memberId);
			System.out.println(checkResult);
			if(checkResult == 0) {
				result = false;
				break;
			}
		}
		return result;
	}
	
	

	



}
