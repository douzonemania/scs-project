package com.douzonemania.shop.service;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;


import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.shop.repository.OrderRepository;
import com.douzonemania.shop.vo.CartVo;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ItemBoardVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.OptionVo;
import com.douzonemania.shop.vo.OrderListVo;
import com.douzonemania.shop.vo.ReviewVo;
import com.douzonemania.shop.vo.ShipVo;

@Service
public class OrderService {


	private static int LIST_SIZE =16;
	private static final int PAGE_SIZE =5;
	private static final String SAVE_PATH = "/scs-uploads";
	// private static final String SAVE_PATH = "C:\\Users\\bit\\git\\scs-project\\scs-project-manager\\src\\main\\webapp\\assets\\images\\scs-uploads";
	private static final String URL = "/assets/scs-manager/images";
	

	@Autowired
	private OrderRepository orderRepository;

	public Map<String, Object> find(int currentPage, String keyword, String option, int category, int subCategory,
			String db) {

		int offset = (currentPage - 1) * 16;
		int total = orderRepository.totalCount(option, keyword, category, subCategory, db);
		int pageCnt = (total % LIST_SIZE != 0) ? (total / LIST_SIZE) + 1 : (total / LIST_SIZE);
		int calCnt = (currentPage % 5) == 0 ? currentPage - 1 : currentPage;

		int beginPage = calCnt - (calCnt % 5) == 0 ? 1 : calCnt - (calCnt % 5) + 1;
		int prevPage = beginPage == 1 ? 1 : beginPage - 1;
		int endPage = (pageCnt - (pageCnt % 5)) == (calCnt - (calCnt % 5)) ? pageCnt : (beginPage + PAGE_SIZE) - 1;
		int nextPage = (pageCnt - (pageCnt % 5)) == (calCnt - (calCnt % 5)) ? pageCnt : endPage + 1;

		if (nextPage >= pageCnt)
			nextPage = pageCnt;
		if (endPage >= pageCnt)
			endPage = pageCnt;

		List<ItemVo> tempList = orderRepository.find(offset, subCategory, category, db);
		List<ItemVo> list = orderRepository.calReviewAvg(tempList, db);

		Map<String, Object> map = new HashMap<>();

		if (category != 0) {
			List<CategoryVo> categoryList = orderRepository.findCategoryList(category, db);
			map.put("category", categoryList);

		}
		
		map.put("categoryNo",category);
		map.put("subCategoryNo",subCategory);
		map.put("list", list);
		map.put("beginPage", beginPage);
		map.put("prevPage", prevPage);
		map.put("endPage", endPage);
		map.put("nextPage", nextPage);
		map.put("page", currentPage);
		map.put("total", total);
		map.put("kwd", keyword);

		if (endPage != pageCnt)
			map.put("listsize", PAGE_SIZE);
		else {
			if (endPage % 5 == 0) {
				map.put("listsize", 5);
			} else {
				map.put("listsize", endPage % 5);
			}
		}
	
		return map;

	}

	public Map<String, Object> findProduct(Integer no, String db) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		ItemVo vo = orderRepository.findProduct(no, db);
		String[] subImages = vo.getSubImage().split("\\?");
		List<String> list = new ArrayList<String>();

		byte[] b = vo.getEditor();

		vo.setEditor1(unCompressString(b));
		
		String viewer = "quill2.setContents([ " + vo.getEditor1() + "]);";

		map.put("detail", viewer);

		for (int i = 0; i < subImages.length; i++) {
			list.add(subImages[i]);
		}

		if (vo.getSale() != 0) {
			vo.setTotalPrice((int) ((int) vo.getNowPrice() - (vo.getNowPrice() * (0.01 * vo.getSale()))));
		}

		map.put("product", vo);
		map.put("subImages", list);

