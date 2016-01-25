package com.anyshop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface MainService {

	public void getProductAllList(HttpServletRequest request);

	public void getProductDetail(HttpServletRequest request);

	public void addCart(HttpSession session, HttpServletRequest request);

	public void getCart(HttpSession session, HttpServletRequest request);
	
}