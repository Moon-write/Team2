package kr.or.donation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		model.addAttribute("list", list);
		return "donation/donationMain";
	}

	// insert
	@RequestMapping(value = "/donationWriter.kh") // 기부신규등록 버튼 클릭 시 이동할 form
	public String donationWriter() {
		return "donation/donationWriterForm";
	}

	@RequestMapping(value = "/insertDonation.kh")
	public String insertDonation(Member m, Donation d, MultipartFile upfile, HttpServletRequest request, Model model) {

		if (upfile.isEmpty()) {
			return "donation/donationWriterForm";
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/donation/");
			String filename = upfile.getOriginalFilename();
			String filepath = fileIo(upfile, savePath);
			
			d.setDonationImgname(filename);
			d.setDonationImgpath(filepath);
			d.setMemberNo(m.getMemberNo());

			int result = service.insertDonation(d);
			return "donation/donationMain";
		}

		// 파일1개와 저장위치를 넣고 최종 저장 파일명을 리턴해주는 메소드

	}

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

	// update
	@RequestMapping(value = "/donationUpdateWriter.kh")
	public String updateDonation() {
		return "donation/donationUpdateWriterForm";
	}

	@RequestMapping(value = "/updateDonation.kh")
	public String updateDonation(Donation d) {
		int result = service.updateDonation(d);
		return "donation/donationMain";
	}

	// select
	@RequestMapping(value = "/donationView.kh")
	public String donationView(Donation d, Model model) {
		Donation donation = service.selectOneDonation(d);
		model.addAttribute("donation", d);
		return "donation/donationView";
	}

	// upload

	@ResponseBody
	@RequestMapping(value = "/uploadImage.kh")
	public void uploadImage(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

	}

}
