package com.douzonemania.scs.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.ProductRepository;
import com.douzonemania.scs.repository.StatisticsRepository;
import com.douzonemania.scs.vo.ceo.CategoryBarVo;
import com.douzonemania.scs.vo.ceo.CategoryDonutVo;
import com.douzonemania.scs.vo.ceo.ProductsCountVo;
import com.douzonemania.scs.vo.ceo.ProductsPaymentAmountVo;
import com.douzonemania.scs.vo.ceo.ProductsPaymentMarginVo;
import com.douzonemania.scs.vo.ceo.ProductsPriceVo;
import com.douzonemania.scs.vo.ceo.ProductsSalesVo;
import com.douzonemania.scs.vo.member.CategoryVo;

@Service
public class StatisticsService {

	@Autowired
	private StatisticsRepository statisticsRepository;
	
	@Autowired
	private ProductRepository productRepository;

	public Map<String, Object> categoryGraphByDate(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();

		/* 카테고리 TOP 5  구매건수 */
		List<CategoryDonutVo> donutList = statisticsRepository.findDonut(startDate, endDate, id);
		for (CategoryDonutVo vo : donutList) {
			int no = vo.getCategoryNo(); 
			String name = statisticsRepository.findName(no, id); 
			vo.setCategoryName(name);
		}

		List<String> temp = new ArrayList<String>();
		temp.add("text-primary");
		temp.add("text-info");
		temp.add("text-success");
		temp.add("text-danger");
		temp.add("text-pink");

		
		/* 카테고리별 일간 매출 */
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH ) + 1;
		int date = cal.get(Calendar.DATE) + 1;
		
		
		
		List<CategoryVo> categoryList = productRepository.getCategoryNameList(id); 
		System.out.println(categoryList.size());
		List<CategoryBarVo> dateList1 = new ArrayList<CategoryBarVo>();
		List<CategoryBarVo> dateList2 = new ArrayList<CategoryBarVo>();
		List<CategoryBarVo> dateList3 = new ArrayList<CategoryBarVo>();
		List<CategoryBarVo> dateList4 = new ArrayList<CategoryBarVo>();
		List<CategoryBarVo> dateList5 = new ArrayList<CategoryBarVo>();
		
		CategoryBarVo tempVo = new CategoryBarVo();
		tempVo.setDate(get7DayAgoDate(year, month, date, 0));
		dateList1.add(tempVo);
		for(int i=1; i<7; i++) {
			CategoryBarVo vo = new CategoryBarVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			dateList1.add(vo);
		}
		dateList2.add(tempVo);
		for(int i=1; i<7; i++) {
			CategoryBarVo vo = new CategoryBarVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			dateList2.add(vo);
		}
		dateList3.add(tempVo);
		for(int i=1; i<7; i++) {
			CategoryBarVo vo = new CategoryBarVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			dateList3.add(vo);
		}
		dateList4.add(tempVo);
		for(int i=1; i<7; i++) {
			CategoryBarVo vo = new CategoryBarVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			dateList4.add(vo);
		}
		dateList5.add(tempVo);
		for(int i=1; i<7; i++) {
			CategoryBarVo vo = new CategoryBarVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			
			dateList5.add(vo);
		}
		
