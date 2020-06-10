package com.douzonemania.scs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.DesignRepository;
import com.douzonemania.scs.vo.ceo.MainMenuVo;

@Service
public class DesignService {

	@Autowired
	DesignRepository designRepository;
	

	public boolean insertMainMenu(String id, MainMenuVo vo) {
		MainMenuVo mainMenuVo = new MainMenuVo();
		
		String menu = vo.getFirst() + ":" + vo.getSecond() + ":" + vo.getThird()
				+ ":" + vo.getFourth() + ":" + vo.getFifth();
		String menuList[] = menu.split(":");

		int listCount = 0;
		for(int i = 0; i < menuList.length; i++) {
			if(!menuList[i].equals("")) {
				if(listCount == 0) {
					mainMenuVo.setFirst(menuList[i]);
					listCount++;
				} else if(listCount == 1) {
					mainMenuVo.setSecond(menuList[i]);
					listCount++;
				} else if(listCount == 2) {
					mainMenuVo.setThird(menuList[i]);
					listCount++;
				} else if(listCount == 3) {
					mainMenuVo.setFourth(menuList[i]);
					listCount++;
				} else if(listCount == 4){
					mainMenuVo.setFifth(menuList[i]);
				}
			}
		}
		mainMenuVo.setId(id);
		
		// design insert or update 판별
		// insert
		if(designRepository.checkInsertOrUpdate(id) == null) {
			int count = designRepository.insertMainMenu(id, mainMenuVo);
			return count == 1;
			
		} else {		// insert를 한 경우(update 해줘야함)
			int count = designRepository.updateMainMenu(id, mainMenuVo);
			return count == 1;
		}
	}
	
	
}
