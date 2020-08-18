package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 로그인 DAO
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public Member login(Member member) throws Exception {
		return sqlSession.selectOne("memberMapper.loginMember", member);
		// memberMapper라는 namespace를 갖는 mapper 파일에
		// id가 loginMember인 태그를 수행하는데 수행 시 필요한 파라미터로 member를 전달
	}

	/** 회원가입 DAO
	 * @param signUpMember
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member signUpMember) throws Exception {
		return sqlSession.insert("memberMapper.signUp", signUpMember);
	}

}
