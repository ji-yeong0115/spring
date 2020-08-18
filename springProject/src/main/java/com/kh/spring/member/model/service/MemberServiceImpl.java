package com.kh.spring.member.model.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.member.model.dao.MemberDAO;
import com.kh.spring.member.model.vo.Member;

@Service // Service 레이어, 비즈니스 로직 처리를 하는 클래스임을 명시 + Bean 등록 
public class MemberServiceImpl implements MemberService {

	@Autowired // 등록된 MemberDAO bean을 이용해 의존성 주입(DI) 진행
	private MemberDAO memberDAO;
	
	@Autowired // bcrypt 암호화 객체 의존성 주입(DI)
	private BCryptPasswordEncoder bcPwd;
	
	@Override
	public Member login(Member member) {
		
		// bcrypt 방식으로 암호화를 진행한 경우
		// BCryptPasswordEncoder에서 제공하는 matches() 메소드를 이용해서
		// 입력 받은 비밀번호와 DB에 저장되어 있는 암호화된 비밀번호가 일치하는지 확인하는 작업 필요
		Member loginMember = memberDAO.login(member);
		
		if(loginMember != null) {
			
			if(!bcPwd.matches(member.getMemberPwd(), loginMember.getMemberPwd()) ) {
				// 입력한 비밀번호가 DB에 저장된 값과 같지 않을 경우
				loginMember = null;
			} else {
				// 비교가 끝난 조회된 비밀번호 삭제
				loginMember.setMemberPwd(null);
			}
		}
	
		
		return loginMember;
	}

	// 회원가입 Service 구현
	// 스프링에서는 트랜잭션을 처리할 방법을 제공해줌 (코드 기반, 선언적 방법)
	
	// 선언적 트랜잭션 처리 방법
	// 1) <tx:advice> -> AOP를 이용한 XML 작성 방법
	// 2) @Transactional 어노테이션을 이용한 작성 방법
	// - 인터페이스를 구현한 클래스로 생성된 bean은 
	//	  인터페이스에 작성되어있던 메소드에 한해서 트랜잭션 처리가 적용됨
	//  * 트랜잭션 처리를 위해서는 트랜잭션 매니저가 bean으로 등록되어 있어야 함
	// 	-> root-context.xml에 작성
	
	// @Transactional 어노테이션이 판별하는 정상 수행이란
	// RuntimeException이 발생되지 않은 경우를 나타냄
	// Checked Exception 발생 시 rollback 처리가 필요할 경우
	// rollbackFor 속성을 이용하여 rollback 대상 Exception class를 작성하면 됨
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member signUpMember) throws Exception {
		
		/* 1. 비밀번호를 평문으로 저장하면 안됨
		 *  -> 비밀번호 평문 저장은 범죄 행위
		 *  
		 * 2. SHA-512 방식의 암호화
		 *  -> 단방향 해쉬함수 (암호화 O, 복호화 X)
		 *  
		 * 문제점 : 같은 비밀번호는 암호화된 문자열(다이제스트)도 같음
		 *  -> 다이제스트가 많이 모일 경우 검색을 통해 얼마든지 해킹 가능
		 *  
		 *  -> 일반적인 컴퓨터 성능으로 1초에 56억개의 다이제스트 비교가 가능
		 *  
		 * 3. bcrypt 방식 암호화(salting 기법)
		 *  입력된 문자열을 암호화할 때 임의의 값(salt)를 추가하여 암호화를 진행함
		 *  -> 자체적으로 같은지 판별하는 메소드가 존재
		 * 
		 *  Spring-Security 모듈 + spring-security.xml 파일 생성
		 */
		
		String encPwd = bcPwd.encode(signUpMember.getMemberPwd());
		
		signUpMember.setMemberPwd(encPwd);
		
		int result = memberDAO.signUp(signUpMember);
		
		return result;
	}

	// ID 중복 검사  Service 구현
	@Override
	public int idDupCheck(String memberId){
		return memberDAO.idDupCheck(memberId);
	}

	// 회원 정보 수정 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMember(Member upMember) {
		
		int result = memberDAO.upMember(upMember);
		
		return result;
	}

}