		return map;
	}

	public List<OptionVo> findOptionList(Integer no, String db) {

		List<OptionVo> list = orderRepository.findOptionList(no, db);

		return list;
	}

	public List<OptionVo> findSecondOption(int no, int option, String db) {

		List<OptionVo> list = orderRepository.findSecondOption(no, option, db);

		return list;

	}

	public void setCart(int no, int firstOption, int secondOption, int quantity, String db, long memberNo) {

		CartVo checkCart = orderRepository.checkAmount(no, firstOption, secondOption, db, memberNo);
		
		int stockNo = orderRepository.getStockNo(no, firstOption, secondOption, db);
		if (checkCart.getAmount() == 0) {
			orderRepository.insertCart(memberNo, quantity, stockNo, db);
		} else {
			int calAmount = checkCart.getAmount() + quantity;
			orderRepository.updateCart(db, checkCart.getNo(), calAmount);
		}

	}

	public List<ItemVo> setCartList(String db, long memberNo) {

		List<ItemVo> list = orderRepository.setCartList(db, memberNo);

		for (ItemVo itemVo : list) {
			int nowSale = itemVo.getSale();

			itemVo = setTotalPrice(nowSale, itemVo);
		}

		return list;
	}

	public void deleteCart(String db, Long long1, int cartNo) {

		orderRepository.deleteCart(db, long1, cartNo);

	}

	public void deleteCartAll(String db, Long no) {

		orderRepository.deleteCartAll(db, no);

	}

	public ItemVo setOrderItem(String db, Long no, Integer cartNo) {
		ItemVo temp = orderRepository.setOrderItem(db, no, cartNo);

		return temp;
	}

	public void setOrderPage(String db, Long no, List<Integer> cartNoList, List<Integer> amountList,
			HttpSession session) {
		List<ItemVo> list = new ArrayList();
		List<ShipVo> shipList = orderRepository.findShipAddressList(db, no);
		
		int index = 0;

		if (shipList.size() != 0) {
			session.setAttribute("shipListCheck", true);
			session.setAttribute("shipList", shipList);
			ShipVo vo = new ShipVo();
			for (ShipVo shipVo : shipList) {

				if (shipVo.isRecent() == true) {
					vo = shipVo;
				}
			}

			session.setAttribute("recentShip", vo);
		} else {
			session.setAttribute("shipListCheck", false);

		}

		for (Integer integer : cartNoList) {

			ItemVo temp = orderRepository.setOrderItem(db, no, integer);
			temp.setAmount(amountList.get(index++));

			int nowSale = temp.getSale();

			temp = setTotalPrice(nowSale, temp);
			list.add(temp);

		}
		session.setAttribute("orderList", list);
	}

	public void setOrderPage(String db, Long no, int itemNo, int firstOption, int secondOption, int quantity,
			HttpSession session) {

		List<ShipVo> shipList = orderRepository.findShipAddressList(db, no);
		List<ItemVo> list = new ArrayList();
		if (shipList.size() != 0) {
			session.setAttribute("shipListCheck", true);
			session.setAttribute("shipList", shipList);
			ShipVo vo = new ShipVo();
			for (ShipVo shipVo : shipList) {
				if (shipVo.isRecent() == true) {
					vo = shipVo;
				}
			}
			session.setAttribute("recentShip", vo);
		} else {
			session.setAttribute("shipListCheck", false);
		}
		ItemVo itemVo = orderRepository.findItem(itemNo, db);
		ItemVo optionVo = orderRepository.findOption(firstOption, secondOption, db);
		
		itemVo.setFirstOption(firstOption);
		itemVo.setFirstOptionName(optionVo.getFirstOptionName());
		if (secondOption != 0) {
			itemVo.setSecondOption(secondOption);
			itemVo.setSecondOptionName(optionVo.getSecondOptionName());
		}

		itemVo.setAmount(quantity);
		int nowSale = itemVo.getSale();
		itemVo = setTotalPrice(nowSale, itemVo);

		list.add(itemVo);

		session.setAttribute("orderList", list);
	}

	public String excuteOrder(String db, Long no, List<ItemVo> list, String shipMemo, int shipNo) {

		String orderNum = makeOrderNum(db);
		int result = orderRepository.insertOrder(db, orderNum, no, shipMemo, shipNo);

		for (ItemVo vo : list) {
			int itemNo = vo.getNo();
			int firstOption = vo.getFirstOption();
			int secondOption = vo.getSecondOption();

			int amount = vo.getAmount();
			int totalPrice = vo.getTotalPrice();

			int stockNo = orderRepository.findStockNo(db, no, itemNo, firstOption, secondOption);

			orderRepository.insertOrderItem(db, result, stockNo, amount, totalPrice, shipMemo);
			orderRepository.updateStock(db, stockNo, amount);

		}

		return orderNum;
	}

	public ItemVo setTotalPrice(int nowSale, ItemVo temp) {

		if (nowSale != 0) {
			int nowPrice = temp.getNowPrice();
			double calSale = (nowSale * 0.01);
			int totalPrice = nowPrice - (int) (nowPrice * calSale);
			temp.setTotalPrice(totalPrice);
		} else {
			temp.setTotalPrice(temp.getNowPrice());
		}

		return temp;
	}

	public int insertShip(String db, Long no, Map<String, Object> map) {

		ShipVo vo = new ShipVo();

		vo.setShipName(map.get("shipName").toString());
		vo.setPhoneNumber(map.get("phoneNumber").toString());
		vo.setAddress(map.get("address").toString());

		int shipNo = orderRepository.insertShip(db, no, vo);

		return shipNo;
	}

	public void updateShip(String db, Long no, Map<String, Object> map) {

		ShipVo vo = new ShipVo();

		String nowNoStr = map.get("shipNo").toString();
		int nowNo = Integer.parseInt(nowNoStr);

		vo.setShipName(map.get("shipName").toString());
		vo.setPhoneNumber(map.get("phoneNumber").toString());
		vo.setAddress(map.get("address").toString());
		vo.setNo(nowNo);

		orderRepository.updateShip(db, no, vo);

	}

	public String makeOrderNum(String db) {

		int recentOrderNum = orderRepository.findRecentOrderNum(db);
		recentOrderNum += 1;
		String convertNum = String.format("%04d", recentOrderNum);

		SimpleDateFormat nowDate = new SimpleDateFormat("yyyyMMdd");
		Date now = new Date();

		String nowDateString = nowDate.format(now);

		return nowDateString + "-" + convertNum;
	}

	public List<OrderListVo> getOrderList(String db, long no) {
		return orderRepository.getOrderList(db, no);
	}

	public List<OrderListVo> getOrderList(String db, Long no, String statement) {
		if ("oc".equals(statement)) {
			statement = "주문완료";
		} else if ("depc".equals(statement)) {
			statement = "입금완료";
		} else if ("pfd".equals(statement)) {
			statement = "배송준비중";
		} else if ("sip".equals(statement)) {
			statement = "배송중";
		} else if ("delc".equals(statement)) {
			statement = "배송완료";
		} else if ("canp".equals(statement)) {
			statement = "취소처리중";
		} else if ("chanp".equals(statement)) {
			statement = "교환처리중";
		} else if ("rp".equals(statement)) {
			statement = "환불처리중";
		} else if ("pc".equals(statement)) {
			statement = "처리완료";
		}
		return orderRepository.getOrderListByStatemnet(db, no, statement);
	}

	public List<OrderListVo> getOrderList(String db, Long no, String statement, String date) {
		if ("oc".equals(statement)) {
			statement = "주문완료";
		} else if ("depc".equals(statement)) {
			statement = "입금완료";
		} else if ("pfd".equals(statement)) {
			statement = "배송준비중";
		} else if ("sip".equals(statement)) {
			statement = "배송중";
		} else if ("delc".equals(statement)) {
			statement = "배송완료";
		} else if ("canp".equals(statement)) {
			statement = "취소처리중";
		} else if ("chanp".equals(statement)) {
			statement = "교환처리중";
		} else if ("rp".equals(statement)) {
			statement = "환불처리중";
		} else if ("pc".equals(statement)) {
			statement = "처리완료";
		}
		String[] arr = date.split(":");
		for (int i = 0; i < arr.length; i++) {
		}
		return orderRepository.getOrderListByStatemnet(db, no, statement, arr[0], arr[1]);
	}

	public int convertOption(String db, List<OrderListVo> oVo) {
		return orderRepository.ConvertOption(db, oVo);

	}

	public List<String> convertPrice(List<OrderListVo> oVo) {
		String price = "";
		List<String> totalPriceList = new ArrayList<>();
		for (int i = 0; i < oVo.size(); i++) {
			price = NumberFormat.getInstance().format(((int) ((double) oVo.get(i).getTotalPrice()))) + "원";
			totalPriceList.add(price);
		}
		return totalPriceList;
	}

	public List<Integer> getCountStatement(String db, List<OrderListVo> oVo) {
		List<Integer> stList = orderRepository.getCountStatement(db, oVo);
		return stList;
	}

	public int regReview(String db, ReviewVo rVo) {
		return orderRepository.regReview(db, rVo);
	}

	public List<ReviewVo> getReviewList(Integer no, String db) {
		return orderRepository.getReviewList(no, db);
	}

	public int updateReState(String db, int stockNo, String orderNo) {
		return orderRepository.updateReState(db, stockNo, orderNo);
	}

	public List<Integer> getRestate(String db, List<OrderListVo> oVo) {
		return orderRepository.getRestate(db, oVo);
	}

	public List<ItemBoardVo> getBoardList(Integer no, String db) {
		return orderRepository.getBoardList(no, db);
	}

	public Map<String, Object> getAllReviewList(int currentPage, String db) {
		LIST_SIZE = 5;

		Map<String, Object> map = new HashMap<>();

		int offset = (currentPage - 1) * 5;
		int total = orderRepository.getReviewCount(db);

		List<ReviewVo> list = orderRepository.getAllReviewList(db, LIST_SIZE, offset);

		int pageCnt = (total % LIST_SIZE != 0) ? (total / LIST_SIZE) + 1 : (total / LIST_SIZE);
		int calCnt = (currentPage % 5) == 0 ? currentPage - 1 : currentPage;
		int beginPage = calCnt - (calCnt % 5) == 0 ? 1 : calCnt - (calCnt % 5) + 1;
		int prevPage = beginPage == 1 ? 1 : beginPage - 1;
		int endPage = (pageCnt - (pageCnt % 5)) == (calCnt - (calCnt % 5)) ? pageCnt : (beginPage + PAGE_SIZE) - 1;
		int nextPage = (pageCnt - (pageCnt % 5)) == (calCnt - (calCnt % 5)) ? pageCnt : endPage + 1;

		if (nextPage >= pageCnt)
			nextPage = pageCnt;
		if (endPage >= pageCnt)
			endPage = pageCnt;

		List<ReviewVo> photoList = orderRepository.getPhotoReviewList(db);
		map.put("photoList", photoList);
		System.out.println("PHOTO:"+photoList);

		map.put("list", list);
		map.put("beginPage", beginPage);
		map.put("prevPage", prevPage);
		map.put("endPage", endPage);
		map.put("nextPage", nextPage);
		map.put("page", currentPage);
		map.put("total", total);
		map.put("calCnt", calCnt);

		if (endPage != pageCnt)
			map.put("listsize", LIST_SIZE);
		else {
			if (endPage % 5 == 0) {
				map.put("listsize", 5);
			} else {
				map.put("listsize", endPage % 5);
			}
		}

		return map;
	}

	public ReviewVo getReviewByNo(int no, String db) {
		return orderRepository.getReviewByNo(no, db);
	}


	public String restore(MultipartFile imgSource) {
	
		String url = "";
		try {
			if (imgSource.isEmpty()) {
				return url;
			}

			String originFilename = imgSource.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf('.') + 1);

			
			String saveFilename = generateSaveFilename(originFilename, extName);
			long fileSize = imgSource.getSize();


			byte[] fileData = imgSource.getBytes();
			
			OutputStream os = new FileOutputStream(SAVE_PATH + "/" + saveFilename);
			
			os.write(fileData);
			os.close();
			url = URL + "/" + saveFilename;
			
		} catch (IOException ex) {
			throw new RuntimeException("file upload error:" + ex);
		}
		return url;
	}
	
	private String generateSaveFilename(String originFileName, String extName) {
		String filename = "";

		Calendar calendar = Calendar.getInstance();
		filename += calendar.get(Calendar.YEAR);
		filename += calendar.get(Calendar.MONTH);
		filename += calendar.get(Calendar.DATE);
		filename += calendar.get(Calendar.HOUR);
		filename += calendar.get(Calendar.MINUTE);
		filename += calendar.get(Calendar.SECOND);
		filename += calendar.get(Calendar.MILLISECOND);
		filename += ("." + extName);
		return filename;
	}
	

//////////////////////////////////에디터 byte[] 압축////////////////////////////////////
	public static byte[] compressToByte(final String data) throws IOException {
		if (data == null || data.length() == 0) {
			return null;
		} else {
			byte[] bytes = data.getBytes("UTF-8");
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			GZIPOutputStream os = new GZIPOutputStream(baos);
			os.write(bytes, 0, bytes.length);
			os.close();
			byte[] result = baos.toByteArray();
			return result;
		}
	}

	public static String unCompressString(final byte[] data) throws IOException {
		if (data == null || data.length == 0) {
			return null;
		} else {
			ByteArrayInputStream bais = new ByteArrayInputStream(data);
			ByteArrayOutputStream buffer = new ByteArrayOutputStream();
			GZIPInputStream is = new GZIPInputStream(bais);
			byte[] tmp = new byte[256];
			while (true) {
				int r = is.read(tmp);
				if (r < 0) {
					break;
				}
				buffer.write(tmp, 0, r);
			}
			is.close();

			byte[] content = buffer.toByteArray();
			return new String(content, 0, content.length, "UTF-8");
		}
	}

}
