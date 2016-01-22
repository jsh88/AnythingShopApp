package com.anyshop.service.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public void getProductDetail(HttpServletRequest request) {
		int pNo = Integer.valueOf(request.getParameter("pNo"));
		Product prod = mainDao.getProductDetail(pNo);

		request.setAttribute("prod", prod);
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
		request.setAttribute("pList", pList);
	}
}
