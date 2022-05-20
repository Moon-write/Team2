package kr.or.auction.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.or.auction.model.service.AuctionService;
import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;
import kr.or.member.model.vo.Member;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService service;
	
	// 이동
	
	@RequestMapping(value="auctionList.kh")
	public String auctionList(@SessionAttribute(required=false) Member m, Model model) {
		// 로그인한 회원이 없을 경우 변수 0으로 셋팅
		if(m==null) {
			m = new Member();
			m.setMemberNo(0);
		}
		ArrayList<Auction> list = service.selectAuctionList(m.getMemberNo()); // 로그인 완료되면 변수수정
		model.addAttribute("list", list);
		return "auction/auctionList";
	}
	
	@RequestMapping(value="addAuction.kh")
	public String addAuction() {
		return "auction/addAuction";
	}
	
	@RequestMapping(value="auctionView.kh")
	public String auctionView(@SessionAttribute(required=false) Member m, int projectNo, Model model) {
		// 로그인한 사람의 좋아요여부 가져오기
		if(m==null) {
			m = new Member();
			m.setMemberNo(0);
		}		
		Auction auction = service.selectAuction(projectNo, m.getMemberNo());
				
		if(auction!=null) {
			model.addAttribute("auction", auction);
			return "auction/auctionView";
		}else {
			model.addAttribute("direct", 1);
			model.addAttribute("msg", "경매가 삭제되었거나 열람이 제한된 상품입니다!");
			return "auction/auctionRedirect";		
		}		
	}
	
	// 등록 insert
	@RequestMapping(value="/insertBid.kh")
	public String insertBid(@SessionAttribute(required=false) Member m, Bid b, Model model) {
		b.setMemberNo(m.getMemberNo());
		int result = service.insertBid(b);
		if(result>0) {
			model.addAttribute("msg", "입찰이 완료되었습니다!");
		}else {
			model.addAttribute("msg", "입찰에 실패했습니다! 관리자에게 문의해 주세요.");
		}
		model.addAttribute("direct", 3);
		model.addAttribute("projectNo", b.getProjectNo());
		return "auction/auctionRedirect";
	}
	@ResponseBody
	@RequestMapping(value="/auctionImgUpload.kh")
	public String auctionImgUpload(@RequestParam("file") MultipartFile[] file, HttpServletRequest request ) {
		String filepath = null;
		
		if(!file[0].isEmpty()) {
			// 사진이 있을때만 로직 실행
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/auction/");
			
			MultipartFile onefile = file[0];
			
			filepath = fileIo(onefile, savePath);
		}
		return "../../../resources/upload/auction/"+filepath;
	}
	
	@RequestMapping(value="/insertAuction.kh")
	public String insertAuction(@SessionAttribute(required=false) Member m, Auction auction, MultipartFile[] auctionPicture, HttpServletRequest request, Model model) {
		auction.setMemberNo(0); // 세션 적용완료되면 로그인객체에서 로그인정보 가져오기
		String filepath = null;
		
		if(!auctionPicture[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/auction/");
			
			MultipartFile file = auctionPicture[0];
			
			filepath = fileIo(file, savePath);
		}else {
			filepath = "preview.jpg";
		}
		auction.setAuctionPic(filepath);
		int result = service.insertAuction(auction);
		
		if(result>0) {
			model.addAttribute("direct", 1);
			model.addAttribute("msg", "경매 등록이 완료되었습니다!");
			return "auction/auctionRedirect"; // 추후 사업자 내 경매리스트 보는페이지로 변경			
		}else {			
			model.addAttribute("direct", 2);
			model.addAttribute("msg", "경매 등록에 실패했어요! 관리자에게 문의해 주세요.");
			return "auction/auctionRedirect";
		}
	}	
	
	// 파일1개와 저장위치를 넣고 최종 저장 파일명을 리턴해주는 메소드
	private String fileIo(MultipartFile file, String savePath) {
		String filepath = null;
		
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0,filename.lastIndexOf("."));
		String extention = filename.substring(filename.lastIndexOf("."));
		
		int count = 0;
		
		while(true) {
			if(count==0) {
				filepath = onlyFilename+extention;
			}else {
				filepath = onlyFilename+"_"+count+extention;
			}
			// 중복검사
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
				// 파일이 존재 안해야 해당 파일명을 사용할 수 있다.
			}
			count++;
		}
		
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
			BufferedOutputStream bos =new BufferedOutputStream(fos);
			
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return filepath; // 파일명 리턴
	} // 파일업로드 메소드 종료
	
} // 컨트롤러 종료