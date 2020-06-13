package com.thebestshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thebestshop.entity.OrderDetail;

@Transactional
@Repository
public class OrderDetailDAO {
	@Autowired
	SessionFactory factory;
	
	public List<OrderDetail> findAll(){
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetail";
		Query query = session.createQuery(hql);
		List<OrderDetail> list = query.list();
		return list;
	}
	
	public OrderDetail findById(Integer id) {
		Session session = factory.getCurrentSession();
		OrderDetail entity =(OrderDetail) session.get(OrderDetail.class, id);
		return entity;
	}

	public OrderDetail create(OrderDetail entity){
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}
	
	public void update(OrderDetail entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}
	
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		session.delete((OrderDetail)session.get(OrderDetail.class, id));
	}
}
