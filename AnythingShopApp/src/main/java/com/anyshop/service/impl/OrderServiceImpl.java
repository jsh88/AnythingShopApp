package com.anyshop.service.impl;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anyshop.dao.OrderDao;
import com.anyshop.domain.Member;
import com.anyshop.domain.Orders;
import com.anyshop.domain.Product;
import com.anyshop.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;

	public void setoDao(OrderDao oDao) {
		this.orderDao = orderDao;
	}

	@Override
	public void getRealOrderProductList(HttpSession session, HttpServletRequest request) {

		ArrayList<Product> pList = (ArrayList<Product>) session.getAttribute("pList");

		ArrayList<Product> orderProductList = new ArrayList<>();

		int count = Integer.parseInt(request.getParameter("count"));

		int totalPrice = 0;

		Product p = null;

		for (int i = 1; i <= count; i++) {

			if (request.getParameter("c" + i) != null) {

				p = pList.get(Integer.parseInt(request.getParameter("c" + i)) - 1);
				p.setQuantity(Integer.parseInt(request.getParameter("q" + i)));
				totalPrice += p.getPrice() * p.getQuantity();
				orderProductList.add(p);

			}
		}

		Member m = null;

		if ((m = (Member) session.getAttribute("member")) != null) {

			request.setAttribute("phone1", m.getPhone().substring(0, 3));
			request.setAttribute("phone2", m.getPhone().substring(4, 8));
			request.setAttribute("phone3", m.getPhone().substring(9, 13));

		}

		session.setAttribute("totalPrice", totalPrice);
		session.setAttribute("orderProductList", orderProductList);

	}

	@Override
	public void addOrder(HttpSession session, HttpServletRequest request) {

		Member m = null;
		String id = null;
		ArrayList<Product> pList = (ArrayList<Product>) session.getAttribute("orderProductList");
		ArrayList<Orders> oList = new ArrayList<Orders>();

		System.out.println(pList.size());
		System.out.println(pList.get(0).getpNo());

		for (int i = 0; i < pList.size(); i++) {
			
			Orders o = new Orders();
			
			o.setpNo(pList.get(i).getpNo());
			o.setPrice(pList.get(i).getPrice());
			o.setQuantity(pList.get(i).getQuantity());
			o.settPrice(pList.get(i).getQuantity() * pList.get(i).getPrice());
			o.setpName(pList.get(i).getName());
			o.setName(request.getParameter("name"));
			o.setAddr("경기도 구로시 구로동 경영기술개발원");
			o.setPhone(
					request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3"));
			o.setrName(request.getParameter("rname"));
			o.setrAddr(request.getParameter("addr1") + request.getParameter("addr2"));
			o.setrPhone(request.getParameter("rphone1") + request.getParameter("rphone2")
					+ request.getParameter("rphone3"));
			o.setMemo(request.getParameter("memo"));
			o.setpWay(request.getParameter("paycheck"));
			
			oList.add(o);
		}

		if ((m = (Member) session.getAttribute("member")) != null)
			id = m.getId();

		oList = orderDao.addOrder(id, oList);

		session.setAttribute("oList", oList);
	}

	@Override
	public void getOrderDetail(HttpSession session, HttpServletRequest request) {

	}
}