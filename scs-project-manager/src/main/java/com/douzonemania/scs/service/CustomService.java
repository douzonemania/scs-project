package com.douzonemania.scs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.CustomRepository;
import com.douzonemania.scs.vo.ceo.ContentsVo;
import com.douzonemania.scs.vo.ceo.CustomDesignVo;



@Service
public class CustomService {

	@Autowired
	private CustomRepository customRepository;
	
	public List<CustomDesignVo> getCustomDesignBySubMenu(int subMenuNo) {
		return customRepository.getCustomDesignBySubMenu(subMenuNo);
	}

	public List<ContentsVo> getContentsByCustomNo(int customNo) {
		return customRepository.getContentsByCustomNo(customNo);
	}
	
}
