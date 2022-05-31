package kr.or.donation.controller;

import org.apache.catalina.valves.rewrite.Substitution.MapElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.donation.model.service.DonationService;
import kr.or.donation.model.vo.Donation;
import kr.or.member.model.vo.Member;

@Controller
public class DonationController {
	@Autowired
	private DonationService service;
	
	
	// mainAllList
	@RequestMapping(value = "/donationList.kh")
	public String donationList(Model model) {
		ArrayList<Donation> list = service.selectDonationList();
		ArrayList<Donation> generalList = new ArrayList<Donation>();
		ArrayList<Donation> cashList = new ArrayList<Donation>();
		
		
		for(Donation d: list) {
			if(d.getDonationDivision()==2) {
				cashList.add(d);
			}else {
				generalList.add(d);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("cashList",cashList);
		model.addAttribute("generalList",generalList);
		System.out.println(generalList);
		return "donation/donationMain";
	}
	@RequestMapping(value="/donationMain.kh")
	public String donationMain() {
		return "donation/donationMain";
	}

	// insert
	@RequestMapping(value = "/insertDonation.kh")
	public String insertDonation(@SessionAttribute Member m, Donation d, MultipartFile upfile, HttpServletRequest request, Model model) {
		if (upfile.isEmpty()) {
			// 첨부파일 없는경우 수행할 로직 없음
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/donation/");
			String filename = upfile.getOriginalFilename();
			String filepath = fileIo(upfile, savePath);

			d.setDonationImgname(filename);
			String realfilepath = "../../../resources/upload/donation/"+filepath;
			d.setDonationImgpath(realfilepath);
			d.setMemberNo(m.getMemberNo());
			

			int result = service.insertDonation(d);
			
			
		}// 파일1개와 저장위치를 넣고 최종 저장 파일명을 리턴해주는 메소드
		return "redirect:/donationMain.kh";
	}

	// update
	@RequestMapping(value = "/updateDonation.kh")
	public String updateDonation(Donation d) {
		int result = service.updateDonation(d);
		return "donation/donationMain";
	}

	// select
	@RequestMapping(value = "//donationClick.kh")
	public String donationView(Donation d, Model model) {
		Donation donation = service.selectOneDonation(d);
		model.addAttribute("donation", d);
		return "donation/donationView";
	}

	@RequestMapping(value = "//donationClick2.kh")
	public String donationView2(Donation d, Model model) {
		Donation donation = service.selectOneDonation(d);
		model.addAttribute("donation", d);
		return "donation/donationView2";
	}
	@RequestMapping(value="//donationHashtag.kh")
	public String donationHashtag(HttpServletRequest request, Model model) {
		String donationCategory = request.getParameter("donationCategory"); //카테고리명가져오기
		
		ArrayList<Donation> list = service.selectHashtag(donationCategory); //카테고리 리스트 불러오기
		int sumDonationCategory = service.selectsumDonationCategory(donationCategory); //각 카테고리 총 기부 합계
		
		model.addAttribute("list",list);
		model.addAttribute("sumDonationCategory",sumDonationCategory);
		model.addAttribute("donationCategory",donationCategory);
		return "donation/donationHashtagView";
	}

//-------------------------------페이지이동
	@RequestMapping(value = "/donationWriter.kh") // 기부신규등록 버튼 클릭 시 이동할 form
	public String donationWriter() {
		return "donation/donationWriterForm";
	}

	@RequestMapping(value = "/donationUpdateWriter.kh") // 기부 수정페이지로 이동할 form
	public String updateDonation() {
		return "donation/donationUpdateWriterForm";
	}

	//------------------------------- 임시
	@RequestMapping(value = "/donationClick.kh")
	public String donationClick() {
		return "donation/donationView";
	}

	@RequestMapping(value = "/donationClick2.kh")
	public String donationClick2() {
		return "donation/donationView2";
	}

	@RequestMapping(value = "/donationUpdate.kh")
	public String donationUpdate() {
		return "donation/donationUpdateForm";
	}
	@RequestMapping(value="/donationHashtag.kh")
	public String donationHashtag() {
		return "donation/donationHashtagView";
	}
	

//-------------------------------기타
	// 파일1개와 저장위치를 넣고 최종 저장 파일명을 리턴해주는 메소드
	private String fileIo(MultipartFile file, String savePath) {
		String filepath = null;

		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0, filename.lastIndexOf("."));
		String extention = filename.substring(filename.lastIndexOf("."));

		int count = 0;

		while (true) {
			if (count == 0) {
				filepath = onlyFilename + extention;
			} else {
				filepath = onlyFilename + "_" + count + extention;
			}
			// 중복검사
			File checkFile = new File(savePath + filepath);
			if (!checkFile.exists()) {
				break;
			}
			count++;
		}

		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
			BufferedOutputStream bos = new BufferedOutputStream(fos);
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

	// upload
	@ResponseBody
	@RequestMapping(value = "/uploadImage.kh")
	public String uploadImage(MultipartFile[] file, HttpServletRequest request)
			throws Exception {
		String filepath = null;
		if (!file[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/donation/");

			MultipartFile onefile = file[0];

			filepath = fileIo(onefile, savePath);
		}
		return "../../../resources/upload/donation/" + filepath;
	}
}