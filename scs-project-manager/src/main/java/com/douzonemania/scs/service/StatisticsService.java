package com.douzonemania.scs.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.StatisticsRepository;

@Service
public class StatisticsService {

	@Autowired
	private StatisticsRepository statisticsRepository;

	public Map<String, Object> categoryGraphByDate(String startDate, String endDate, String id) {
		
		
		
		return null;
	}
	
	
}
