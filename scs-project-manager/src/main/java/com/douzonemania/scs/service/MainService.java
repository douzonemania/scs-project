package com.douzonemania.scs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.MainRepository;
import com.douzonemania.scs.vo.ceo.CeoVo;

@Service
public class MainService {

	@Autowired
	private MainRepository mainRepository;
	
	public CeoVo getList() {
		return mainRepository.getList();
	}
}
