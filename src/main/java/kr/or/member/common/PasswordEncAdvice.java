package kr.or.member.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.member.common.SHA256Enc;
import kr.or.member.model.vo.Member;

@Component
@Aspect
public class PasswordEncAdvice {
	@Autowired
	private SHA256Enc enc;
	
	@Pointcut(value = "execution(* kr.or.member.model.service.MemberService.*Member(kr.or.member.model.vo.Member))")
	public void encPointcut() {}
	
	@Before(value="encPointcut()")//메소드 수행전에 비밀번호 암호화되어야 하므로 Before로 한 것
	public void encPassword(JoinPoint jp) {
		String methodName = jp.getSignature().getName();//AOP가 동작할 메소드이름
		Object[] args = jp.getArgs();//멤버타입 객체 1개 매개변수로 받는 Object[]
		Member m = (Member)args[0];
		String beforePw = m.getMemberPw();
		try {
			String encPw = enc.endData(beforePw);
			m.setMemberPw(encPw);
			System.out.println("암호화 비밀번호 : "+encPw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("암호화 메소드 : "+methodName);
		System.out.println("암호화 전 비밀번호 : "+beforePw);
	}
}
