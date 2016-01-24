package com.anyshop.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.anyshop.dao.ProductDao;
import com.anyshop.domain.Orders;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
	
	// 비회원 주문 
	@Override
	public List<Orders> getOrders(String name, int oNo) {

		return (List<Orders>) jdbcTemplate.query(
				"select o.*, p.name as pname from orders o, product p where o.pno = p.pno and o.name = ? and o.ono = ? order by odate asc, ono desc",
				new Object[] { name, oNo },

				new RowMapper<Orders>() {

					@Override
					public Orders mapRow(ResultSet rs, int rowNum) throws SQLException {

						Orders o = new Orders();

						o.setoNo(oNo);
						o.setId(rs.getString("id"));
						o.setpNo(rs.getInt("pno"));
						o.setAuth(false);
						
						o.setQuantity(rs.getInt("quantity"));
						o.setPhone(rs.getString("phone"));
						o.setPrice(rs.getInt("price"));
						o.settPrice(o.getPrice() * o.getQuantity());
						o.setName(name);
						o.setpName(rs.getString("pname"));
						o.setAddr(rs.getString("addr"));
						o.setoDate(rs.getString("odate"));
						o.setaDate(rs.getString("adate"));
						o.setState(o.getaDate() != null ? true : false);

						return o;

					}
				});
	}

	// 회원 주문
	@Override
	public List<Orders> getOrders(String id) {

		return (List<Orders>) jdbcTemplate.query(
				"select o.*, p.name as pname from orders o, product p where o.pno = p.pno and o.id = ? order by odate asc, ono desc",
				new Object[] { id },

				new RowMapper<Orders>() {

					@Override
					public Orders mapRow(ResultSet rs, int rowNum) throws SQLException {

						Orders o = new Orders();

						o.setoNo(rs.getInt("ono"));
						o.setId(rs.getString("id"));
						o.setpNo(rs.getInt("pno"));
						o.setAuth(true);
						
						o.setQuantity(rs.getInt("quantity"));
						o.setPhone(rs.getString("phone"));
						o.setPrice(rs.getInt("price"));
						o.settPrice(o.getPrice() * o.getQuantity());
						o.setName(rs.getString("name"));
						o.setpName(rs.getString("pname"));
						o.setAddr(rs.getString("addr"));
						o.setoDate(rs.getString("odate"));
						o.setaDate(rs.getString("adate"));
						o.setState(o.getaDate() != null ? true : false);

						return o;

					}
				});
	}

}
