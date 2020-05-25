package com.douzonemania.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.shop.repository.MainRepository;
import com.douzonemania.shop.vo.MemberVo;

@Service
public class MainService {

	@Autowired
	private MainRepository mainRepository;
	
	public MemberVo getList() {
		return mainRepository.getList();
	}
}
