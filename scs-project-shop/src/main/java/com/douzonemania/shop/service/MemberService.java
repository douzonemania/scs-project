package com.douzonemania.shop.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.shop.repository.MemberRepository;
import com.douzonemania.shop.vo.MemberVo;

@Service
public class MemberService {

	@Autowired
	MemberRepository memberRepository;
	
	public boolean existUser(String id) {
		
		
		return memberRepository.existUser(id);
	}

	public void insertUser(@Valid MemberVo vo) {
		
		memberRepository.insertUser(vo);
		
	}

	public int findUser(@Valid MemberVo vo) {
		int result= memberRepository.findUser(vo);
		
		return result;
	}
	
}
