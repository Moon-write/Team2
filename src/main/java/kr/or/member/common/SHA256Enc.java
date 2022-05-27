package kr.or.member.common;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;

@Component
public class SHA256Enc {
	
	/*
	public String endData(String data) throws Exception{
		//1. Spring Security의 MessageDigest 객체(암호화 처리해주는 객체)를 통한 암호화
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");//암호화 알고리즘 중 SHA-256 알고리즘 사용
		//2. 매개변수로 받은 암호화 전 비밀번호를 byte배열로 변환
		byte[] beforePw = data.getBytes();
		//3. byte배열로 변환된 암호화전 비밀번호를 SHA-256으로 암호화
		mDigest.update(beforePw);
		//4. 암호화된 pw를 byte배열로 추출
		byte[] encStr = mDigest.digest();
		//byte -> 1byte로 정수 표현 -> 2진수 8자리 -> 표현할 수 있는 숫자 갯수 2^8 -> 256개 -> -128 ~ 127
		//5. 0 ~ 255로 변환하여 사용(16진수 -> 0 ~ f로 표현)
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<encStr.length;i++) {
			byte tmp = encStr[i];
			String tmpText = Integer.toString((tmp & 0xff)+0x100,16).substring(1);
			sb.append(tmpText);
		}
		return sb.toString();
		
	}
	*/
}
