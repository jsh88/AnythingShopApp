package com.anyshop.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anyshop.dao.MainDao;
import com.anyshop.domain.Product;
import com.anyshop.service.MainService;

@Service
public class MainServiceImpl implements MainService {

	private MainDao mainDao;
	private List<Product> pList = new ArrayList<Product>();
	private List<Product> cookieList = new ArrayList<Product>();

	@Autowired
	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}

	@Override
	public void getProductAllList(HttpServletRequest request) {
		List<Product> pLists = mainDao.getProductAllList();

		request.setAttribute("pList", pLists);
	}

	@Override
	public void getProductDetail(HttpServletRequest request, HttpServletResponse response) {
		int pNo = Integer.valueOf(request.getParameter("pNo"));
		Product prod = mainDao.getProductDetail(pNo);

		request.setAttribute("prod", prod);

		try {
			Cookie pname = new Cookie("prodname", URLEncoder.encode(prod.getName(), "utf-8"));
			pname.setMaxAge(60 * 60 * 24);
			Cookie pimage = new Cookie("prodimage", URLEncoder.encode(prod.getImage(), "utf-8"));
			pimage.setMaxAge(60 * 60 * 24);
			Cookie pprice = new Cookie("prodprice", URLEncoder.encode(Integer.toString(prod.getPrice()), "utf-8"));
			pprice.setMaxAge(60 * 60 * 24);
			Cookie pnoprice = new Cookie("prodprice", URLEncoder.encode(Integer.toString(prod.getpNo()), "utf-8"));
			pprice.setMaxAge(60 * 60 * 24);

			response.addCookie(pname);
			response.addCookie(pimage);
			response.addCookie(pprice);
			addWatchProduct(pname, pimage, pprice, pnoprice);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void addCart(HttpSession session, HttpServletRequest request) {
		Product prod = (Product) session.getAttribute("prod");
		int quentity = Integer.valueOf(request.getParameter("quentity"));
		int check = 0;
		prod.setQuantity(quentity);
		if (pList.size() == 0) {
			pList.add(prod);
		} else {
			for (int i = 0; i < pList.size(); i++) {
				if (prod.getpNo() == pList.get(i).getpNo()) {
					check += 1;
					pList.get(i).setQuantity(quentity);
				}
			}
			if (check == 0) {
				pList.add(prod);
			}
		}
		session.setAttribute("pList", pList);
	}

	@Override
	public void getCart(HttpSession session, HttpServletRequest request) {
		session.setAttribute("pList", pList);
	}

	// 쿠키 리스트에 담기
	@Override
	public void addWatchProduct(Cookie nCookie, Cookie iCookie, Cookie pCookie, Cookie pnoCookie) {
		Product p = new Product();
		try {
			p.setName(URLDecoder.decode(nCookie.getValue(), "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		p.setImage(iCookie.getValue());
		p.setPrice(Integer.parseInt(pCookie.getValue()));
		p.setpNo(Integer.parseInt(pnoCookie.getValue()));
		int count=0;
		for (int i = 0; i < cookieList.size(); i++){
			if(cookieList.get(i).getpNo()==p.getpNo()){
				count++;
			}
		}
		if (count == 0) {
			cookieList.add(p);
		}
			
	}

	@Override
	public void getWatchProduct(HttpServletRequest request) {
		request.setAttribute("cookieList", cookieList);
	}
}
