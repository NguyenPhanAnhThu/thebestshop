package com.thebestshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thebestshop.entity.Product;

@Transactional
@Repository
public class ProductDAO {
	@Autowired
	SessionFactory factory;
	
	public List<Product> findAll(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}
	
	public Product findById(Integer id) {
		Session session = factory.getCurrentSession();
		Product entity = (Product)session.get(Product.class, id);
		return entity;
	}

	public Product create(Product entity){
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}
	
	public void update(Product entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}
	
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		session.delete((Product)session.get(Product.class, id));
	}

	public List<Product> findByKeywords(String keywords) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p WHERE "
				+ " p.name LIKE :kw OR "
				+ " p.category.name LIKE :kw";
		Query query = session.createQuery(hql);
		query.setParameter("kw", "%"+keywords+"%");
		List<Product> list = query.list();
		return list;
	}

	public List<Product> findBySpecials(Integer id) {
		Session session = factory.getCurrentSession();
		
		String hql = "FROM Product p";
		Query query = null;
		switch (id) {
		case 0: // Special
			hql = "FROM Product p WHERE p.special=true";
			query = session.createQuery(hql);
			break;
		case 1: // Latest
			hql = "FROM Product p WHERE p.available=true";
			query = session.createQuery(hql);
			break;
		case 2: // Discount
			hql = "FROM Product p "
					+ " WHERE p.discount > 0 ORDER BY p.discount DESC";
			query = session.createQuery(hql);
			query.setMaxResults(12);
			break;
		case 3: // Most viewed
			hql = "FROM Product p "
					+ " WHERE p.viewCount > 0 ORDER BY p.viewCount DESC";
			query = session.createQuery(hql);
			query.setMaxResults(12);
			break;
		}
		List<Product> list = query.list();
		return list;
	}

}
