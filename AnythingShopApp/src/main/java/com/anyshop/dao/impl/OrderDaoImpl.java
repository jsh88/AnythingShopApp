package com.anyshop.dao.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.anyshop.dao.OrderDao;
import com.anyshop.domain.Orders;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public ArrayList<Orders> addOrder(String id, ArrayList<Orders> oList) {

		String sql = "";

		int seq = jdbcTemplate.queryForObject("select orders_seq.nextval from dual", Integer.class);

		for (int i = 0; i < oList.size(); i++) {

			if (id != null) {

				sql = "insert into orders values(?, ?, ?, 1, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, null, null, 0, 0, 0)";

				jdbcTemplate.update(sql,
						new Object[] { seq, id, oList.get(i).getpNo(), oList.get(i).getQuantity(),
								oList.get(i).getMemo(), oList.get(i).getName(), oList.get(i).getrName(),
								oList.get(i).getAddr(), oList.get(i).getrAddr(), oList.get(i).getPhone(),
								oList.get(i).getrPhone(), oList.get(i).getpWay() });

			} else {

				sql = "insert into orders values(?, 'none', ?, 0, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, null, null, 0, 0, 0)";

				jdbcTemplate.update(sql,
						new Object[] { seq, oList.get(i).getpNo(), oList.get(i).getQuantity(), oList.get(i).getMemo(),
								oList.get(i).getName(), oList.get(i).getrName(), oList.get(i).getAddr(),
								oList.get(i).getrAddr(), oList.get(i).getPhone(), oList.get(i).getrPhone(),
								oList.get(i).getpWay() });
			}
		}

		oList.get(0).setoDate(jdbcTemplate.queryForObject("select sysdate from dual", String.class));
		oList.get(0).setoNo(seq);

		return oList;

	}
}