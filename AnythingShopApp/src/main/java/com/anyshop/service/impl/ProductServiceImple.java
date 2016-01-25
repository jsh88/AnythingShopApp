package com.anyshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anyshop.dao.ProductDao;
import com.anyshop.domain.Member;
import com.anyshop.domain.Orders;
import com.anyshop.service.ProductService;

@Service
public class ProductServiceImple implements ProductService {

	@Autowired
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public void getOrders(HttpServletRequest request) {
		List<Orders>oList = productDao.getOrders(request.getParameter("name"), Integer.parseInt("ono"));
		ArrayList<Orders> rList = new ArrayList<Orders>();
		int j=0, result = 0;
		for(int i = 0;i<oList.size()-1;i++){
			if(oList.get(i).getoNo()==oList.get(i).getoNo()){
				if(oList.get(i).getpNo()!=oList.get(i).getpNo()){
					result+=oList.get(i).gettPrice();
				}
			}
		}
		
		request.setAttribute("oList", rList);

	}

	@Override
	public void getMemberOrders(HttpSession session, HttpServletRequest request) {

		request.setAttribute("oList", productDao.getOrders(((Member) session.getAttribute("member")).getId()));

	}

}