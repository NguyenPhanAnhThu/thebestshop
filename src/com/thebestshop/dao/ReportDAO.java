package com.thebestshop.dao;

import java.util.List;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class ReportDAO {
	@Autowired
	SessionFactory factory;
	
	public List<Object[]> inventoryByCategory(){
		Session session = factory.getCurrentSession();
		String hql = "SELECT p.category.name,"
				+ " sum(p.quantity),  "
				+ " sum(p.quantity*p.unitPrice), "
				+ " min(p.unitPrice), "
				+ " max(p.unitPrice), "
				+ " avg(p.unitPrice)"
				+ " FROM Product p"
				+ " GROUP BY p.category.name";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}
	
	public List<Object[]> revenueByCategory() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT d.product.category.name,"
				+ " sum(d.quantity),  "
				+ " sum(d.quantity*d.unitPrice*(1-d.discount)), "
				+ " min(d.unitPrice), "
				+ " max(d.unitPrice), "
				+ " avg(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY d.product.category.name";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}
	
	public List<Object[]> revenueByQuarter() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT ceiling(month(d.order.orderDate)/3.0),"
				+ " sum(d.quantity),  "
				+ " sum(d.quantity*d.unitPrice*(1-d.discount)), "
				+ " min(d.unitPrice), "
				+ " max(d.unitPrice), "
				+ " avg(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY ceiling(month(d.order.orderDate)/3.0)"
				+ " ORDER BY ceiling(month(d.order.orderDate)/3.0)";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;	
	}	
}
