package kr.or.donation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.or.donation.model.service.DonationService;
import kr.or.donation.model.vo.Donation;
import kr.or.member.model.vo.Member;

@Controller
public class DonationController {
	@Autowired
	private DonationService service;
	
	//main
	@RequestMapping(value="/donationList.kh")
	public String donationList(Model model) {
		ArrayList<Donation> dl = service.selectDonationList();
		model.addAttribute("list",dl);
		return "donation/donationMain";
	}
	
	//insert
	@RequestMapping(value="/donationWriter.kh") //기부신규등록 버튼 클릭 시 이동할 form
	public String donationWriter() {
		return "donation/donationWriterForm";
	}
	
	@RequestMapping(value="/insertDonation.kh")
	public String insertDonation(Member m, Donation d, MultipartFile upfile, HttpServletRequest request, Model model) {
		
		if(upfile.isEmpty()) {
			return "donation/donationWriterForm";
		}else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/donation/");
			String filename = upfile.getOriginalFilename();
			
			d.setDonationImgname(filename);
			d.setDonationImgpath(savePath);
			d.setMemberNo(m.getMemberNo());
			
			int result = service.insertDonation(d);
			return "donation/donationMain";
		}
	}
	
	//update
	@RequestMapping(value="/donationUpdateWriter.kh")
	public String updateDonation() {
		return "donation/donationUpdateWriterForm";
	}
	
	@RequestMapping(value="/updateDonation.kh")
	public String updateDonation(Donation d) {
		int result = service.updateDonation(d);
		return "donation/donationMain";
	}
	
	//select
	@RequestMapping(value="/donationView")
	public String donationView(){
		return null;
	}
	
	
	
}
