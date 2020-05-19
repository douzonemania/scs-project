package com.douzonemania.scs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.ShipCompanyRepository;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;

@Service
public class ShipCompanyService {

	@Autowired
	private ShipCompanyRepository shipCompanyRepository;
	
	
	public List<ShipCompanyVo> getShipList(String id) {
		List<ShipCompanyVo> list = shipCompanyRepository.getList(id);
		return list;
	}


	public int insertShip(ShipCompanyVo shipCompanyVo) {
		
		return shipCompanyRepository.insertShip(shipCompanyVo);
		
	}


	public int shipCount(String id) {
		//	id처리
		return shipCompanyRepository.shipCount("syj8033");
	}


	public boolean deleteShip(Long no) {
		return shipCompanyRepository.deleteShip(no) == 1;
	}
}
