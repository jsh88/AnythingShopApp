package com.anyshop.domain;

public class Orders {

	private int oNo;
	private String id;
	private int pNo;
	private String name;
	private boolean auth;
	private int quantity;
	private String memo;
	private String  rName;
	private String rAddr;
	private int price;
	private int tPrice;
	private String pName;
	private String addr;
	private String phone;
	private String rPhone;
	private String pWay; 		// 결제 방법
	private String oDate; 		// 주문 날짜
	private String aDate; 		// 도착 날짜
	private int receipt; 			// 현금영수증 전화번호
	private boolean rState; 	// 소득공제용, 지출 증빙용
	private boolean state;	 	// 배송 상태
	private boolean pState; 	// 결제 상태	
	
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getrAddr() {
		return rAddr;
	}

	public void setrAddr(String rAddr) {
		this.rAddr = rAddr;
	}

	public String getrPhone() {
		return rPhone;
	}

	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}

	public String getpWay() {
		return pWay;
	}

	public void setpWay(String pWay) {
		this.pWay = pWay;
	}

	public int getReceipt() {
		return receipt;
	}

	public void setReceipt(int receipt) {
		this.receipt = receipt;
	}

	public boolean isrState() {
		return rState;
	}

	public void setrState(boolean rState) {
		this.rState = rState;
	}

	public boolean ispState() {
		return pState;
	}

	public void setpState(boolean pState) {
		this.pState = pState;
	}

	public int gettPrice() {
		return tPrice;
	}

	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public void setAuth(boolean auth) {
		this.auth = auth;
	}

	public boolean isAuth() {
		return auth;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

}