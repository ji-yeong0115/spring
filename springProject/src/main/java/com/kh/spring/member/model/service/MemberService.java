package com.kh.spring.member.model.service;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {

	/* Service Interface를 사용하는 이유
	 * 1. 프로젝트에 규칙성을 부여할 수 있음
	 * 2. 클래스간의 결합도 약화를 위해 사용
	 * 3. Spring의 AOP를 사용하기 위함
	 * 	-> 최근에는 없어도 AOP를 사용할 수 있지만 예전 코드와의 호환을 위해 사용
	 * 
	 * + 전자정부 프레임워크(Spring MVC 기반 프레임워크)의 구조와 같기 때문
	 */

	// 인터페이스는 묵시적으로 public abstract (생략 가능)
	/** 로그인 Service
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public abstract Member login(Member member);// 추상 메소드

	/** 회원가입 Service
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	public abstract int signUp(Member signUpMember) throws Exception;
	

	public abstract int idDupCheck(String memberId);
}
