package com.anyshop.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface MainService {

	public void getProductAllList(HttpServletRequest request);

	public void getProductDetail(HttpServletRequest request, HttpServletResponse response);

	public void addCart(HttpSession session, HttpServletRequest request);

	public void getCart(HttpSession session, HttpServletRequest request);

	public void addWatchProduct(Cookie nCookie, Cookie iCookie, Cookie pCookie, Cookie pnoCookie);

	public void getWatchProduct(HttpServletRequest request);
	
}