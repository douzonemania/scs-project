package com.douzonemania.scs.vo.ceo;

public class MainStatementVo {
	private int orderCompleted; // 주문완료
	private int depositCompleted; // 입금완료
	private int readyDelivery; // 배송준비중
	private int shipping; // 배송중
	private int deliveryCompleted; // 배송완료
	private int cancelProcessing; // 취소처리중
	private int exchangeProcessing; // 교환처리중
	private int refundProcessing; // 환불처리중
	private int processingCompleted; // 처리완료


	public int getOrderCompleted() {
		return orderCompleted;
	}

	public void setOrderCompleted(int orderCompleted) {
		this.orderCompleted = orderCompleted;
	}

	public int getDepositCompleted() {
		return depositCompleted;
	}

	public void setDepositCompleted(int depositCompleted) {
		this.depositCompleted = depositCompleted;
	}

	public int getReadyDelivery() {
		return readyDelivery;
	}

	public void setReadyDelivery(int readyDelivery) {
		this.readyDelivery = readyDelivery;
	}

	public int getShipping() {
		return shipping;
	}

	public void setShipping(int shipping) {
		this.shipping = shipping;
	}

	public int getDeliveryCompleted() {
		return deliveryCompleted;
	}

	public void setDeliveryCompleted(int deliveryCompleted) {
		this.deliveryCompleted = deliveryCompleted;
	}

	public int getCancelProcessing() {
		return cancelProcessing;
	}

	public void setCancelProcessing(int cancelProcessing) {
		this.cancelProcessing = cancelProcessing;
	}

	public int getExchangeProcessing() {
		return exchangeProcessing;
	}

	public void setExchangeProcessing(int exchangeProcessing) {
		this.exchangeProcessing = exchangeProcessing;
	}

	public int getRefundProcessing() {
		return refundProcessing;
	}

	public void setRefundProcessing(int refundProcessing) {
		this.refundProcessing = refundProcessing;
	}

	public int getProcessingCompleted() {
		return processingCompleted;
	}

	public void setProcessingCompleted(int processingCompleted) {
		this.processingCompleted = processingCompleted;
	}

	@Override
	public String toString() {
		return "MainStatementVo [orderCompleted=" + orderCompleted + ", depositCompleted=" + depositCompleted
				+ ", readyDelivery=" + readyDelivery + ", shipping=" + shipping + ", deliveryCompleted="
				+ deliveryCompleted + ", cancelProcessing=" + cancelProcessing + ", exchangeProcessing="
				+ exchangeProcessing + ", refundProcessing=" + refundProcessing + ", processingCompleted="
				+ processingCompleted + "]";
	}

}