		int length = categoryList.size();
		List<CategoryBarVo> barListTop1 = new ArrayList<CategoryBarVo>();
		List<CategoryBarVo> barListTop2 = new ArrayList<CategoryBarVo>();
		List<CategoryBarVo> barListTop3 = new ArrayList<CategoryBarVo>();
		List<CategoryBarVo> barListTop4 = new ArrayList<CategoryBarVo>();
		List<CategoryBarVo> barListTop5 = new ArrayList<CategoryBarVo>();
		if(length == 1) {
			barListTop1 = statisticsRepository.findBar(id, categoryList.get(0).getNo(), dateList1.get(6).getDate(), dateList1.get(0).getDate() );
		} else if(length == 2) {
			barListTop1 = statisticsRepository.findBar(id, categoryList.get(0).getNo(), dateList1.get(6).getDate(), dateList1.get(0).getDate() );
			barListTop2 = statisticsRepository.findBar(id, categoryList.get(1).getNo(), dateList2.get(6).getDate(), dateList2.get(0).getDate() );
		} else if(length == 3) {
			barListTop1 = statisticsRepository.findBar(id, categoryList.get(0).getNo(), dateList1.get(6).getDate(), dateList1.get(0).getDate() );
			barListTop2 = statisticsRepository.findBar(id, categoryList.get(1).getNo(), dateList2.get(6).getDate(), dateList2.get(0).getDate() );
			barListTop3 = statisticsRepository.findBar(id, categoryList.get(2).getNo(), dateList3.get(6).getDate(), dateList3.get(0).getDate() );
		} else if(length == 4) {
			barListTop1 = statisticsRepository.findBar(id, categoryList.get(0).getNo(), dateList1.get(6).getDate(), dateList1.get(0).getDate() );
			barListTop2 = statisticsRepository.findBar(id, categoryList.get(1).getNo(), dateList2.get(6).getDate(), dateList2.get(0).getDate() );
			barListTop3 = statisticsRepository.findBar(id, categoryList.get(2).getNo(), dateList3.get(6).getDate(), dateList3.get(0).getDate() );
			barListTop4 = statisticsRepository.findBar(id, categoryList.get(3).getNo(), dateList4.get(6).getDate(), dateList4.get(0).getDate() );
		} else if(length == 5) {
			barListTop1 = statisticsRepository.findBar(id, categoryList.get(0).getNo(), dateList1.get(6).getDate(), dateList1.get(0).getDate() );
			barListTop2 = statisticsRepository.findBar(id, categoryList.get(1).getNo(), dateList2.get(6).getDate(), dateList2.get(0).getDate() );
			barListTop3 = statisticsRepository.findBar(id, categoryList.get(2).getNo(), dateList3.get(6).getDate(), dateList3.get(0).getDate() );
			barListTop4 = statisticsRepository.findBar(id, categoryList.get(3).getNo(), dateList4.get(6).getDate(), dateList4.get(0).getDate() );
			barListTop5 = statisticsRepository.findBar(id, categoryList.get(4).getNo(), dateList5.get(6).getDate(), dateList5.get(0).getDate() );
		}
		
		for (CategoryBarVo vo : barListTop1) {
			int no = vo.getCategoryNo(); 
			String name = statisticsRepository.findName(no, id); 
			vo.setCategoryName(name);
		}
		for (CategoryBarVo vo : barListTop2) {
			int no = vo.getCategoryNo(); 
			String name = statisticsRepository.findName(no, id); 
			vo.setCategoryName(name);
		}
		for (CategoryBarVo vo : barListTop3) {
			int no = vo.getCategoryNo(); 
			String name = statisticsRepository.findName(no, id); 
			vo.setCategoryName(name);
		}
		for (CategoryBarVo vo : barListTop4) {
			int no = vo.getCategoryNo(); 
			String name = statisticsRepository.findName(no, id); 
			vo.setCategoryName(name);
		}
		for (CategoryBarVo vo : barListTop5) {
			int no = vo.getCategoryNo(); 
			String name = statisticsRepository.findName(no, id); 
			vo.setCategoryName(name);
		}
		
