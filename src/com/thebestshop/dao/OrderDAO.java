package com.thebestshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thebestshop.entity.Order;
import com.thebestshop.entity.OrderDetail;
import com.thebestshop.entity.Product;

@Transactional
@Repository
public class OrderDAO {
	@Autowired
	SessionFactory factory;
	
	public List<Order> findAll(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Order";
		Query query = session.createQuery(hql);
		List<Order> list = query.list();
		return list;
	}
	
	public Order findById(Integer id) {
		Session session = factory.getCurrentSession();
		Order entity = (Order) session.get(Order.class, id);
		return entity;
	}
	
	public Order create(Order entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}
	
	public void update(Order entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}
	
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		session.delete((Order)session.get(Order.class, id));
	}
	
	public void create(Order order, List<OrderDetail> details) {
		Session session = factory.getCurrentSession();
		session.save(order);
		for(OrderDetail detail : details) {
			session.save(detail);
		}		
	}
	
	public List<Order> findByUser(String userId){
		Session session = factory.getCurrentSession();
		String hql = "FROM Order o WHERE o.customer.id=:uid ORDER BY o.orderDate DESC";
		Query query = session.createQuery(hql);
		query.setParameter("uid", userId);
		List<Order> list = query.list();
		return list;
	}
	
	public List<Product> findItemsByUser(String userId){
		Session session = factory.getCurrentSession();
		String hql ="SELECT DISTINCT d.product FROM OrderDetail d WHERE d.order.customer.id=:uid";
		Query query = session.createQuery(hql);
		query.setParameter("uid", userId);
		List<Product> list = query.list();
		return list;
	}
	
}
