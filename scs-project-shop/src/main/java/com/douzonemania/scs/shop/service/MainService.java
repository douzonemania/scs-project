package com.douzonemania.scs.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.shop.repository.MainRepository;
import com.douzonemania.scs.vo.MemberVo;

@Service
public class MainService {

	@Autowired
	private MainRepository mainRepository;
	
	public MemberVo getList() {
		return mainRepository.getList();
	}
}