		for (CategoryBarVo vo : barListTop1) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(dateList1.get(i).getDate())) {
					dateList1.get(i).setCategoryName(vo.getCategoryName());
					dateList1.get(i).setCategoryNo(vo.getCategoryNo());
					dateList1.get(i).setTotalPrice(vo.getTotalPrice());
					dateList1.get(i).setDate(vo.getDate());
				}
			}
		}
		for (CategoryBarVo vo : barListTop2) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(dateList2.get(i).getDate())) {
					dateList2.get(i).setCategoryName(vo.getCategoryName());
					dateList2.get(i).setCategoryNo(vo.getCategoryNo());
					dateList2.get(i).setTotalPrice(vo.getTotalPrice());
					dateList2.get(i).setDate(vo.getDate());
				}
			}
		}
		
		for (CategoryBarVo vo : barListTop3) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(dateList3.get(i).getDate())) {
					dateList3.get(i).setCategoryName(vo.getCategoryName());
					dateList3.get(i).setCategoryNo(vo.getCategoryNo());
					dateList3.get(i).setTotalPrice(vo.getTotalPrice());
					dateList3.get(i).setDate(vo.getDate());
				}
			}
		}
		
		for (CategoryBarVo vo : barListTop4) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(dateList4.get(i).getDate())) {
					dateList4.get(i).setCategoryName(vo.getCategoryName());
					dateList4.get(i).setCategoryNo(vo.getCategoryNo());
					dateList4.get(i).setTotalPrice(vo.getTotalPrice());
					dateList4.get(i).setDate(vo.getDate());
				}
			}
		}
		
		for (CategoryBarVo vo : barListTop5) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(dateList5.get(i).getDate())) {
					dateList5.get(i).setCategoryName(vo.getCategoryName());
					dateList5.get(i).setCategoryNo(vo.getCategoryNo());
					dateList5.get(i).setTotalPrice(vo.getTotalPrice());
					dateList5.get(i).setDate(vo.getDate());
				}
			}
		}

		System.out.println(dateList1);
		
		map.put("donutList", donutList);
		map.put("dateList1", dateList1);
		map.put("dateList2", dateList2);
		map.put("dateList3", dateList3);
		map.put("dateList4", dateList4);
		map.put("dateList5", dateList5);
		map.put("categoryList", categoryList);
		map.put("temp", temp);
		
		return map;
	}

	
	private String get7DayAgoDate(int year , int month , int day, int i) {
		Calendar cal = Calendar
				.getInstance();
		cal.set(year, month-1, day);
		cal.add(Calendar.DATE, -i);
		java.util.Date weekago = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",
				Locale.getDefault());
		return formatter.format(weekago);
	}

	/* products 통계 */
	public Map<String, Object> productsGraphByDate(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<String> temp = new ArrayList<String>();
		temp.add("text-primary");
		temp.add("text-info");
		temp.add("text-success");
		temp.add("text-danger");
		temp.add("text-pink");
		
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH ) + 1;
		int date = cal.get(Calendar.DATE) + 1;
		
		/*  1  */ 
		List<ProductsSalesVo> oneResultList = new ArrayList<ProductsSalesVo>();
		ProductsSalesVo tempVo1 = new ProductsSalesVo();
		tempVo1.setDate(get7DayAgoDate(year, month, date, 0));
		oneResultList.add(tempVo1);
		for(int i=1; i<7; i++) {
			ProductsSalesVo vo = new ProductsSalesVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			oneResultList.add(vo);
		}
		
		List<ProductsSalesVo> productsSalesVo = statisticsRepository.findSales(oneResultList.get(6).getDate(), oneResultList.get(0).getDate(), id);

		for (ProductsSalesVo vo : productsSalesVo) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.equals(oneResultList.get(i).getDate())) {
					oneResultList.get(i).setDate(vo.getDate());
					oneResultList.get(i).setTotalSales(vo.getTotalSales());
				}
			}
		}
		/*  2  */ 
		List<ProductsPaymentAmountVo> twoResultList = new ArrayList<ProductsPaymentAmountVo>();
		ProductsPaymentAmountVo tempVo2 = new ProductsPaymentAmountVo();
		tempVo2.setDate(get7DayAgoDate(year, month, date, 0));
		twoResultList.add(tempVo2);
		for(int i=1; i<7; i++) {
			ProductsPaymentAmountVo vo = new ProductsPaymentAmountVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			twoResultList.add(vo);
		}

		
		List<ProductsPaymentAmountVo> productsPaymentAmountVo = statisticsRepository.findSales2(twoResultList.get(6).getDate(),twoResultList.get(0).getDate(), id);
		
		
		
		for (ProductsPaymentAmountVo vo : productsPaymentAmountVo) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.equals(twoResultList.get(i).getDate())) {
					twoResultList.get(i).setDate(vo.getDate());
					twoResultList.get(i).setCount(vo.getCount());
					twoResultList.get(i).setTotalPrice(vo.getTotalPrice());
					if(vo.getTotalPrice()==0) {
						twoResultList.get(i).setResultPrice(0);
					}else {
						twoResultList.get(i).setResultPrice(vo.getTotalPrice()/vo.getCount());
					}
				}
			}
		}
		
		/*  3  */
		List<ProductsPaymentMarginVo> threeResultList = new ArrayList<ProductsPaymentMarginVo>();
		ProductsPaymentMarginVo tempVo3 = new ProductsPaymentMarginVo();
		tempVo3.setDate(get7DayAgoDate(year, month, date, 0));
		threeResultList.add(tempVo3);
		for(int i=1; i<7; i++) {
			ProductsPaymentMarginVo vo = new ProductsPaymentMarginVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			threeResultList.add(vo);
		}
		List<ProductsPaymentMarginVo> productsPaymentMarginVo = statisticsRepository.findSales3(threeResultList.get(6).getDate(),threeResultList.get(0).getDate(), id);
		
		for (ProductsPaymentMarginVo vo : productsPaymentMarginVo) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.equals(threeResultList.get(i).getDate())) {
					threeResultList.get(i).setDate(vo.getDate());
					threeResultList.get(i).setTotalMargin(vo.getTotalMargin());
				}
			}
		}
		
		/*  4  */
		List<ProductsCountVo> productsCountVo1 = new ArrayList<ProductsCountVo>();
		List<ProductsCountVo> productsCountVo2 = new ArrayList<ProductsCountVo>();
		List<ProductsCountVo> productsCountVo3 = new ArrayList<ProductsCountVo>();
		List<ProductsCountVo> productsCountVo4 = new ArrayList<ProductsCountVo>();
		List<ProductsCountVo> productsCountVo5 = new ArrayList<ProductsCountVo>();
		
		ProductsCountVo tempVo4 = new ProductsCountVo();
		tempVo4.setDate(get7DayAgoDate(year, month, date, 0));
		productsCountVo1.add(tempVo4);
		for(int i=1; i<7; i++) {
			ProductsCountVo vo = new ProductsCountVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsCountVo1.add(vo);
		}
		productsCountVo2.add(tempVo4);
		for(int i=1; i<7; i++) {
			ProductsCountVo vo = new ProductsCountVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsCountVo2.add(vo);
		}
		productsCountVo3.add(tempVo4);
		for(int i=1; i<7; i++) {
			ProductsCountVo vo = new ProductsCountVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsCountVo3.add(vo);
		}
		productsCountVo4.add(tempVo4);
		for(int i=1; i<7; i++) {
			ProductsCountVo vo = new ProductsCountVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsCountVo4.add(vo);
		}
		productsCountVo5.add(tempVo4);
		for(int i=1; i<7; i++) {
			ProductsCountVo vo = new ProductsCountVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsCountVo5.add(vo);
		}
		
		List<ProductsCountVo> totalCountList = statisticsRepository.findSales4(productsCountVo1.get(6).getDate(),productsCountVo1.get(0).getDate(), id);
		
		System.out.println(totalCountList);
		
		List<ProductsCountVo> productstCountVo1 = new ArrayList<ProductsCountVo>();
		List<ProductsCountVo> productstCountVo2 = new ArrayList<ProductsCountVo>();
		List<ProductsCountVo> productstCountVo3 = new ArrayList<ProductsCountVo>();
		List<ProductsCountVo> productstCountVo4 = new ArrayList<ProductsCountVo>();
		List<ProductsCountVo> productstCountVo5 = new ArrayList<ProductsCountVo>();
		
		for (ProductsCountVo vo : totalCountList) {
			if(vo.getCount() == 1) {
				productstCountVo1.add(vo);
			} else if(vo.getCount() == 2) {
				productstCountVo2.add(vo);
			} else if(vo.getCount() == 3) {
				productstCountVo3.add(vo);
			} else if(vo.getCount() == 4) {
				productstCountVo4.add(vo);
			} else {
				productstCountVo5.add(vo);
			} 
			
		}
		
		for (ProductsCountVo vo : productstCountVo1) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsCountVo1.get(i).getDate())) {
					productsCountVo1.get(i).setCount(vo.getCount());
					productsCountVo1.get(i).setDate(vo.getDate());
				}
			}
		}
		for (ProductsCountVo vo : productstCountVo2) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsCountVo2.get(i).getDate())) {
					productsCountVo2.get(i).setCount(vo.getCount());
					productsCountVo2.get(i).setDate(vo.getDate());
				}
			}
		}
		for (ProductsCountVo vo : productstCountVo3) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsCountVo3.get(i).getDate())) {
					productsCountVo3.get(i).setCount(vo.getCount());
					productsCountVo3.get(i).setDate(vo.getDate());
				}
			}
		}
		for (ProductsCountVo vo : productstCountVo4) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsCountVo4.get(i).getDate())) {
					productsCountVo4.get(i).setCount(vo.getCount());
					productsCountVo4.get(i).setDate(vo.getDate());
				}
			}
		}
		for (ProductsCountVo vo : productstCountVo5) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsCountVo5.get(i).getDate())) {
					productsCountVo5.get(i).setCount(vo.getCount());
					productsCountVo5.get(i).setDate(vo.getDate());
				}
			}
		}

		/*  5  */
		List<ProductsPriceVo> productsPriceVo1 = new ArrayList<ProductsPriceVo>();
		List<ProductsPriceVo> productsPriceVo2 = new ArrayList<ProductsPriceVo>();
		List<ProductsPriceVo> productsPriceVo3 = new ArrayList<ProductsPriceVo>();
		List<ProductsPriceVo> productsPriceVo4 = new ArrayList<ProductsPriceVo>();
		List<ProductsPriceVo> productsPriceVo5 = new ArrayList<ProductsPriceVo>();
		ProductsPriceVo tempVo5 = new ProductsPriceVo();
		tempVo5.setDate(get7DayAgoDate(year, month, date, 0));
		productsPriceVo1.add(tempVo5);
		for(int i=1; i<7; i++) {
			ProductsPriceVo vo = new ProductsPriceVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsPriceVo1.add(vo);
		}
		productsPriceVo2.add(tempVo5);
		for(int i=1; i<7; i++) {
			ProductsPriceVo vo = new ProductsPriceVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsPriceVo2.add(vo);
		}
		productsPriceVo3.add(tempVo5);
		for(int i=1; i<7; i++) {
			ProductsPriceVo vo = new ProductsPriceVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsPriceVo3.add(vo);
		}
		productsPriceVo4.add(tempVo5);
		for(int i=1; i<7; i++) {
			ProductsPriceVo vo = new ProductsPriceVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsPriceVo4.add(vo);
		}
		productsPriceVo5.add(tempVo5);
		for(int i=1; i<7; i++) {
			ProductsPriceVo vo = new ProductsPriceVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			productsPriceVo5.add(vo);
		}
		
		List<ProductsPriceVo> productsPriceResultVo1 = statisticsRepository.findSales5(productsPriceVo1.get(6).getDate(),productsPriceVo1.get(0).getDate(), id, 0, 20000);
		List<ProductsPriceVo> productsPriceResultVo2 = statisticsRepository.findSales5(productsPriceVo2.get(6).getDate(),productsPriceVo2.get(0).getDate(), id, 20000, 40000);
		List<ProductsPriceVo> productsPriceResultVo3 = statisticsRepository.findSales5(productsPriceVo3.get(6).getDate(),productsPriceVo3.get(0).getDate(), id, 40000, 60000);
		List<ProductsPriceVo> productsPriceResultVo4 = statisticsRepository.findSales5(productsPriceVo4.get(6).getDate(),productsPriceVo4.get(0).getDate(), id, 60000, 80000);
		List<ProductsPriceVo> productsPriceResultVo5 = statisticsRepository.findSales5(productsPriceVo5.get(6).getDate(),productsPriceVo5.get(0).getDate(), id, 80000, 999999);
		
		for (ProductsPriceVo vo : productsPriceResultVo1) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsPriceVo1.get(i).getDate())) {
					productsPriceVo1.get(i).setCount(vo.getCount());
					productsPriceVo1.get(i).setDate(vo.getDate());
				}
			}
		}
		for (ProductsPriceVo vo : productsPriceResultVo2) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsPriceVo2.get(i).getDate())) {
					productsPriceVo2.get(i).setCount(vo.getCount());
					productsPriceVo2.get(i).setDate(vo.getDate());
				}
			}
		}
		for (ProductsPriceVo vo : productsPriceResultVo3) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsPriceVo3.get(i).getDate())) {
					productsPriceVo3.get(i).setCount(vo.getCount());
					productsPriceVo3.get(i).setDate(vo.getDate());
				}
			}
		}
		for (ProductsPriceVo vo : productsPriceResultVo4) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsPriceVo4.get(i).getDate())) {
					productsPriceVo4.get(i).setCount(vo.getCount());
					productsPriceVo4.get(i).setDate(vo.getDate());
				}
			}
		}
		for (ProductsPriceVo vo : productsPriceResultVo5) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(productsPriceVo5.get(i).getDate())) {
					productsPriceVo5.get(i).setCount(vo.getCount());
					productsPriceVo5.get(i).setDate(vo.getDate());
				}
			}
		}
		
		
		
		
		
		map.put("oneResultList", oneResultList);
		map.put("twoResultList", twoResultList);
		map.put("threeResultList", threeResultList);
		
		map.put("productsCountVo1", productsCountVo1);
		map.put("productsCountVo2", productsCountVo2);
		map.put("productsCountVo3", productsCountVo3);
		map.put("productsCountVo4", productsCountVo4);
		map.put("productsCountVo5", productsCountVo5);
		
		map.put("productsPriceVo1", productsPriceVo1);
		map.put("productsPriceVo2", productsPriceVo2);
		map.put("productsPriceVo3", productsPriceVo3);
		map.put("productsPriceVo4", productsPriceVo4);
		map.put("productsPriceVo5", productsPriceVo5);
		
		map.put("temp", temp);
		
		return map;
	}
	
}
